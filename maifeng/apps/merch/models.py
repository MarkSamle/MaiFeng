from django.db import models
from django.contrib import admin
from users.models import UserExtension
from django.utils.timezone import now
from mdeditor.fields import MDTextField
from django.contrib.auth.models import User,Group
from django.utils.translation import gettext, gettext_lazy as _

# 分类：顾客群→品类组→品类→子品类→

## 顾客群
class MerchSet(models.Model):
    """顾客群"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    
    name = models.CharField(max_length=60, verbose_name='顾客群', help_text='顾客群（CharField）')
    desc = MDTextField(verbose_name="说明", blank=True)
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='MerchSet_group')
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='MerchSet_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='MerchSet_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    
    class Meta:
        ordering = ['-id']
        verbose_name = '顾客群'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return self.name

@admin.register(MerchSet)
class MerchSetAdminModel(admin.ModelAdmin):
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
    search_fields=('name', )
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
            return super(MerchSetAdminModel, self).get_queryset(request)
        else:
            # data1 = super(MerchSetAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
            ungroups = super(MerchSetAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super(MerchSetAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
class MerchSetFilter(admin.SimpleListFilter):
    title = _('顾客群') # 指定过滤器名
    parameter_name = 'merchset' # 指定过滤器字段
    # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
    def lookups(self, request, model_admin):
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            chapter = MerchSet.objects.all()
            res = []
            for c in chapter:
                res.append((c.id,c.name))
            return res
        else:
            ungroups = MerchSet.objects.filter(deleted=0).exclude(group__in=qs)
            chapter = MerchSet.objects.filter(deleted=0).exclude(id__in=ungroups)
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
            if queryset.model.__name__ == "TypeSet":
                return queryset.filter(merchset__id__exact=self.value())
            if queryset.model.__name__ == "MerchType":
                return queryset.filter(typeset__merchset__id__exact=self.value())
            if queryset.model.__name__ == "MerchTypeChild":
                return queryset.filter(merchtype__typeset__merchset__id__exact=self.value())
            if queryset.model.__name__ == "Wares":
                return queryset.filter(merchtypechild__merchtype__typeset__merchset__id__exact=self.value())
            if queryset.model.__name__ == "WareSKU":
                return queryset.filter(wares__merchtypechild__merchtype__typeset__merchset__id__exact=self.value())
            if queryset.model.__name__ == "Stock":
                return queryset.filter(waresku__wares__merchtypechild__merchtype__typeset__merchset__id__exact=self.value())
            if queryset.model.__name__ == "SalesDetails":
                return queryset.filter(waresku__wares__merchtypechild__merchtype__typeset__merchset__id__exact=self.value())
                
            

## 品类组
class TypeSet(models.Model):
    """品类组"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    
    name = models.CharField(max_length=60, verbose_name='品类组', help_text='品类组（CharField）')
    merchset = models.ForeignKey(MerchSet,  verbose_name='顾客群',help_text='顾客群（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='typeset_merchset')
    desc = MDTextField(verbose_name="说明", blank=True)
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='TypeSet_group')
    
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='TypeSet_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='TypeSet_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    
    class Meta:
        ordering = ['-id']
        verbose_name = '品类组'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return self.name

