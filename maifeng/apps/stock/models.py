from django.db import models
from django.contrib import admin
from users.models import UserExtension
from django.utils.timezone import now
from mdeditor.fields import MDTextField
from django.contrib.auth.models import User,Group
from django.utils.translation import gettext, gettext_lazy as _
from store.models import Shop
from store.models import LargeRegionFilter,RegionFilter,ShopFilter
from merch.models import MerchSetFilter,TypeSetFilter,MerchTypeFilter,MerchTypeChildFilter
from wares.models import WareSKU
from files.models import Images

class Storage(models.Model):
    """仓库管理"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    
    shop = models.ForeignKey(Shop,  verbose_name='对应门店',help_text='对应门店（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='shop')
    
    name = models.CharField(max_length=60, verbose_name='仓库', help_text='仓库（CharField）')
    code = models.CharField(max_length=255, verbose_name='编号',blank=True, help_text='编号（CharField）')
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='Storage_group')
    place = models.TextField(verbose_name='位置', help_text='位置（TextField）', blank=True)
    manage = models.ForeignKey(UserExtension,  verbose_name='负责人',help_text='负责人（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Storage_manage')
    desc = MDTextField(verbose_name="说明", blank=True)
    img = models.ForeignKey(Images,  verbose_name='图片',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='storage_img')
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Storage_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Storage_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    
    class Meta:
        ordering = ['shop__region__largeregion__name','shop__region__name','shop__code','code']
        verbose_name = '存储仓库'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return self.name
@admin.register(Storage)
class StorageAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'largeregion','region','shop','name','code','show_img','place','manage','desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','shop','name','code','img','place','manage','desc',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','shop','manage','created_by','last_edited_by')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name','code', 'manage__realname','place',)
    list_filter = (ShopFilter,RegionFilter,LargeRegionFilter,)
    # 设置点击编辑字段
    list_display_links = ( 'id','name',)
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
            return super(StorageAdminModel, self).get_queryset(request)
        else:
            ungroups = super(StorageAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super(StorageAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
    def largeregion(self, obj):
        if obj.shop:
            if obj.shop.region:
                return obj.shop.region.largeregion
    def region(self, obj):
        if obj.shop:
            return obj.shop.region
    largeregion.short_description = '大区'
    largeregion.allow_tags = True  
    region.short_description = '区域'
    region.allow_tags = True
    show_img.short_description = '图像'
    show_img.allow_tags = True
class StorageFilter(admin.SimpleListFilter):
    title = _('仓库') # 指定过滤器名
    parameter_name = 'storage' # 指定过滤器字段
    # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
    def lookups(self, request, model_admin):
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            chapter = Storage.objects.all()
            res = []
            for c in chapter:
                res.append((c.id,c.name))
            return res
        else:
            ungroups = Storage.objects.filter(deleted=0).exclude(group__in=qs)
            chapter = Storage.objects.filter(deleted=0).exclude(id__in=ungroups)
            res = []
            for c in chapter:
                res.append((c.id,c.name))
            return res   #它返回过去的值给了request.GEt
    # 指定过滤查询返回结果
    def queryset(self, request, queryset):
        chapter = request.GET
        if not chapter:
            return queryset
        if self.value() is None:
            return queryset
        if self.value():
            if queryset.model.__name__ == "Stock":
                return queryset.filter(storage__id__exact=self.value())


class Stock(models.Model):
    """仓储库存"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='Stock_group')
    
    storage = models.ForeignKey(Storage,  verbose_name='仓库',help_text='仓库（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='storage')
    waresku = models.ForeignKey(WareSKU,  verbose_name='商品SKU',help_text='商品SKU（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='waresku')
    stock = models.IntegerField(verbose_name='现存库存', help_text='现存库存（CharField）', null=True, blank=True, default=0)
    waystock = models.IntegerField(verbose_name='在途库存', help_text='在途库存（CharField）', null=True, blank=True, default=0)
    
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Stock_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Stock_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    
    class Meta:
        ordering = ['storage__code','waresku__code',]
        verbose_name = '存储库存'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return str(self.stock)
@admin.register(Stock)
class StockAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'largeregion','region','shop','storage','merchset','typeset','merchtype','merchtypechild','wares_code','waresku_code','wares','waresku','supply','stock','waystock',)
    fieldsets = [(None, {"fields": ['group','storage','waresku','stock','waystock',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','storage','waresku','created_by','last_edited_by')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('storage__name','storage__code','waresku__name','waresku__code',)
    list_filter = (StorageFilter,ShopFilter,RegionFilter,LargeRegionFilter,MerchSetFilter,TypeSetFilter,MerchTypeFilter,MerchTypeChildFilter,)
    # 设置点击编辑字段
    list_display_links = ( 'id','storage','waresku')

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
            return super(StockAdminModel, self).get_queryset(request)
        else:
            ungroups = super(StockAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super(StockAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
    def largeregion(self, obj):
        if obj.storage.shop:
            return obj.storage.shop.region.largeregion
    def region(self, obj):
        if obj.storage.shop:
            return obj.storage.shop.region
    def shop(self, obj):
        if obj.storage.shop:
            return obj.storage.shop
        
    def merchset(self, obj):
        if obj.waresku is not None:
            if obj.waresku.wares:
                return obj.waresku.wares.merchtypechild.merchtype.typeset.merchset
    def typeset(self, obj):
        if obj.waresku is not None:
            if obj.waresku.wares:
                return obj.waresku.wares.merchtypechild.merchtype.typeset
    def merchtype(self, obj):
        if obj.waresku is not None:
            if obj.waresku.wares:
                return obj.waresku.wares.merchtypechild.merchtype
    def merchtypechild(self, obj):
        if obj.waresku is not None:
            if obj.waresku.wares:
                return obj.waresku.wares.merchtypechild
    def wares_code(self, obj):
        if obj.waresku is not None:
            if obj.waresku.wares is not None and obj.waresku.wares.code:
                return obj.waresku.wares.code
    def waresku_code(self, obj):
        if obj.waresku is not None and obj.waresku.code:
            return obj.waresku.code
    def wares(self, obj):
        if obj.waresku is not None:
            if obj.waresku.wares is not None:
                return obj.waresku.wares
    def supply(self, obj):
        if obj.waresku is not None:
            if obj.waresku.wares is not None and obj.waresku.wares.supply is not None and obj.waresku.wares.supply.name:
                return obj.waresku.wares.supply.name
    largeregion.short_description = '大区'
    largeregion.allow_tags = True  
    region.short_description = '区域'
    region.allow_tags = True
    shop.short_description = '门店'
    shop.allow_tags = True
    merchset.short_description = '顾客群'
    merchset.allow_tags = True
    typeset.short_description = '品类组'
    typeset.allow_tags = True 
    merchtype.short_description = '品类'
    merchtype.allow_tags = True 
    merchtypechild.short_description = '子品类'
    merchtypechild.allow_tags = True 
    wares_code.short_description = '货号'
    wares_code.allow_tags = True
    waresku_code.short_description = '色号'
    waresku_code.allow_tags = True
    wares.short_description = '商品'
    wares.allow_tags = True
    supply.short_description = '供应商'
    supply.allow_tags = True


    
