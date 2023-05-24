# from django.db import models
# from django.contrib import admin
# from users.models import UserExtension
# from django.utils.timezone import now
# from mdeditor.fields import MDTextField
# from django.contrib.auth.models import User,Group
# from django.utils.translation import gettext, gettext_lazy as _

# from import_export import resources
# from import_export.admin import ImportExportModelAdmin
# from .models import *



# class LargeRegionResource(resources.ModelResource):
#     class Meta:
#         model = LargeRegion
#         fields = ('id', 'name','code','place','desc', 'created_date', 'last_edited_date')
#         export_order = ('id', 'name','code' )
#     def get_export_headers(self):
#         vnames = {i.name: i.verbose_name for i in self.Meta.model._meta.fields}
#         return [vnames.get(i.split("__")[0], i) for i in super().get_export_headers()]
# class RegionResource(resources.ModelResource):
#     class Meta:
#         model = Region
#         fields = ('id','code', 'name',)
#         export_order = ('id','code', 'name', )
#     def get_export_headers(self):
#         vnames = {i.name: i.verbose_name for i in self.Meta.model._meta.fields}
#         return [vnames.get(i.split("__")[0], i) for i in super().get_export_headers()]
# class ShopResource(resources.ModelResource):
#     class Meta:
#         model = Shop
#         fields = ('id','name',)
#         export_order = ('id','name', )
#     def get_export_headers(self):
#         vnames = {i.name: i.verbose_name for i in self.Meta.model._meta.fields}
#         return [vnames.get(i.split("__")[0], i) for i in super().get_export_headers()]


# @admin.register(LargeRegion)
# # class LargeRegionAdminModel(admin.ModelAdmin):
# class LargeRegionAdminModel(ImportExportModelAdmin):
#     resource_class = LargeRegionResource
#     # 添加分页
#     list_per_page = 50
#     # 列表页展示的字段
#     list_display = ('id', 'name','code','place','manage','desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
#     fieldsets = [(None, {"fields": ['group','name','code','place','manage','desc',]})]
#     # 使用到外键下拉的字段
#     autocomplete_fields = ('group','manage','created_by','last_edited_by')
#     # 开放操作动作
#     actions_on_bottom = True
#     # 提供引用查询
#     search_fields=('name','code',  'manage__realname','place',)
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
#             return super(LargeRegionAdminModel, self).get_queryset(request)
#         else:
#             ungroups = super(LargeRegionAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
#             return super(LargeRegionAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
# class LargeRegionFilter(admin.SimpleListFilter):
#     title = _('大区') # 指定过滤器名
#     parameter_name = 'largeregion' # 指定过滤器字段
#     # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
#     def lookups(self, request, model_admin):
#         qs = Group.objects.filter(user=request.user)
#         if request.user.is_superuser:
#             chapter = LargeRegion.objects.all()
#             res = []
#             for c in chapter:
#                 res.append((c.id,c.name))
#             return res
#         else:
#             ungroups = LargeRegion.objects.filter(deleted=0).exclude(group__in=qs)
#             chapter = LargeRegion.objects.filter(deleted=0).exclude(id__in=ungroups)
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
#             if queryset.model.__name__ == "Region":
#                 return queryset.filter(largeregion__id__exact=self.value())
#             if queryset.model.__name__ == "Shop":
#                 return queryset.filter(region__largeregion__id__exact=self.value())
#             if queryset.model.__name__ == "Storage":
#                 return queryset.filter(shop__region__largeregion__id__exact=self.value())
#             if queryset.model.__name__ == "Stock":
#                 return queryset.filter(storage__shop__region__largeregion__id__exact=self.value())
#             if queryset.model.__name__ == "SalesDetails":
#                 return queryset.filter(shop__region__largeregion__id__exact=self.value())



