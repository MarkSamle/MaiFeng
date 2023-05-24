# from django.db import models
# from django.contrib import admin
# from users.models import UserExtension
# from django.utils.timezone import now
# from mdeditor.fields import MDTextField
# from django.contrib.auth.models import User,Group
# from django.utils.translation import gettext, gettext_lazy as _
# # Register your models here.
# from import_export import resources
# from .models import *
# from import_export.admin import ImportExportModelAdmin

# # MerchSet TypeSet MerchType MerchTypeChild

# class MerchSetResource(resources.ModelResource):
#     class Meta:
#         model = MerchSet
#         fields = ('id', 'name',)
#         export_order = ('id', 'name', )
#     def get_export_headers(self):
#         vnames = {i.name: i.verbose_name for i in self.Meta.model._meta.fields}
#         return [vnames.get(i.split("__")[0], i) for i in super().get_export_headers()]
# class TypeSetResource(resources.ModelResource):
#     class Meta:
#         model = TypeSet
#         fields = ('id', 'name',)
#         export_order = ('id', 'name', )
#     def get_export_headers(self):
#         vnames = {i.name: i.verbose_name for i in self.Meta.model._meta.fields}
#         return [vnames.get(i.split("__")[0], i) for i in super().get_export_headers()]
# class MerchTypeResource(resources.ModelResource):
#     class Meta:
#         model = MerchType
#         fields = ('id', 'name',)
#         export_order = ('id', 'name', )
#     def get_export_headers(self):
#         vnames = {i.name: i.verbose_name for i in self.Meta.model._meta.fields}
#         return [vnames.get(i.split("__")[0], i) for i in super().get_export_headers()]
# class MerchTypeChildResource(resources.ModelResource):
#     class Meta:
#         model = MerchTypeChild
#         fields = ('id', 'name',)
#         export_order = ('id', 'name', )
#     def get_export_headers(self):
#         vnames = {i.name: i.verbose_name for i in self.Meta.model._meta.fields}
#         return [vnames.get(i.split("__")[0], i) for i in super().get_export_headers()]

# @admin.register(MerchSet)
# class MerchSetAdminModel(ImportExportModelAdmin):
#     resource_class = MerchSetResource
#     # 添加分页
#     list_per_page = 50
#     # 列表页展示的字段
#     list_display = ('id', 'name','desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
#     fieldsets = [(None, {"fields": ['group','name','desc',]})]
#     # 使用到外键下拉的字段
#     autocomplete_fields = ('group','created_by','last_edited_by')
#     # 开放操作动作
#     actions_on_bottom = True
#     # 提供引用查询
#     search_fields=('name', )
#     # list_filter = ('fix','with_models','models_id','created_date')
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
#             return super(MerchSetAdminModel, self).get_queryset(request)
#         else:
#             # data1 = super(MerchSetAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
#             ungroups = super(MerchSetAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
#             return super(MerchSetAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
# class MerchSetFilter(admin.SimpleListFilter):
#     title = _('顾客群') # 指定过滤器名
#     parameter_name = 'merchset' # 指定过滤器字段
#     # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
#     def lookups(self, request, model_admin):
#         qs = Group.objects.filter(user=request.user)
#         if request.user.is_superuser:
#             chapter = MerchSet.objects.all()
#             res = []
#             for c in chapter:
#                 res.append((c.id,c.name))
#             return res
#         else:
#             ungroups = MerchSet.objects.filter(deleted=0).exclude(group__in=qs)
#             chapter = MerchSet.objects.filter(deleted=0).exclude(id__in=ungroups)
#             res = []
#             for c in chapter:
#                 res.append((c.id,c.name))
#             return res   #它返回过去的值给了request.GEt
#     # 指定过滤查询返回结果
#     def queryset(self, request, queryset):
#         chapter = request.GET
#         if not chapter:
#             return queryset
#         if self.value() is None:
#             return queryset
#         if self.value():
#             if queryset.model.__name__ == "TypeSet":
#                 return queryset.filter(merchset__id__exact=self.value())
#             if queryset.model.__name__ == "MerchType":
#                 return queryset.filter(typeset__merchset__id__exact=self.value())
#             if queryset.model.__name__ == "MerchTypeChild":
#                 return queryset.filter(merchtype__typeset__merchset__id__exact=self.value())
#             if queryset.model.__name__ == "Wares":
#                 return queryset.filter(merchtypechild__merchtype__typeset__merchset__id__exact=self.value())
#             if queryset.model.__name__ == "WareSKU":
#                 return queryset.filter(wares__merchtypechild__merchtype__typeset__merchset__id__exact=self.value())
#             if queryset.model.__name__ == "Stock":
#                 return queryset.filter(waresku__wares__merchtypechild__merchtype__typeset__merchset__id__exact=self.value())
#             if queryset.model.__name__ == "SalesDetails":
#                 return queryset.filter(waresku__wares__merchtypechild__merchtype__typeset__merchset__id__exact=self.value())



