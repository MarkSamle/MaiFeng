# from django.db import models
# from django.contrib import admin
# from users.models import UserExtension
# from django.utils.timezone import now
# from mdeditor.fields import MDTextField
# from django.contrib.auth.models import User,Group
# from django.utils.translation import gettext, gettext_lazy as _
# from store.models import Shop
# from store.admin import LargeRegionFilter,RegionFilter,ShopFilter
# from merch.models import MerchSetFilter,TypeSetFilter,MerchTypeFilter,MerchTypeChildFilter
# from wares.models import WareSKU

# from import_export import resources
# from .models import *
# from import_export.admin import ImportExportModelAdmin

# class StorageResource(resources.ModelResource):
#     class Meta:
#         model = Storage
#         fields = ('id', 'name',)
#         export_order = ('id', 'name', )
#     def get_export_headers(self):
#         vnames = {i.name: i.verbose_name for i in self.Meta.model._meta.fields}
#         return [vnames.get(i.split("__")[0], i) for i in super().get_export_headers()]
# class StockResource(resources.ModelResource):
#     class Meta:
#         model = Stock
#         fields = ('id', 'storage__name',)
#         export_order = ('id', 'storage__name', )
#     def get_export_headers(self):
#         vnames = {i.name: i.verbose_name for i in self.Meta.model._meta.fields}
#         return [vnames.get(i.split("__")[0], i) for i in super().get_export_headers()]


# @admin.register(Storage)
# # class StorageAdminModel(admin.ModelAdmin):
# class StorageAdminModel(ImportExportModelAdmin):
#     resource_class = StorageResource
#     # 添加分页
#     list_per_page = 50
#     # 列表页展示的字段
#     list_display = ('id', 'largeregion','region','shop','name','code','place','manage','desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
#     fieldsets = [(None, {"fields": ['group','shop','name','code','place','manage','desc',]})]
#     # 使用到外键下拉的字段
#     autocomplete_fields = ('group','shop','manage','created_by','last_edited_by')
#     # 开放操作动作
#     actions_on_bottom = True
#     # 提供引用查询
#     search_fields=('name','code', 'manage__realname','place',)
#     list_filter = (ShopFilter,RegionFilter,LargeRegionFilter,)
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
#             return super(StorageAdminModel, self).get_queryset(request)
#         else:
#             ungroups = super(StorageAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
#             return super(StorageAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
#     def largeregion(self, obj):
#         if obj.shop:
#             return obj.shop.region.largeregion
#     def region(self, obj):
#         if obj.shop:
#             return obj.shop.region
#     largeregion.short_description = '大区'
#     largeregion.allow_tags = True  
#     region.short_description = '区域'
#     region.allow_tags = True
# class StorageFilter(admin.SimpleListFilter):
#     title = _('仓库') # 指定过滤器名
#     parameter_name = 'storage' # 指定过滤器字段
#     # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
#     def lookups(self, request, model_admin):
#         qs = Group.objects.filter(user=request.user)
#         if request.user.is_superuser:
#             chapter = Storage.objects.all()
#             res = []
#             for c in chapter:
#                 res.append((c.id,c.name))
#             return res
#         else:
#             ungroups = Storage.objects.filter(deleted=0).exclude(group__in=qs)
#             chapter = Storage.objects.filter(deleted=0).exclude(id__in=ungroups)
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
#             if queryset.model.__name__ == "Stock":
#                 return queryset.filter(storage__id__exact=self.value())


# @admin.register(Stock)
# # class StockAdminModel(admin.ModelAdmin):
# class StockAdminModel(ImportExportModelAdmin):
#     resource_class = StockResource
#     # 添加分页
#     list_per_page = 50
#     # 列表页展示的字段
#     list_display = ('id', 'largeregion','region','shop','storage','merchset','typeset','merchtype','merchtypechild','wares_code','waresku_code','wares','waresku','supply','stock','waystock',)
#     fieldsets = [(None, {"fields": ['group','storage','waresku','stock','waystock',]})]
#     # 使用到外键下拉的字段
#     autocomplete_fields = ('group','storage','waresku','created_by','last_edited_by')
#     # 开放操作动作
#     actions_on_bottom = True
#     # 提供引用查询
#     search_fields=('storage__name','storage__code','waresku__name','waresku__code',)
#     list_filter = (StorageFilter,ShopFilter,RegionFilter,LargeRegionFilter,MerchSetFilter,TypeSetFilter,MerchTypeFilter,MerchTypeChildFilter,)
#     # 设置点击编辑字段
#     list_display_links = ( 'id','storage','waresku')

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
#             return super(StockAdminModel, self).get_queryset(request)
#         else:
#             ungroups = super(StockAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
#             return super(StockAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
#     def largeregion(self, obj):
#         if obj.storage.shop:
#             return obj.storage.shop.region.largeregion
#     def region(self, obj):
#         if obj.storage.shop:
#             return obj.storage.shop.region
#     def shop(self, obj):
#         if obj.storage.shop:
#             return obj.storage.shop
        
#     def merchset(self, obj):
#         if obj.waresku.wares:
#             return obj.waresku.wares.merchtypechild.merchtype.typeset.merchset
#     def typeset(self, obj):
#         if obj.waresku.wares:
#             return obj.waresku.wares.merchtypechild.merchtype.typeset
#     def merchtype(self, obj):
#         if obj.waresku.wares:
#             return obj.waresku.wares.merchtypechild.merchtype
#     def merchtypechild(self, obj):
#         if obj.waresku.wares:
#             return obj.waresku.wares.merchtypechild
#     def wares_code(self, obj):
#         if obj.waresku.wares is not None and obj.waresku.wares.code:
#             return obj.waresku.wares.code
#     def waresku_code(self, obj):
#         if obj.waresku is not None and obj.waresku.code:
#             return obj.waresku.code
#     def wares(self, obj):
#         if obj.waresku.wares is not None:
#             return obj.waresku.wares
#     def supply(self, obj):
#         if obj.waresku.wares is not None and obj.waresku.wares.supply is not None and obj.waresku.wares.supply.name:
#             return obj.waresku.wares.supply.name
#     largeregion.short_description = '大区'
#     largeregion.allow_tags = True  
#     region.short_description = '区域'
#     region.allow_tags = True
#     shop.short_description = '门店'
#     shop.allow_tags = True
#     merchset.short_description = '顾客群'
#     merchset.allow_tags = True
#     typeset.short_description = '品类组'
#     typeset.allow_tags = True 
#     merchtype.short_description = '品类'
#     merchtype.allow_tags = True 
#     merchtypechild.short_description = '子品类'
#     merchtypechild.allow_tags = True 
#     wares_code.short_description = '货号'
#     wares_code.allow_tags = True
#     waresku_code.short_description = '色号'
#     waresku_code.allow_tags = True
#     wares.short_description = '商品'
#     wares.allow_tags = True
#     supply.short_description = '供应商'
#     supply.allow_tags = True

