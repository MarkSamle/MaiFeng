# from django.contrib import admin
# from django.db import models
# from django.contrib.auth.models import User,Group
# from django.contrib import admin
# from users.models import UserExtension
# from django.utils.timezone import now
# from mdeditor.fields import MDTextField

# from files.models import Images
# # Register your models here.
# from import_export import resources
# from .models import *
# from import_export.admin import ImportExportModelAdmin


# class SupplyResource(resources.ModelResource):

#     class Meta:
#         model = Supply
#         # 导出字段
#         fields = ('id', 'name',)
#         # 导出排序
#         export_order = ('id', 'name', )
#     # 导出中文字段名
#     def get_export_headers(self):
#         vnames = {i.name: i.verbose_name for i in self.Meta.model._meta.fields}
#         return [vnames.get(i.split("__")[0], i) for i in super().get_export_headers()]



# @admin.register(Supply)
# class SupplyAdminModel(ImportExportModelAdmin):
#     resource_class = SupplyResource
#     # date_hierarchy = 'date'   
#     # 添加分页
#     list_per_page = 50
#     # 列表页展示的字段
#     list_display = ('id', 'name','gourl','place','tel','scale','grade','typ', 'desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
#     fieldsets = [(None, {"fields": ['group','name','url','place','tel','scale','grade','typ', 'desc',]})]
#     # 使用到外键下拉的字段
#     autocomplete_fields = ('group','created_by','last_edited_by')
#     # 开放操作动作
#     actions_on_bottom = True
#     # 提供引用查询
#     search_fields=('name','place','created_by__realname' )
#     list_filter = ('scale','grade','typ')
#     # 设置点击编辑字段
#     list_display_links = ( 'id','name',)

#     def save_model(self, request, obj, form, change):
#         if obj.created_by:
#             obj.last_edited_by = request.user.extension
#             super().save_model(request, obj, form, change)
#         else:
#             obj.created_by = request.user.extension
#             obj.last_edited_by = request.user.extension
#             obj.save()
#             qs = Group.objects.filter(user=request.user)
#             if form.cleaned_data['group']:
#                 pass
#             else:
#                 form.cleaned_data['group']=qs
#             super().save_model(request, obj, form, change)
#     def get_queryset(self, request):
#         # 获取查询用户所在组,获取组内用户
#         qs = Group.objects.filter(user=request.user)
#         if request.user.is_superuser:
#             return super( SupplyAdminModel, self).get_queryset(request)
#         else:
#             # data1 = super( SupplyAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
#             ungroups = super( SupplyAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
#             return super( SupplyAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
    
#     def gourl(self, obj):
#         from django.utils.html import format_html
#         if obj.url:
#             return format_html("<a href='%s' target='_blank' style='color:#3ba1df !important;'><u>跳转链接</u></a>" % (obj.url))
#     gourl.short_description = '网址'
#     gourl.allow_tags = True