# @admin.register(TypeSet)
# class TypeSetAdminModel(ImportExportModelAdmin):
#     resource_class = TypeSetResource
#     # 添加分页
#     list_per_page = 50
#     # 列表页展示的字段
#     list_display = ('id', 'merchset', 'name','desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
#     fieldsets = [(None, {"fields": ['group','merchset', 'name','desc',]})]
#     # 使用到外键下拉的字段
#     autocomplete_fields = ('group','created_by','last_edited_by','merchset')
#     # 开放操作动作
#     actions_on_bottom = True
#     # 提供引用查询
#     search_fields=('name', )
#     list_filter = (MerchSetFilter,)
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
#             return super( TypeSetAdminModel, self).get_queryset(request)
#         else:
#             # data1 = super( TypeSetAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
#             ungroups = super( TypeSetAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
#             return super( TypeSetAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
# class TypeSetFilter(admin.SimpleListFilter):
#     title = _('品类组') # 指定过滤器名
#     parameter_name = 'typeset' # 指定过滤器字段
#     # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
#     def lookups(self, request, model_admin):
#         qs = Group.objects.filter(user=request.user)
#         if request.user.is_superuser:
#             chapter = TypeSet.objects.all()
#             res = []
#             for c in chapter:
#                 res.append((c.id,c.name))
#             return res
#         else:
#             ungroups = TypeSet.objects.filter(deleted=0).exclude(group__in=qs)
#             chapter = TypeSet.objects.filter(deleted=0).exclude(id__in=ungroups)
#             res = []
#             for c in chapter:
#                 res.append((c.id,c.name))
#             return res   #它返回过去的值给了request.GEt
#     # 指定过滤查询返回结果
#     def queryset(self, request, queryset):
#         chapter = request.GET
#         if not chapter:
#             return queryset
#         if self.value() is None:
#             return queryset
#         if self.value():
#             if queryset.model.__name__ == "MerchType":
#                 return queryset.filter(typeset__id__exact=self.value())
#             if queryset.model.__name__ == "MerchTypeChild":
#                 return queryset.filter(merchtype__typeset__id__exact=self.value())
#             if queryset.model.__name__ == "Wares":
#                 return queryset.filter(merchtypechild__merchtype__typeset__id__exact=self.value())
#             if queryset.model.__name__ == "WareSKU":
#                 return queryset.filter(wares__merchtypechild__merchtype__typeset__id__exact=self.value())
#             if queryset.model.__name__ == "Stock":
#                 return queryset.filter(waresku__wares__merchtypechild__merchtype__typeset__id__exact=self.value())
#             if queryset.model.__name__ == "SalesDetails":
#                 return queryset.filter(waresku__wares__merchtypechild__merchtype__typeset__id__exact=self.value())



# @admin.register(MerchType)
# class MerchTypeAdminModel(ImportExportModelAdmin):
#     resource_class = MerchTypeResource
#     # 添加分页
#     list_per_page = 50
#     # 列表页展示的字段
#     list_display = ('id', 'merchset','typeset','name', 'desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
#     fieldsets = [(None, {"fields": ['group','typeset','name', 'desc',]})]
#     # 使用到外键下拉的字段
#     autocomplete_fields = ('group','created_by','last_edited_by','typeset')
#     # 开放操作动作
#     actions_on_bottom = True
#     # 提供引用查询
#     search_fields=('name', )
#     list_filter = (TypeSetFilter,MerchSetFilter)
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
#             return super( MerchTypeAdminModel, self).get_queryset(request)
#         else:
#             # data1 = super( MerchTypeAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
#             ungroups = super( MerchTypeAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
#             return super( MerchTypeAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)

