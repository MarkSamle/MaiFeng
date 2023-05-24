from django.conf import settings
from django.contrib import admin
from django.contrib.admin import widgets
from django.contrib.admin.widgets import AutocompleteSelect
from django.contrib.admin.options import get_ul_class
from django.utils import timezone
from django.utils.translation import gettext as _
from django.utils.timezone import now
from django.db.models import Q
from django.contrib.auth.models import User,Group
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, BaseUserManager
from rest_framework.authtoken.models import Token
from tool.txt2pic import txt2pic

# 创建token
# @receiver(post_save, sender=settings.AUTH_USER_MODEL)
# def create_auth_token(sender, instance=None, created=False, **kwargs):
#     if created:
#         Token.objects.create(user=instance)

# 验证码对应
class TelCode(models.Model):
    telephone = models.CharField(max_length=20, verbose_name='电话', help_text='电话（CharField）',blank=True)
    code =  models.CharField(max_length=10, verbose_name='验证码', help_text='验证码（CharField）', blank=True)
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True,auto_now_add=True)
    class Meta:
        verbose_name = '验证码对应'
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.telephone
# @admin.register(TelCode)
# class TelCodeAdminModel(admin.ModelAdmin):
#     # 添加分页
#     list_per_page = 50
#     # 列表页展示的字段
#     list_display = ('id','telephone', 'code','created_date')
#     fieldsets = [(None, {"fields": []})]

# 用户拓展信息
class UserExtension(models.Model):
    sex_choices = ( ('0', '男'), ('1', '女') )
    user = models.OneToOneField(User, verbose_name='用户ID', help_text='用户ID（OneToOneField）', on_delete=models.CASCADE, related_name='extension')
    portrait = models.ForeignKey('Portrait', verbose_name='用户头像', null=True, blank=True, on_delete=models.SET_NULL)
    realname = models.CharField(max_length=30, verbose_name='真实姓名', help_text='真实姓名（CharField）', blank=True)
    desc = models.CharField(max_length=120, verbose_name='个性签名', help_text='个性签名（CharField）', blank=True)
    sex = models.CharField(max_length=1, verbose_name='性别', help_text='性别（CharField，可选值：0，1）', blank=True, choices=sex_choices, default='0')
    telephone = models.CharField(max_length=20, verbose_name='电话', help_text='电话（CharField）',blank=True)
    birthday = models.DateField(verbose_name='生日', help_text='生日（DateField）', null=True, blank=True)
    visits = models.PositiveIntegerField(verbose_name='访问次数', help_text='访问次数（PositiveIntegerField）', null=True, blank=True,default=0)
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='UserExtension_group')
    
    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.realname