# @admin.register(Region)
# # class RegionAdminModel(admin.ModelAdmin):
# class RegionAdminModel(ImportExportModelAdmin):
#     resource_class = RegionResource
#     # 添加分页
#     list_per_page = 50
#     # 列表页展示的字段
#     list_display = ('id', 'largeregion','name','code','place','manage','desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
#     fieldsets = [(None, {"fields": ['group','largeregion','name','code','place','manage','desc',]})]
#     # 使用到外键下拉的字段
#     autocomplete_fields = ('group','largeregion','manage','created_by','last_edited_by')
#     # 开放操作动作
#     actions_on_bottom = True
#     # 提供引用查询
#     search_fields=('name','code',  'manage__realname','place',)
#     list_filter = (LargeRegionFilter,)
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
#             return super(RegionAdminModel, self).get_queryset(request)
#         else:
#             ungroups = super(RegionAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
#             return super(RegionAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
# class RegionFilter(admin.SimpleListFilter):
#     title = _('区域') # 指定过滤器名
#     parameter_name = 'region' # 指定过滤器字段
#     # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
#     def lookups(self, request, model_admin):
#         qs = Group.objects.filter(user=request.user)
#         if request.user.is_superuser:
#             chapter = Region.objects.all()
#             res = []
#             for c in chapter:
#                 res.append((c.id,c.name))
#             return res
#         else:
#             ungroups = Region.objects.filter(deleted=0).exclude(group__in=qs)
#             chapter = Region.objects.filter(deleted=0).exclude(id__in=ungroups)
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
#             if queryset.model.__name__ == "Shop":
#                 return queryset.filter(region__id__exact=self.value())
#             if queryset.model.__name__ == "Storage":
#                 return queryset.filter(shop__region__id__exact=self.value())
#             if queryset.model.__name__ == "Stock":
#                 return queryset.filter(storage__shop__region__id__exact=self.value())
#             if queryset.model.__name__ == "SalesDetails":
#                 return queryset.filter(shop__region__id__exact=self.value())



# @admin.register(Shop)
# # class ShopAdminModel(admin.ModelAdmin):
# class ShopAdminModel(ImportExportModelAdmin):
#     resource_class = ShopResource
#     # 添加分页
#     list_per_page = 50
#     # 列表页展示的字段
#     list_display = ('id', 'largeregion','region','name','code','place','manage','desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
#     fieldsets = [(None, {"fields": ['group','region','name','code','place','manage','desc',]})]
#     # 使用到外键下拉的字段
#     autocomplete_fields = ('group','region','manage','created_by','last_edited_by')
#     # 开放操作动作
#     actions_on_bottom = True
#     # 提供引用查询
#     search_fields=('name','code',  'manage__realname','place',)
#     list_filter = (RegionFilter,LargeRegionFilter,)
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
#             return super(ShopAdminModel, self).get_queryset(request)
#         else:
#             ungroups = super(ShopAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
#             return super(ShopAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
#     def largeregion(self, obj):
#         if obj.region:
#             return obj.region.largeregion
#     largeregion.short_description = '大区'
#     largeregion.allow_tags = True  
# class ShopFilter(admin.SimpleListFilter):
#     title = _('门店') # 指定过滤器名
#     parameter_name = 'shop' # 指定过滤器字段
#     # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
#     def lookups(self, request, model_admin):
#         qs = Group.objects.filter(user=request.user)
#         if request.user.is_superuser:
#             chapter = Shop.objects.all()
#             res = []
#             for c in chapter:
#                 res.append((c.id,c.name))
#             return res
#         else:
#             ungroups = Shop.objects.filter(deleted=0).exclude(group__in=qs)
#             chapter = Shop.objects.filter(deleted=0).exclude(id__in=ungroups)
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
#             if queryset.model.__name__ == "Storage":
#                 return queryset.filter(shop__id__exact=self.value())
#             if queryset.model.__name__ == "Stock":
#                 return queryset.filter(storage__shop__id__exact=self.value())
#             if queryset.model.__name__ == "SalesDetails":
#                 return queryset.filter(shop__id__exact=self.value())
