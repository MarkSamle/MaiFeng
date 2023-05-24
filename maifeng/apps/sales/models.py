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

class Promotion(models.Model):
    """促销计划"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    
    type_choices = ( ('vip', '会员积分'),('discount', '打折促销'),('cut', '满减促销'),('give', '买赠促销'),('free', '满免促销'),('other', '其他促销'))
    # 积分等级 折扣力度 满多少减多少是否单笔可叠加 买几赠几 满几件免几件是否单笔可叠加 其他如赠送搭头
    
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='Promotion_group')
    name = models.CharField(max_length=60, verbose_name='促销计划单号', help_text='促销计划单号（CharField）')
    waresku = models.ManyToManyField(WareSKU,  verbose_name='商品SKU',help_text='商品SKU（ForeignKey）', blank=True, related_name='Promotion_waresku')
    types = models.CharField(max_length=30, verbose_name='促销类型', help_text='促销类型', choices=type_choices, default='discount')
    discount = models.DecimalField( max_digits=10, decimal_places=2,verbose_name='折扣',blank=True,null=True, help_text='折扣（CharField）',default=1)
    content = models.TextField(verbose_name="方案详情", blank=True)
    desc = MDTextField(verbose_name="说明", blank=True)
    grade = models.SmallIntegerField(verbose_name='生效优先级', default=0)# 按这个字段排序
    repeat = models.BooleanField(verbose_name='是否可叠加', help_text='是否可叠加（BooleanField）', default=False)
    entry_date = models.DateTimeField(verbose_name='生效时间', help_text='生效时间（DateTimeField）', null=True, blank=True,)
    stop_date = models.DateTimeField(verbose_name='结束时间', help_text='结束时间（DateTimeField）', null=True, blank=True,)
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Promotion_cb')
    created_date = models.DateTimeField(verbose_name='交易时间', help_text='交易时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Promotion_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    class Meta:
        ordering = ['grade','id']
        verbose_name = '促销计划'
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.name
@admin.register(Promotion)
class PromotionAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'name','types','discount','desc','grade','repeat','entry_date','stop_date','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','types','waresku','name','discount','content','desc','grade','repeat','entry_date','stop_date']})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','waresku','created_by','last_edited_by')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name',)
    list_filter = ('created_date','entry_date','stop_date')
    # 设置点击编辑字段
    list_display_links = ( 'id','name','desc',)

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
            return super(PromotionAdminModel, self).get_queryset(request)
        else:
            ungroups = super(PromotionAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super(PromotionAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)

class Sales(models.Model):
    """交易订单"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='Sales_group')
    promotion = models.ManyToManyField(Promotion, verbose_name='促销计划',help_text='促销计划',blank=True,related_name='Sales_promotion')
    name = models.CharField(max_length=60, verbose_name='交易单号', help_text='交易单号（CharField）')
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Sales_cb')
    created_date = models.DateTimeField(verbose_name='交易时间', help_text='交易时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Sales_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    class Meta:
        ordering = ['-name']
        verbose_name = '交易订单'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return self.name
@admin.register(Sales)
class SalesAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'name','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','promotion','name',]})]
    # fieldsets = [(None, {"fields": ['group','name',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','promotion','created_by','last_edited_by')
    # autocomplete_fields = ('group','created_by','last_edited_by')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name',)
    list_filter = ('created_date',)
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
            return super(SalesAdminModel, self).get_queryset(request)
        else:
            ungroups = super(SalesAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super(SalesAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
class SalesFilter(admin.SimpleListFilter):
    title = _('交易订单') # 指定过滤器名
    parameter_name = 'sales' # 指定过滤器字段
    # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
    def lookups(self, request, model_admin):
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            chapter = Sales.objects.all()
            res = []
            for c in chapter:
                res.append((c.id,c.name))
            return res
        else:
            ungroups = Sales.objects.filter(deleted=0).exclude(group__in=qs)
            chapter = Sales.objects.filter(deleted=0).exclude(id__in=ungroups)
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
            if queryset.model.__name__ == "SalesDetails":
                return queryset.filter(name__id__exact=self.value())

class SalesDetails(models.Model):
    """交易详情"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='SalesDetails_group')
    name = models.ForeignKey(Sales,  verbose_name='交易单号',help_text='交易单号（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Sales')
    shop = models.ForeignKey(Shop,  verbose_name='门店',help_text='门店（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='SalesDetails_shop')
    waresku = models.ForeignKey(WareSKU,  verbose_name='商品SKU',help_text='商品SKU（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='SalesDetails_waresku')
    # fix = models.DecimalField( max_digits=10, decimal_places=2,verbose_name='定价',blank=True,null=True, help_text='定价（CharField）')
    discount = models.DecimalField( max_digits=10, decimal_places=2,verbose_name='折扣',blank=True,null=True, help_text='折扣（CharField）',default=1)
    num = models.IntegerField(verbose_name='交易数量', help_text='交易数量（CharField）', null=True, blank=True, default=0)
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='SalesDetails_cb')
    created_date = models.DateTimeField(verbose_name='交易时间', help_text='交易时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='SalesDetails_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    class Meta:
        ordering = ['-name__name','waresku__code',]
        verbose_name = '交易详情'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return str(self.name)
@admin.register(SalesDetails)
class SalesDetailsAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'name','largeregion','region','shop','merchset','typeset','merchtype','merchtypechild','wares_code','waresku_code','wares','waresku','num','discount','money','allmoney','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','name','shop','waresku','discount','num',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','name','shop','waresku','created_by','last_edited_by')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name__name',)
    # list_filter = (SalesFilter,ShopFilter,RegionFilter,LargeRegionFilter,MerchSetFilter,TypeSetFilter,MerchTypeFilter,MerchTypeChildFilter,)
    list_filter = (ShopFilter,RegionFilter,LargeRegionFilter,MerchSetFilter,TypeSetFilter,MerchTypeFilter,MerchTypeChildFilter,)
    # 设置点击编辑字段
    list_display_links = ( 'id','name','shop','waresku')

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
            return super(SalesDetailsAdminModel, self).get_queryset(request)
        else:
            ungroups = super(SalesDetailsAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super(SalesDetailsAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
    def largeregion(self, obj):
        if obj.shop:
            return obj.shop.region.largeregion
    def region(self, obj):
        if obj.shop:
            return obj.shop.region
        
    def merchset(self, obj):
        if obj.waresku.wares:
            return obj.waresku.wares.merchtypechild.merchtype.typeset.merchset
    def typeset(self, obj):
        if obj.waresku.wares:
            return obj.waresku.wares.merchtypechild.merchtype.typeset
    def merchtype(self, obj):
        if obj.waresku.wares:
            return obj.waresku.wares.merchtypechild.merchtype
    def merchtypechild(self, obj):
        if obj.waresku.wares:
            return obj.waresku.wares.merchtypechild
    def wares_code(self, obj):
        if obj.waresku.wares is not None and obj.waresku.wares.code:
            return obj.waresku.wares.code
    def waresku_code(self, obj):
        if obj.waresku is not None and obj.waresku.code:
            return obj.waresku.code
    def wares(self, obj):
        if obj.waresku.wares is not None:
            return obj.waresku.wares
    def money(self, obj):
        if obj.waresku.fix and obj.discount:
            return round(obj.waresku.fix * obj.discount,2)
    def allmoney(self, obj):
        if obj.waresku.fix and obj.discount and obj.num:
            return round(obj.waresku.fix * obj.discount * obj.num,2)
    # def supply(self, obj):
    #     if obj.waresku.wares is not None and obj.waresku.wares.supply is not None and obj.waresku.wares.supply.name:
    #         return obj.waresku.wares.supply.name
    largeregion.short_description = '大区'
    largeregion.allow_tags = True  
    region.short_description = '区域'
    region.allow_tags = True
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
    # supply.short_description = '供应商'
    # supply.allow_tags = True
    money.short_description = '单价'
    money.allow_tags = True
    allmoney.short_description = '销售额'
    allmoney.allow_tags = True
    
    