@admin.register(UserExtension)
class UserExtensionAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id','user','portrait', 'realname','desc', 'sex', 'telephone', 'birthday')
    fieldsets = [(None, {"fields": ['group','portrait', 'realname','desc', 'sex', 'telephone', 'birthday']})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','user',)
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields = ('user__username', 'realname',)
    # 设置点击编辑字段
    list_display_links = ( 'id','realname','user')
    
    def has_add_permission(self, request):
        # 禁用添加按钮
        return False
    def has_delete_permission(self, request, obj=None):
        # 禁用删除按钮
        return False
    def get_queryset(self, request):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            return super(UserExtensionAdminModel, self).get_queryset(request)
        else:
            # data1 = super(MerchSetAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
            ungroups = super(UserExtensionAdminModel, self).get_queryset(request).filter(user__is_active=True).exclude(group__in=qs)
            groups = super(UserExtensionAdminModel, self).get_queryset(request).filter(user__is_active=True).exclude(id__in=ungroups)
            return super(UserExtensionAdminModel, self).get_queryset(request).filter(user__is_active=True).filter(Q(id__in=groups)|Q(user=request.user))
    # def get_queryset(self, request):
    #     # 获取查询用户所在组,获取组内用户
    #     qs = Group.objects.filter(user=request.user)
    #     userItem = []
    #     for thegroup in qs:
    #         for theuser in thegroup.user_set.all():
    #             userItem.append(theuser.id)
    #     # 如果是超级用户
    #     if request.user.is_superuser:
    #         return super(UserExtensionAdminModel, self).get_queryset(request)
    #     else:
    #         return super(UserExtensionAdminModel, self).get_queryset(request).filter(user__is_active=True).filter(user__in=userItem)

# 肖像图片
class Portrait(models.Model):
    """
    肖像图片
    """
    del_choices = ( ('0', '未删除'), ('1', '已删除'))
    portrait = models.ImageField(upload_to='img/user/portrait', verbose_name='头像', help_text='头像（ImageField）',blank=True)
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='Portrait_group')
    created_by = models.ForeignKey(UserExtension, verbose_name='创建人ID', help_text='创建人ID（ForeignKey）', null=True, blank=True,on_delete=models.SET_NULL, related_name='portrait_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True,auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension, verbose_name='最后编辑人ID', help_text='最后编辑人ID（ForeignKey）', null=True,blank=True, on_delete=models.SET_NULL, related_name='portrait_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True,blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）',choices=del_choices, default='0')
    class Meta:
        ordering = ['-id']
        verbose_name = '用户头像'
        verbose_name_plural = verbose_name
    def __str__(self):
        return str(self.portrait)
@admin.register(Portrait)
class PortraitAdminModel(admin.ModelAdmin):
    list_per_page = 50
    actions_on_bottom = True
    list_display = ('id', 'show_img','portrait', 'created_by', 'created_date', 'last_edited_by', 'last_edited_date', 'deleted')
    fieldsets = [(None, {"fields": ['group','portrait',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group',)
    def show_img(self, obj):
        from django.utils.html import format_html
        if obj.portrait is not None and str(obj.portrait) != '':
            url = '/media/' + str(obj.portrait)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 60, 60))
        else:
            return ''
    show_img.short_description = '头像'
    show_img.allow_tags = True
    def save_model(self, request, obj, form, change):
        if obj.created_by:
            obj.last_edited_by = request.user.extension
            super().save_model(request, obj, form, change)
        else:
            obj.created_by = request.user.extension
            obj.last_edited_by = request.user.extension
            obj.save()
            qs = Group.objects.filter(user=request.user)
            if form.cleaned_data['group']:
                pass
            else:
                form.cleaned_data['group']=qs
            super().save_model(request, obj, form, change)
    def get_queryset(self, request):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            return super(PortraitAdminModel, self).get_queryset(request)
        else:
            # data1 = super(MerchSetAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
            ungroups = super(PortraitAdminModel, self).get_queryset(request).filter(created_by__user__is_active=True).filter(deleted=0).exclude(group__in=qs)
            groups = super(PortraitAdminModel, self).get_queryset(request).filter(created_by__user__is_active=True).filter(deleted=0).exclude(id__in=ungroups)
            return super(PortraitAdminModel, self).get_queryset(request).filter(created_by__user__is_active=True).filter(deleted=0).filter(Q(id__in=groups)|Q(created_by__user=request.user))
        
            # ungroups = super(PortraitAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            # return super(PortraitAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
    # def get_queryset(self, request):
    #     # 获取查询用户所在组,获取组内用户
    #     qs = Group.objects.filter(user=request.user)
    #     userItem = []
    #     for thegroup in qs:
    #         for theuser in thegroup.user_set.all():
    #             userItem.append(theuser.id)
    #     # 如果是超级用户
    #     if request.user.is_superuser:
    #         return super(PortraitAdminModel, self).get_queryset(request).filter(deleted=0)
    #     else:
    #         return super(PortraitAdminModel, self).get_queryset(request).filter(deleted=0).filter(created_by__user__in=userItem)
    

@receiver(post_save, sender=User)
# 同步用户分组
# def save_user_group(sender, instance, created, **kwargs):
#     if created:
#         UserExtension.objects.create(user = instance)
#     else:
#         instance.extension.save()
# 同步创建用户拓展信息功能
def create_user_extension(sender, instance, created, **kwargs):
    if created:
        UserExtension.objects.create(user = instance)
    else:
        instance.extension.save()
