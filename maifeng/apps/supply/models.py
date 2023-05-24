from django.db import models
from django.contrib.auth.models import User,Group
from django.contrib import admin
from users.models import UserExtension
from django.utils.timezone import now
from mdeditor.fields import MDTextField

from files.models import Images

## 供应商
class Supply(models.Model):
    """供应商"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    scale_choices = ( ('10', '10W'),('50', '50W'),('100', '100W'),('200', '200W'),('300', '300W'),('500', '500W'),('800', '800W'),('1000', '1000W'),('2000', '2000W'),('3000', '3000W'),('5000', '5000W'),('10000', '10000W'),('100000', '100000W'))
    grade_choices = ( ('A', 'A级'),('B', 'B级'),('C', 'C级'),('D', 'D级'),('E', 'E级'),('F', 'F级'))
    typ_choices = ( ('factory', '工厂'),('distribute', '经销'),('wholesale', '批发'),('other', '其他'))

    name = models.CharField(max_length=60, verbose_name='供应商', help_text='供应商（CharField）')
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='Supply_group')
    
    url = models.TextField(verbose_name='网址', help_text='网址（TextField）', blank=True)
    # 所在地（产地）、联系方式、规模、评级
    place = models.TextField(verbose_name='位置/产地', help_text='位置/产地（TextField）', blank=True)
    tel = models.CharField(max_length=11, verbose_name='电话', help_text='电话（CharField）',blank=True)
    scale = models.CharField(max_length=11, verbose_name='规模', help_text='规模（CharField）',blank=True, choices=scale_choices, default='10')
    grade = models.CharField(max_length=5, verbose_name='级别', help_text='级别（CharField）',blank=True, choices=grade_choices, default='C')
    typ = models.CharField(max_length=10, verbose_name='类型', help_text='类型（CharField）',blank=True, choices=typ_choices, default='other')
    desc = MDTextField(verbose_name="说明", blank=True)
    img = models.ForeignKey(Images,  verbose_name='图片',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='supply_img')
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Supply_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Supply_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    
    class Meta:
        ordering = ['-id']
        verbose_name = '供应商'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return self.name

@admin.register(Supply)
class SupplyAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'show_img','name','gourl','place','tel','scale','grade','typ', 'desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','name','img','url','place','tel','scale','grade','typ', 'desc',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','created_by','last_edited_by')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name','place','created_by__realname' )
    list_filter = ('scale','grade','typ')
    # 设置点击编辑字段
    list_display_links = ( 'id','name',)


    # 增加自定义按钮
    # actions = ['import_button', 'export_button']

    # def export_button(self, request, queryset):
    #     from .serializers import SupplySerializer
    #     from django.contrib import messages
    #     Supply_json = SupplySerializer(queryset, many=True).data
    #     print(Supply_json)
    #     messages.add_message(request, messages.SUCCESS, '导出成功!')
    
    # export_button.short_description = ' 导出'
    # export_button.icon = 'fas fa-file-download'
    # export_button.style = 'color:black;background-color:#FFFFFF;'
    # export_button.confirm = '确认导出？'

    # def import_button(self, request, queryset):
    #     # messages.add_message(request, messages.SUCCESS, '导入成功!')
    #     pass
    # import_button.short_description = ' 导入'
    # import_button.icon = 'fas fa-file-upload'
    # import_button.style = 'color:black;background-color:#FFFFFF;'
    # import_button.confirm = '确认导入？'

    def show_img(self, obj):
        from django.utils.html import format_html
        if obj.img is not None and obj.img.img is not None and str(obj.img.img) != '':
            url = '/media/' + str(obj.img.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''

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
            return super( SupplyAdminModel, self).get_queryset(request)
        else:
            # data1 = super( SupplyAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
            ungroups = super( SupplyAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super( SupplyAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
    
    def gourl(self, obj):
        from django.utils.html import format_html
        if obj.url:
            return format_html("<a href='%s' target='_blank' style='color:#3ba1df !important;'><u>跳转链接</u></a>" % (obj.url))
    gourl.short_description = '网址'
    gourl.allow_tags = True
    show_img.short_description = '图像'
    show_img.allow_tags = True