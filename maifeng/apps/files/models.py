from django.contrib import admin
from django.contrib.auth.models import User,Group
from django.db import models
from django.utils.timezone import now
from users.models import UserExtension


class Images(models.Model):
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    now = str(now().strftime('%Y_%m'))

    name = models.CharField(max_length=60, verbose_name='图片名称', help_text='图片名称（CharField）')
    img = models.ImageField(upload_to='imgs/%Y/%m/', verbose_name='图片',help_text='图片（ImageField）', null=True, blank=True)
    height = models.PositiveIntegerField(verbose_name='图片高度', help_text='图片高度(PositiveIntegerField)', null=True, blank=True)
    with_models = models.CharField(max_length=60, verbose_name='对应模块', help_text='对应模块（CharField）', default='wares')
    models_id = models.PositiveIntegerField(verbose_name='模块ID', help_text='模块ID(PositiveIntegerField)', null=True, blank=True)
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='Images_group')

    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='images_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='images_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')

    class Meta:
        ordering = ['-id']
        verbose_name = '图片管理'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
@admin.register(Images)
class ImagesAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'name','show_img', 'img', 'with_models','models_id','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','name', 'img', 'with_models','models_id',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','created_by','last_edited_by')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name', )
    list_filter = ('with_models','models_id','created_date')
    # 设置点击编辑字段
    list_display_links = ( 'id','name',)

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
            return super(ImagesAdminModel, self).get_queryset(request)
        else:
            ungroups = super(ImagesAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super(ImagesAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
        
    def show_img(self, obj):
        from django.utils.html import format_html
        if obj.img is not None and str(obj.img) != '':
            url = '/media/' + str(obj.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    show_img.short_description = '缩略图'
    show_img.allow_tags = True



class Files(models.Model):
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    now = str(now().strftime('%Y_%m'))

    name = models.CharField(max_length=255, verbose_name='文件名称', help_text='文件名称', blank=True)
    fix = models.CharField(max_length=30, verbose_name='后缀名', help_text='后缀名', blank=True)
    size = models.CharField(max_length=30,verbose_name='文件大小', help_text='文件大小',null=True, blank=True)
    path = models.FileField(upload_to='files/%Y/%m/', verbose_name='文件路径', help_text='文件路径（FileField）', null=True, blank=True)

    with_models = models.CharField(max_length=60, verbose_name='对应模块', help_text='对应模块（CharField）', default='wares')
    models_id = models.PositiveIntegerField(verbose_name='模块ID', help_text='模块ID(PositiveIntegerField)', null=True, blank=True)
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='Files_group')

    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='files_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='files_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')

    class Meta:
        ordering = ['-id']
        verbose_name = '文件管理'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
@admin.register(Files)
class FilesAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'name', 'fix','size', 'path', 'with_models','models_id','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','name', 'fix','size', 'path', 'with_models','models_id',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','created_by','last_edited_by')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name', )
    list_filter = ('fix','with_models','models_id','created_date')
    # 设置点击编辑字段
    list_display_links = ( 'id','name',)


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
            return super(FilesAdminModel, self).get_queryset(request)
        else:
            ungroups = super(FilesAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super(FilesAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