@admin.register(TypeSet)
class TypeSetAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'merchset', 'name','desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','merchset', 'name','desc',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','created_by','last_edited_by','merchset')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name', )
    list_filter = (MerchSetFilter,)
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
            return super( TypeSetAdminModel, self).get_queryset(request)
        else:
            # data1 = super( TypeSetAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
            ungroups = super( TypeSetAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super( TypeSetAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
class TypeSetFilter(admin.SimpleListFilter):
    title = _('品类组') # 指定过滤器名
    parameter_name = 'typeset' # 指定过滤器字段
    # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
    def lookups(self, request, model_admin):
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            chapter = TypeSet.objects.all()
            res = []
            for c in chapter:
                res.append((c.id,c.name))
            return res
        else:
            ungroups = TypeSet.objects.filter(deleted=0).exclude(group__in=qs)
            chapter = TypeSet.objects.filter(deleted=0).exclude(id__in=ungroups)
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
            if queryset.model.__name__ == "MerchType":
                return queryset.filter(typeset__id__exact=self.value())
            if queryset.model.__name__ == "MerchTypeChild":
                return queryset.filter(merchtype__typeset__id__exact=self.value())
            if queryset.model.__name__ == "Wares":
                return queryset.filter(merchtypechild__merchtype__typeset__id__exact=self.value())
            if queryset.model.__name__ == "WareSKU":
                return queryset.filter(wares__merchtypechild__merchtype__typeset__id__exact=self.value())
            if queryset.model.__name__ == "Stock":
                return queryset.filter(waresku__wares__merchtypechild__merchtype__typeset__id__exact=self.value())
            if queryset.model.__name__ == "SalesDetails":
                return queryset.filter(waresku__wares__merchtypechild__merchtype__typeset__id__exact=self.value())
                    
## 品类
class MerchType(models.Model):
    """品类"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    
    name = models.CharField(max_length=60, verbose_name='品类', help_text='品类（CharField）')
    typeset = models.ForeignKey(TypeSet,  verbose_name='品类组',help_text='品类组（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='merchtype_typeset')
    desc = MDTextField(verbose_name="说明", blank=True)
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='MerchType_group')
    
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='MerchType_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='MerchType_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    
    class Meta:
        ordering = ['-id']
        verbose_name = '品类'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return self.name

@admin.register(MerchType)
class MerchTypeAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'merchset','typeset','name', 'desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','typeset','name', 'desc',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','created_by','last_edited_by','typeset')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name', )
    list_filter = (TypeSetFilter,MerchSetFilter)
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
            return super( MerchTypeAdminModel, self).get_queryset(request)
        else:
            # data1 = super( MerchTypeAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
            ungroups = super( MerchTypeAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super( MerchTypeAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)

    def merchset(self, obj):
        if obj.typeset:
            return obj.typeset.merchset
    merchset.short_description = '顾客群'
    merchset.allow_tags = True    
class MerchTypeFilter(admin.SimpleListFilter):
    title = _('品类') # 指定过滤器名
    parameter_name = 'merchtype' # 指定过滤器字段
    # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
    def lookups(self, request, model_admin):
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            chapter = MerchType.objects.all()
            res = []
            for c in chapter:
                res.append((c.id,c.name))
            return res
        else:
            ungroups = MerchType.objects.filter(deleted=0).exclude(group__in=qs)
            chapter = MerchType.objects.filter(deleted=0).exclude(id__in=ungroups)
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
            if queryset.model.__name__ == "MerchTypeChild":
                return queryset.filter(merchtype__id__exact=self.value())
            if queryset.model.__name__ == "Wares":
                return queryset.filter(merchtypechild__merchtype__id__exact=self.value())
            if queryset.model.__name__ == "WareSKU":
                return queryset.filter(wares__merchtypechild__merchtype__id__exact=self.value())
            if queryset.model.__name__ == "Stock":
                return queryset.filter(waresku__wares__merchtypechild__merchtype__id__exact=self.value())
            if queryset.model.__name__ == "SalesDetails":
                return queryset.filter(waresku__wares__merchtypechild__merchtype__id__exact=self.value())
## 子品类
class MerchTypeChild(models.Model):
    """子品类"""
    del_choices = ( ('0', '未删除'),('1', '已删除'))
    
    name = models.CharField(max_length=60, verbose_name='子品类', help_text='子品类（CharField）')
    merchtype = models.ForeignKey(MerchType,  verbose_name='品类',help_text='品类（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='merchtypechild_merchtype')
    desc = MDTextField(verbose_name="说明", blank=True)
    group = models.ManyToManyField(Group, verbose_name='可见分组',help_text='可见分组',blank=True,related_name='MerchTypeChild_group')
    
    created_by = models.ForeignKey(UserExtension,  verbose_name='创建人ID',help_text='创建人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='MerchTypeChild_cb')
    created_date = models.DateTimeField(verbose_name='创建时间', help_text='创建时间（DateTimeField）', null=True, blank=True, auto_now_add=True)
    last_edited_by = models.ForeignKey(UserExtension,  verbose_name='最后编辑人ID',help_text='最后编辑人ID（ForeignKey）', null=True, blank=True, on_delete=models.CASCADE, related_name='MerchTypeChild_eb')
    last_edited_date = models.DateTimeField(verbose_name='最后编辑时间', help_text='最后编辑时间（DateTimeField）', null=True, blank=True, auto_now=True)
    deleted = models.CharField(max_length=1, verbose_name='是否删除', help_text='是否删除（CharField，可选值：0，1）', choices=del_choices, default='0')
    
    class Meta:
        ordering = ['-id']
        verbose_name = '子品类'
        verbose_name_plural = verbose_name
        
    def __str__(self):
        return self.name

@admin.register(MerchTypeChild)
class MerchTypeChildAdminModel(admin.ModelAdmin):
    # 添加分页
    list_per_page = 50
    # 列表页展示的字段
    list_display = ('id', 'merchset','typeset','merchtype','name', 'desc','created_by', 'created_date', 'last_edited_by','last_edited_date')
    fieldsets = [(None, {"fields": ['group','merchtype','name', 'desc',]})]
    # 使用到外键下拉的字段
    autocomplete_fields = ('group','created_by','last_edited_by','merchtype')
    # 开放操作动作
    actions_on_bottom = True
    # 提供引用查询
    search_fields=('name', )
    list_filter = (MerchTypeFilter,TypeSetFilter,MerchSetFilter)
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
            return super( MerchTypeChildAdminModel, self).get_queryset(request)
        else:
            # data1 = super( MerchTypeChildAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
            ungroups = super( MerchTypeChildAdminModel, self).get_queryset(request).filter(deleted=0).exclude(group__in=qs)
            return super( MerchTypeChildAdminModel, self).get_queryset(request).filter(deleted=0).exclude(id__in=ungroups)
    def merchset(self, obj):
        if obj.merchtype:
            return obj.merchtype.typeset.merchset
    def typeset(self, obj):
        if obj.merchtype:
            return obj.merchtype.typeset
    merchset.short_description = '顾客群'
    merchset.allow_tags = True
    typeset.short_description = '品类组'
    typeset.allow_tags = True 
class MerchTypeChildFilter(admin.SimpleListFilter):
    title = _('子品类') # 指定过滤器名
    parameter_name = 'merchtypechild' # 指定过滤器字段
    # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
    def lookups(self, request, model_admin):
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            chapter = MerchTypeChild.objects.all()
            res = []
            for c in chapter:
                res.append((c.id,c.name))
            return res
        else:
            ungroups = MerchTypeChild.objects.filter(deleted=0).exclude(group__in=qs)
            chapter = MerchTypeChild.objects.filter(deleted=0).exclude(id__in=ungroups)
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
            if queryset.model.__name__ == "Wares":
                return queryset.filter(merchtypechild__id__exact=self.value())
            if queryset.model.__name__ == "WareSKU":
                return queryset.filter(wares__merchtypechild__id__exact=self.value())
            if queryset.model.__name__ == "Stock":
                return queryset.filter(waresku__wares__merchtypechild__id__exact=self.value())
            if queryset.model.__name__ == "SalesDetails":  
                return queryset.filter(waresku__wares__merchtypechild__id__exact=self.value())

