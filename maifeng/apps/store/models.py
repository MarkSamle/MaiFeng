from django.db import models
from django.contrib import admin
from users.models import UserExtension
from django.utils.timezone import now
from mdeditor.fields import MDTextField
from django.contrib.auth.models import User,Group
from django.utils.translation import gettext, gettext_lazy as _
from files.models import Images
# Create your models here.
class LargeRegion(models.Model):
    """经营大区"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    name = models.CharField(max_length=60, verbose_name='大区', help_text='大区（CharField）')
    code = models.CharField(max_length=255, verbose_name='编号',blank=True, help_text='编号（CharField）')
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='LR_group')
    place = models.TextField(verbose_name='位置', help_text='位置（TextField）', blank=True)
    manage = models.ForeignKey(UserExtension,  verbose_name='负责人',help_text='负责人（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='LR_manage')
    desc = MDTextField(verbose_name="说明", blank=True) 
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='LR_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='LR_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    
    class Meta:
        ordering = ['name']
        verbose_name = '经营大区'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return self.name
@admin.register(LargeRegion)
class LargeRegionAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'name','code','place','manage','desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','name','code','place','manage','desc',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','manage','created_by','last_edited_by')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name','code',  'manage__realname','place',)
    # list_filter = ('fix','with_models','models_id','created_date')
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
            return super(LargeRegionAdminModel, self).get_queryset(request)
        else:
            ungroups = super(LargeRegionAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super(LargeRegionAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
class LargeRegionFilter(admin.SimpleListFilter):
    title = _('大区') # 指定过滤器名
    parameter_name = 'largeregion' # 指定过滤器字段
    # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
    def lookups(self, request, model_admin):
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            chapter = LargeRegion.objects.all()
            res = []
            for c in chapter:
                res.append((c.id,c.name))
            return res
        else:
            ungroups = LargeRegion.objects.filter(deleted=0).exclude(group__in=qs)
            chapter = LargeRegion.objects.filter(deleted=0).exclude(id__in=ungroups)
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
            if queryset.model.__name__ == "Region":
                return queryset.filter(largeregion__id__exact=self.value())
            if queryset.model.__name__ == "Shop":
                return queryset.filter(region__largeregion__id__exact=self.value())
            if queryset.model.__name__ == "Storage":
                return queryset.filter(shop__region__largeregion__id__exact=self.value())
            if queryset.model.__name__ == "Stock":
                return queryset.filter(storage__shop__region__largeregion__id__exact=self.value())
            if queryset.model.__name__ == "SalesDetails":
                return queryset.filter(shop__region__largeregion__id__exact=self.value())
    

class Region(models.Model):
    """经营区域"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    largeregion = models.ForeignKey(LargeRegion,  verbose_name='大区',help_text='大区（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='largeregion')
    name = models.CharField(max_length=60, verbose_name='区域', help_text='区域（CharField）')
    code = models.CharField(max_length=255, verbose_name='编号',blank=True, help_text='编号（CharField）')
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='Region_group')
    place = models.TextField(verbose_name='位置', help_text='位置（TextField）', blank=True)
    manage = models.ForeignKey(UserExtension,  verbose_name='负责人',help_text='负责人（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Region_manage')
    desc = MDTextField(verbose_name="说明", blank=True) 
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Region_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Region_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    
    class Meta:
        ordering = ['largeregion__name','name']
        verbose_name = '经营区域'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return self.name
