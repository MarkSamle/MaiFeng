from django.db import models

# Create your models here.
from django.db import models
from django.contrib import admin
from users.models import UserExtension
from django.utils.timezone import now
from django.contrib.auth.models import User,Group

# Create your models here.

class SysImages(models.Model):
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    with_models_choices = ( ('page_urls', '页面导航'),('sys_imgs', '系统图标'),('other', '其他'))
    now = str(now().strftime('%Y_%m'))
    

    name = models.CharField(max_length=60, verbose_name='名称', help_text='名称（CharField）')
    img = models.ImageField(upload_to='sys_imgs/%Y/%m/', verbose_name='图片',help_text='图片（ImageField）', null=True, blank=True)
    height = models.PositiveIntegerField(verbose_name='图片高度', help_text='图片高度(PositiveIntegerField)', null=True, blank=True)
    with_models = models.CharField(max_length=60, verbose_name='对应模块', help_text='对应模块（CharField）', choices=with_models_choices, default='page_urls')
    # models_id = models.PositiveIntegerField(verbose_name='模块ID', help_text='模块ID(PositiveIntegerField)', null=True, blank=True)
    # group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='SysImages_group')
    path = models.CharField(max_length=60, verbose_name='对应地址', help_text='对应地址（CharField）',blank=True)

    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Sysimages_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Sysimages_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')

    class Meta:
        ordering = ['id']
        verbose_name = '系统配置'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name
@admin.register(SysImages)
class SysImagesAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'name','show_img', 'img','with_models', 'path','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['name', 'img','with_models',  'path',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('created_by','last_edited_by')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name', )
    list_filter = ('with_models', 'created_date',)
    # 设置点击编辑字段
    list_display_links = ( 'id','name',)

    def has_add_permission(self, request):
        from django.urls import reverse
        from django.shortcuts import redirect
        redirect('admin/')
        # 禁用添加按钮
        return request.user.is_superuser

    def has_delete_permission(self, request, obj=None):
        # 禁用删除按钮
        return request.user.is_superuser


    def save_model(self, request, obj, form, change):
        if request.user.is_superuser:
            if obj.created_by:
                obj.last_edited_by = request.user.extension
                super().save_model(request, obj, form, change)
            else:
                obj.created_by = request.user.extension
                obj.last_edited_by = request.user.extension
                obj.save()
                super().save_model(request, obj, form, change)

    def get_queryset(self, request):
        if request.user.is_superuser:
            return super(SysImagesAdminModel, self).get_queryset(request)
        else:
            return super(SysImagesAdminModel, self).get_queryset(request).filter(id=0)

    def show_img(self, obj):
        from django.utils.html import format_html
        if obj.img is not None and str(obj.img) != '':
            url = '/media/' + str(obj.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    show_img.short_description = '缩略图'
    show_img.allow_tags = True