#     def merchset(self, obj):
#         if obj.typeset:
#             return obj.typeset.merchset
#     merchset.short_description = '顾客群'
#     merchset.allow_tags = True    
# class MerchTypeFilter(admin.SimpleListFilter):
#     title = _('品类') # 指定过滤器名
#     parameter_name = 'merchtype' # 指定过滤器字段
#     # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
#     def lookups(self, request, model_admin):
#         qs = Group.objects.filter(user=request.user)
#         if request.user.is_superuser:
#             chapter = MerchType.objects.all()
#             res = []
#             for c in chapter:
#                 res.append((c.id,c.name))
#             return res
#         else:
#             ungroups = MerchType.objects.filter(deleted=0).exclude(group__in=qs)
#             chapter = MerchType.objects.filter(deleted=0).exclude(id__in=ungroups)
#             res = []
#             for c in chapter:
#                 res.append((c.id,c.name))
#             return res   #它返回过去的值给了request.GEt
#     # 指定过滤查询返回结果
#     def queryset(self, request, queryset):
#         chapter = request.GET
#         if not chapter:
#             return queryset
#         if self.value() is None:
#             return queryset
#         if self.value():
#             if queryset.model.__name__ == "MerchTypeChild":
#                 return queryset.filter(merchtype__id__exact=self.value())
#             if queryset.model.__name__ == "Wares":
#                 return queryset.filter(merchtypechild__merchtype__id__exact=self.value())
#             if queryset.model.__name__ == "WareSKU":
#                 return queryset.filter(wares__merchtypechild__merchtype__id__exact=self.value())
#             if queryset.model.__name__ == "Stock":
#                 return queryset.filter(waresku__wares__merchtypechild__merchtype__id__exact=self.value())
#             if queryset.model.__name__ == "SalesDetails":
#                 return queryset.filter(waresku__wares__merchtypechild__merchtype__id__exact=self.value())



# @admin.register(MerchTypeChild)
# class MerchTypeChildAdminModel(ImportExportModelAdmin):
#     resource_class = MerchTypeChildResource
#     # 添加分页
#     list_per_page = 50
#     # 列表页展示的字段
#     list_display = ('id', 'merchset','typeset','merchtype','name', 'desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
#     fieldsets = [(None, {"fields": ['group','merchtype','name', 'desc',]})]
#     # 使用到外键下拉的字段
#     autocomplete_fields = ('group','created_by','last_edited_by','merchtype')
#     # 开放操作动作
#     actions_on_bottom = True
#     # 提供引用查询
#     search_fields=('name', )
#     list_filter = (MerchTypeFilter,TypeSetFilter,MerchSetFilter)
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
#             return super( MerchTypeChildAdminModel, self).get_queryset(request)
#         else:
#             # data1 = super( MerchTypeChildAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
#             ungroups = super( MerchTypeChildAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
#             return super( MerchTypeChildAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
#     def merchset(self, obj):
#         if obj.merchtype:
#             return obj.merchtype.typeset.merchset
#     def typeset(self, obj):
#         if obj.merchtype:
#             return obj.merchtype.typeset
#     merchset.short_description = '顾客群'
#     merchset.allow_tags = True
#     typeset.short_description = '品类组'
#     typeset.allow_tags = True 
# class MerchTypeChildFilter(admin.SimpleListFilter):
#     title = _('子品类') # 指定过滤器名
#     parameter_name = 'merchtypechild' # 指定过滤器字段
#     # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
#     def lookups(self, request, model_admin):
#         qs = Group.objects.filter(user=request.user)
#         if request.user.is_superuser:
#             chapter = MerchTypeChild.objects.all()
#             res = []
#             for c in chapter:
#                 res.append((c.id,c.name))
#             return res
#         else:
#             ungroups = MerchTypeChild.objects.filter(deleted=0).exclude(group__in=qs)
#             chapter = MerchTypeChild.objects.filter(deleted=0).exclude(id__in=ungroups)
#             res = []
#             for c in chapter:
#                 res.append((c.id,c.name))
#             return res   #它返回过去的值给了request.GEt
#     # 指定过滤查询返回结果
#     def queryset(self, request, queryset):
#         chapter = request.GET
#         if not chapter:
#             return queryset
#         if self.value() is None:
#             return queryset
#         if self.value():
#             if queryset.model.__name__ == "Wares":
#                 return queryset.filter(merchtypechild__id__exact=self.value())
#             if queryset.model.__name__ == "WareSKU":
#                 return queryset.filter(wares__merchtypechild__id__exact=self.value())
#             if queryset.model.__name__ == "Stock":
#                 return queryset.filter(waresku__wares__merchtypechild__id__exact=self.value())
#             if queryset.model.__name__ == "SalesDetails":  
#                 return queryset.filter(waresku__wares__merchtypechild__id__exact=self.value())