@admin.register(Region)
class RegionAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'largeregion','name','code','place','manage','desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','largeregion','name','code','place','manage','desc',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','largeregion','manage','created_by','last_edited_by')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name','code',  'manage__realname','place',)
    list_filter = (LargeRegionFilter,)
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
            return super(RegionAdminModel, self).get_queryset(request)
        else:
            ungroups = super(RegionAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super(RegionAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
class RegionFilter(admin.SimpleListFilter):
    title = _('区域') # 指定过滤器名
    parameter_name = 'region' # 指定过滤器字段
    # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
    def lookups(self, request, model_admin):
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            chapter = Region.objects.all()
            res = []
            for c in chapter:
                res.append((c.id,c.name))
            return res
        else:
            ungroups = Region.objects.filter(deleted=0).exclude(group__in=qs)
            chapter = Region.objects.filter(deleted=0).exclude(id__in=ungroups)
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
            if queryset.model.__name__ == "Shop":
                return queryset.filter(region__id__exact=self.value())
            if queryset.model.__name__ == "Storage":
                return queryset.filter(shop__region__id__exact=self.value())
            if queryset.model.__name__ == "Stock":
                return queryset.filter(storage__shop__region__id__exact=self.value())
            if queryset.model.__name__ == "SalesDetails":
                return queryset.filter(shop__region__id__exact=self.value())


class ShopType(models.Model):
    """门店类型"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    name = models.CharField(max_length=4, verbose_name='门店类型', help_text='门店类型（CharField）')
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='ShopType_group')
    desc = MDTextField(verbose_name="说明", blank=True) 
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='ShopType_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='ShopType_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    class Meta:
        ordering = ['-id']
        verbose_name = '门店类型'
        verbose_name_plural = verbose_name
    def __str__(self):
        return self.name
@admin.register(ShopType)
class ShopTypeAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'name','desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','name','desc',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','created_by','last_edited_by')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name',)
    # list_filter = (RegionFilter,LargeRegionFilter,)
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
            return super(ShopTypeAdminModel, self).get_queryset(request)
        else:
            ungroups = super(ShopTypeAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super(ShopTypeAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)

class ShopTypeFilter(admin.SimpleListFilter):
    title = _('门店类型') # 指定过滤器名
    parameter_name = 'shoptype' # 指定过滤器字段
    # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
    def lookups(self, request, model_admin):
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            chapter = ShopType.objects.all()
            res = []
            for c in chapter:
                res.append((c.id,c.name))
            return res
        else:
            ungroups = ShopType.objects.filter(deleted=0).exclude(group__in=qs)
            chapter = ShopType.objects.filter(deleted=0).exclude(id__in=ungroups)
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
            if queryset.model.__name__ == "Shop":
                return queryset.filter(shoptype__id__exact=self.value())

class Shop(models.Model):
    """经营门店"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    size_choices = ( ('XS', '超小店'),('S', '小店'),('M', '中店'),('L', '大店'),('XL', '特大店'),('O', '其他'))
    region = models.ForeignKey(Region,  verbose_name='区域',help_text='区域（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='region')
    shoptype = models.ForeignKey(ShopType,  verbose_name='店类型',help_text='店类型（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='shoptype')
    name = models.CharField(max_length=60, verbose_name='门店', help_text='门店（CharField）')
    square = models.DecimalField( max_digits=10, decimal_places=2,verbose_name='店平方',blank=True,null=True, help_text='店平方（CharField）',default=0)
    code = models.CharField(max_length=255, verbose_name='编号',blank=True, help_text='编号（CharField）')
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='Shop_group')
    place = models.TextField(verbose_name='位置', help_text='位置（TextField）', blank=True)
    settype = models.CharField(max_length=6, verbose_name='店群', help_text='店群（CharField）', blank=True)
    size = models.CharField(max_length=5, verbose_name='门店大小等级', help_text='门店大小等级', choices=size_choices , default='O')
    manage = models.ForeignKey(UserExtension,  verbose_name='负责人',help_text='负责人（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Shop_manage')
    desc = MDTextField(verbose_name="说明", blank=True) 
    img = models.ForeignKey(Images,  verbose_name='图片',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='shop_img')
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Shop_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Shop_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    
    class Meta:
        ordering = ['code','region__largeregion__name','region__name','name',]
        verbose_name = '经营门店'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return self.name
@admin.register(Shop)
class ShopAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'largeregion','region','shoptype','size','name','show_img','square','code','place','manage','settype','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','region','shoptype','size','name','img','square','code','place','manage','settype','desc',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','region','shoptype','manage','created_by','last_edited_by')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name','code',  'manage__realname','place','size',)
    list_filter = (RegionFilter,LargeRegionFilter,ShopTypeFilter,'size')
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
            return super(ShopAdminModel, self).get_queryset(request)
        else:
            ungroups = super(ShopAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super(ShopAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
    def largeregion(self, obj):
        if obj.region:
            return obj.region.largeregion
    largeregion.short_description = '大区'
    largeregion.allow_tags = True 
    show_img.short_description = '图像'
    show_img.allow_tags = True
class ShopFilter(admin.SimpleListFilter):
    title = _('门店') # 指定过滤器名
    parameter_name = 'shop' # 指定过滤器字段
    # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
    def lookups(self, request, model_admin):
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            chapter = Shop.objects.all()
            res = []
            for c in chapter:
                res.append((c.id,c.name))
            return res
        else:
            ungroups = Shop.objects.filter(deleted=0).exclude(group__in=qs)
            chapter = Shop.objects.filter(deleted=0).exclude(id__in=ungroups)
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
            if queryset.model.__name__ == "Storage":
                return queryset.filter(shop__id__exact=self.value())
            if queryset.model.__name__ == "Stock":
                return queryset.filter(storage__shop__id__exact=self.value())
            if queryset.model.__name__ == "SalesDetails":
                return queryset.filter(shop__id__exact=self.value())
    
