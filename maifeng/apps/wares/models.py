from django.db import models
from django.contrib import admin
from users.models import UserExtension
from django.utils.timezone import now
from mdeditor.fields import MDTextField

from merch.models import MerchTypeChild
from merch.models import MerchSetFilter,TypeSetFilter,MerchTypeFilter,MerchTypeChildFilter
from supply.models import Supply
from files.models import Images
from django.contrib.auth.models import User,Group
from django.utils.translation import gettext, gettext_lazy as _

# 商品→色码SKU
## 商品
class Wares(models.Model):
    """商品"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='Wares_group')
    name = models.CharField(max_length=15, verbose_name='品名', help_text='品名（CharField）')
    merchtypechild = models.ForeignKey(MerchTypeChild,  verbose_name='子品类',help_text='子品类（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='merchtypechild')
    supply = models.ForeignKey(Supply,  verbose_name='供应商',help_text='供应商（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='wares_supply')
    url = models.TextField(verbose_name='网址', help_text='网址（TextField）', blank=True)
    # models.CharField(max_length=255, verbose_name='',blank=True, help_text='（CharField）')
    code = models.CharField(max_length=15, verbose_name='货号',blank=True, help_text='货号（CharField）')
    style = models.CharField(max_length=255, verbose_name='特征/款式',blank=True, help_text='（CharField）')
    quality = models.CharField(max_length=255, verbose_name='质地',blank=True, help_text='质地（CharField）')
    weight = models.DecimalField( max_digits=10, decimal_places=2,verbose_name='重量g',blank=True,null=True, help_text='重量g（CharField）')
    land = models.CharField(max_length=255, verbose_name='厚度cm',blank=True, help_text='厚度cm（CharField）')
    season = models.CharField(max_length=255, verbose_name='季节',blank=True, help_text='季节（CharField）')
    # bid = models.DecimalField( max_digits=10, decimal_places=2,verbose_name='进价',blank=True,null=True, help_text='进价（CharField）')
    # fix = models.DecimalField( max_digits=10, decimal_places=2,verbose_name='定价',blank=True,null=True, help_text='定价（CharField）')
    # delivery = models.DecimalField( max_digits=10, decimal_places=2, verbose_name='交货期/天', help_text='交货期/天（CharField）',null=True,blank=True)
    # base = models.PositiveIntegerField( verbose_name='订货基数', help_text='订货基数（CharField）',null=True,blank=True)
    # startorder = models.PositiveIntegerField( verbose_name='起订量', help_text='起订量（CharField）',null=True,blank=True)
    way = models.CharField(max_length=255, verbose_name='订货方式',blank=True, help_text='订货方式（CharField）')
    logistics = models.CharField(max_length=255, verbose_name='物流',blank=True, help_text='物流（CharField）')
    instructions = MDTextField(verbose_name="使用说明", blank=True)
    desc = MDTextField(verbose_name="商品说明", blank=True)
    
    img1 = models.ForeignKey(Images,  verbose_name='图片1',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='wares_img1')
    img2 = models.ForeignKey(Images,  verbose_name='图片2',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='wares_img2')
    img3 = models.ForeignKey(Images,  verbose_name='图片3',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='wares_img3')
    img4 = models.ForeignKey(Images,  verbose_name='图片4',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='wares_img4')
    img5 = models.ForeignKey(Images,  verbose_name='图片5',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='wares_img5')
    img6 = models.ForeignKey(Images,  verbose_name='图片6',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='wares_img6')
    img7 = models.ForeignKey(Images,  verbose_name='图片7',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='wares_img7')
    img8 = models.ForeignKey(Images,  verbose_name='图片8',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='wares_img8')
    img9 = models.ForeignKey(Images,  verbose_name='图片9',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='wares_img9')

    
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Wares_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='Wares_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    
    class Meta:
        ordering = ['-id']
        verbose_name = '商品'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return self.name

@admin.register(Wares)
class WaresAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    # list_display = ('id','merchset','typeset','merchtype','merchtypechild','gourl','code','name','show_code','supply','style','quality','weight','land','season','bid','fix','delivery','base','startorder','way','logistics',# 'instructions','desc',
    #     'show_img1','show_img2','show_img3','show_img4','show_img5','show_img6','show_img7','show_img8','show_img9',# 'created_by', 'created_date', 'last_edited_by','last_edited_date'
    #     )
    
    list_display = ('id','merchset','typeset','merchtype','merchtypechild','gourl','code','name','show_code','supply','style','quality','weight','land','season','way','logistics',# 'instructions','desc',
        'show_img1','show_img2','show_img3','show_img4','show_img5','show_img6','show_img7','show_img8','show_img9',# 'created_by', 'created_date', 'last_edited_by','last_edited_date'
        )
    fieldsets = [(None, {"fields": ['group','merchtypechild','code','name','url','supply','style','quality','weight','land','season','way','logistics','instructions','desc',
        'img1','img2','img3','img4','img5','img6','img7','img8','img9',
        ]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','created_by','last_edited_by','merchtypechild','supply')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name','code','supply__name', )
    list_filter = (MerchTypeChildFilter,MerchTypeFilter,TypeSetFilter,MerchSetFilter)
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
            return super( WaresAdminModel, self).get_queryset(request)
        else:
            # data1 = super( WaresAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
            ungroups = super( WaresAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super( WaresAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
    
    def show_code(self, obj):
        from django.utils.html import format_html
        from django.http import HttpResponse
        import qrcode
        from six import BytesIO
        import base64
        
        if obj.code:
            img = qrcode.make('{"api":"wares","code":"'+str(obj.code)+'"}')
            buf = BytesIO()
            img.save(buf)
            image_stream = buf.getvalue()
            showstr = base64.b64encode(image_stream).decode('unicode_escape')
            return format_html("<a href='data:image/png;base64,%s' target='_blank'><img src='data:image/png;base64,%s' width='%dpx' height='%dpx'/></a>" % (showstr, showstr, 60, 60))
        else:
            return ''    
    def show_img1(self, obj):
        from django.utils.html import format_html
        if obj.img1 is not None and obj.img1.img is not None and str(obj.img1.img) != '':
            url = '/media/' + str(obj.img1.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img2(self, obj):
        from django.utils.html import format_html
        if obj.img2 is not None and obj.img2.img is not None and str(obj.img2.img) != '':
            url = '/media/' + str(obj.img2.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img3(self, obj):
        from django.utils.html import format_html
        if obj.img3 is not None and obj.img3.img is not None and str(obj.img3.img) != '':
            url = '/media/' + str(obj.img3.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img4(self, obj):
        from django.utils.html import format_html
        if obj.img4 is not None and obj.img4.img is not None and str(obj.img4.img) != '':
            url = '/media/' + str(obj.img4.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img5(self, obj):
        from django.utils.html import format_html
        if obj.img5 is not None and obj.img5.img is not None and str(obj.img5.img) != '':
            url = '/media/' + str(obj.img5.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img6(self, obj):
        from django.utils.html import format_html
        if obj.img6 is not None and obj.img6.img is not None and str(obj.img6.img) != '':
            url = '/media/' + str(obj.img6.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img7(self, obj):
        from django.utils.html import format_html
        if obj.img7 is not None and obj.img7.img is not None and str(obj.img7.img) != '':
            url = '/media/' + str(obj.img7.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img8(self, obj):
        from django.utils.html import format_html
        if obj.img8 is not None and obj.img8.img is not None and str(obj.img8.img) != '':
            url = '/media/' + str(obj.img8.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img9(self, obj):
        from django.utils.html import format_html
        if obj.img9 is not None and obj.img9.img is not None and str(obj.img9.img) != '':
            url = '/media/' + str(obj.img9.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def merchset(self, obj):
        if obj.merchtypechild:
            return obj.merchtypechild.merchtype.typeset.merchset
    def typeset(self, obj):
        if obj.merchtypechild:
            return obj.merchtypechild.merchtype.typeset
    def merchtype(self, obj):
        if obj.merchtypechild:
            return obj.merchtypechild.merchtype
    def gourl(self, obj):
        from django.utils.html import format_html
        if obj.url:
            return format_html("<a href='%s' target='_blank' style='color:#3ba1df !important;'><u>跳转链接</u></a>" % (obj.url))
    gourl.short_description = '网址'
    gourl.allow_tags = True
    merchset.short_description = '顾客群'
    merchset.allow_tags = True
    typeset.short_description = '品类组'
    typeset.allow_tags = True 
    merchtype.short_description = '品类'
    merchtype.allow_tags = True 
    show_code.short_description = '二维码'
    show_code.allow_tags = True    
    show_img1.short_description = '图1'
    show_img1.allow_tags = True
    show_img2.short_description = '图2'
    show_img2.allow_tags = True
    show_img3.short_description = '图3'
    show_img3.allow_tags = True
    show_img4.short_description = '图4'
    show_img4.allow_tags = True
    show_img5.short_description = '图5'
    show_img5.allow_tags = True
    show_img6.short_description = '图6'
    show_img6.allow_tags = True
    show_img7.short_description = '图7'
    show_img7.allow_tags = True
    show_img8.short_description = '图8'
    show_img8.allow_tags = True
    show_img9.short_description = '图9'
    show_img9.allow_tags = True
class WaresFilter(admin.SimpleListFilter):
    title = _('商品') # 指定过滤器名
    parameter_name = 'wares' # 指定过滤器字段
    # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
    def lookups(self, request, model_admin):
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            chapter = Wares.objects.all()
            res = []
            for c in chapter:
                res.append((c.id,c.name))
            return res
        else:
            ungroups = Wares.objects.filter(deleted=0).exclude(group__in=qs)
            chapter = Wares.objects.filter(deleted=0).exclude(id__in=ungroups)
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
            if queryset.model.__name__ == "WareSKU":
                return queryset.filter(wares__id__exact=self.value())      

## 色码
class WareSKU(models.Model):
    """色码"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='WareSKU_group')
    name = models.CharField(max_length=15, verbose_name='SKU', help_text='SKU（CharField）')
    wares = models.ForeignKey(Wares,  verbose_name='商品',help_text='商品（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='wares')
    code = models.CharField(max_length=15, verbose_name='色号',blank=True, help_text='色号（CharField）')
    color = models.CharField(max_length=255, verbose_name='颜色',blank=True, help_text='颜色（CharField）')
    size = models.CharField(max_length=255, verbose_name='码数',blank=True, help_text='码数（CharField）')
    bid = models.DecimalField( max_digits=10, decimal_places=2,verbose_name='进价',blank=True,null=True, help_text='进价（CharField）')
    fix = models.DecimalField( max_digits=10, decimal_places=2,verbose_name='定价',blank=True,null=True, help_text='定价（CharField）')
    delivery = models.DecimalField( max_digits=10, decimal_places=2, verbose_name='交货期/天', help_text='交货期/天（CharField）',null=True,blank=True)
    base = models.PositiveIntegerField( verbose_name='订货基数', help_text='订货基数（CharField）',null=True,blank=True)
    startorder = models.PositiveIntegerField( verbose_name='起订量', help_text='起订量（CharField）',null=True,blank=True)
    desc = MDTextField(verbose_name="说明", blank=True)
    
    img1 = models.ForeignKey(Images,  verbose_name='图片1',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='sku_img1')
    img2 = models.ForeignKey(Images,  verbose_name='图片2',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='sku_img2')
    img3 = models.ForeignKey(Images,  verbose_name='图片3',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='sku_img3')
    img4 = models.ForeignKey(Images,  verbose_name='图片4',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='sku_img4')
    img5 = models.ForeignKey(Images,  verbose_name='图片5',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='sku_img5')
    img6 = models.ForeignKey(Images,  verbose_name='图片6',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='sku_img6')
    img7 = models.ForeignKey(Images,  verbose_name='图片7',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='sku_img7')
    img8 = models.ForeignKey(Images,  verbose_name='图片8',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='sku_img8')
    img9 = models.ForeignKey(Images,  verbose_name='图片9',help_text='图片（ForeignKey）', null=True, blank=True, on_delete=models.SET_NULL, related_name='sku_img9')

    
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='WareSKU_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='WareSKU_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    
    class Meta:
        ordering = ['-id']
        verbose_name = '色码'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return self.name

@admin.register(WareSKU)
class WareSKUAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id','merchset','typeset','merchtype','merchtypechild', 'gourl','wares_code','code','wares','name','show_code','color','size','supply','bid','fix','delivery','base','startorder','desc','show_img1','show_img2','show_img3','show_img4','show_img5','show_img6','show_img7','show_img8','show_img9')
    # list_display = ('id','merchset','typeset','merchtype','merchtypechild', 'wares_code','code','wares','name','show_code','color','size','supply','desc','show_img1','show_img2','show_img3','show_img4','show_img5','show_img6','show_img7','show_img8','show_img9')
    fieldsets = [(None, {"fields": ['group','code','wares','name','color','size','bid','fix','delivery','base','startorder','desc','img1','img2','img3','img4','img5','img6','img7','img8','img9',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','created_by','last_edited_by','wares')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name','code', 'wares__name','wares__code','wares__supply__name')
    list_filter = (WaresFilter,MerchTypeChildFilter,MerchTypeFilter,TypeSetFilter,MerchSetFilter)
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
            return super( WareSKUAdminModel, self).get_queryset(request)
        else:
            # data1 = super( WareSKUAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
            ungroups = super( WareSKUAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super( WareSKUAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
    
    def show_code(self, obj):
        from django.utils.html import format_html
        from django.http import HttpResponse
        import qrcode
        from six import BytesIO
        import base64
        
        if obj.wares is not None and obj.wares.code and obj.code:
            img = qrcode.make('{"api":"waresku","wares":"'+str(obj.wares.code)+'","code":"'+str(obj.code)+'"}')
            # '{"api":"waresku","wares":str(obj.wares.code),"code":str(obj.code)}'
            buf = BytesIO()
            img.save(buf)
            image_stream = buf.getvalue()
            showstr = base64.b64encode(image_stream).decode('unicode_escape')
            return format_html("<a href='data:image/png;base64,%s' target='_blank'><img src='data:image/png;base64,%s' width='%dpx' height='%dpx'/></a>" % (showstr, showstr, 60, 60))
        else:
            return ''
    def wares_code(self, obj):
        if obj.wares is not None and obj.wares.code:
            return obj.wares.code
        else:
            return ''
    def supply(self, obj):
        if obj.wares is not None and obj.wares.supply is not None and obj.wares.supply.name:
            return obj.wares.supply.name
        else:
            return ''
    def show_img1(self, obj):
        from django.utils.html import format_html
        if obj.img1 is not None and obj.img1.img is not None and str(obj.img1.img) != '':
            url = '/media/' + str(obj.img1.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img2(self, obj):
        from django.utils.html import format_html
        if obj.img2 is not None and obj.img2.img is not None and str(obj.img2.img) != '':
            url = '/media/' + str(obj.img2.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img3(self, obj):
        from django.utils.html import format_html
        if obj.img3 is not None and obj.img3.img is not None and str(obj.img3.img) != '':
            url = '/media/' + str(obj.img3.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img4(self, obj):
        from django.utils.html import format_html
        if obj.img4 is not None and obj.img4.img is not None and str(obj.img4.img) != '':
            url = '/media/' + str(obj.img4.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img5(self, obj):
        from django.utils.html import format_html
        if obj.img5 is not None and obj.img5.img is not None and str(obj.img5.img) != '':
            url = '/media/' + str(obj.img5.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img6(self, obj):
        from django.utils.html import format_html
        if obj.img6 is not None and obj.img6.img is not None and str(obj.img6.img) != '':
            url = '/media/' + str(obj.img6.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img7(self, obj):
        from django.utils.html import format_html
        if obj.img7 is not None and obj.img7.img is not None and str(obj.img7.img) != '':
            url = '/media/' + str(obj.img7.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img8(self, obj):
        from django.utils.html import format_html
        if obj.img8 is not None and obj.img8.img is not None and str(obj.img8.img) != '':
            url = '/media/' + str(obj.img8.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def show_img9(self, obj):
        from django.utils.html import format_html
        if obj.img9 is not None and obj.img9.img is not None and str(obj.img9.img) != '':
            url = '/media/' + str(obj.img9.img)
            return format_html("<a href='%s' target='_blank'><img src='%s' width='%dpx' height='%dpx'/></a>" % (url, url, 45, 60))
        else:
            return ''
    def merchset(self, obj):
        if obj.wares:
            return obj.wares.merchtypechild.merchtype.typeset.merchset
    def typeset(self, obj):
        if obj.wares:
            return obj.wares.merchtypechild.merchtype.typeset
    def merchtype(self, obj):
        if obj.wares:
            return obj.wares.merchtypechild.merchtype
    def merchtypechild(self, obj):
        if obj.wares:
            return obj.wares.merchtypechild
    def gourl(self, obj):
        from django.utils.html import format_html
        if obj.wares.url:
            return format_html("<a href='%s' target='_blank' style='color:#3ba1df !important;'><u>跳转链接</u></a>" % (obj.wares.url))
    gourl.short_description = '网址'
    gourl.allow_tags = True
    merchset.short_description = '顾客群'
    merchset.allow_tags = True
    typeset.short_description = '品类组'
    typeset.allow_tags = True 
    merchtype.short_description = '品类'
    merchtype.allow_tags = True 
    merchtypechild.short_description = '子品类'
    merchtypechild.allow_tags = True 
    show_code.short_description = '二维码'
    show_code.allow_tags = True
    wares_code.short_description = '货号'
    wares_code.allow_tags = True
    supply.short_description = '供应商'
    supply.allow_tags = True
    show_img1.short_description = '图1'
    show_img1.allow_tags = True
    show_img2.short_description = '图2'
    show_img2.allow_tags = True
    show_img3.short_description = '图3'
    show_img3.allow_tags = True
    show_img4.short_description = '图4'
    show_img4.allow_tags = True
    show_img5.short_description = '图5'
    show_img5.allow_tags = True
    show_img6.short_description = '图6'
    show_img6.allow_tags = True
    show_img7.short_description = '图7'
    show_img7.allow_tags = True
    show_img8.short_description = '图8'
    show_img8.allow_tags = True
    show_img9.short_description = '图9'
    show_img9.allow_tags = True
    