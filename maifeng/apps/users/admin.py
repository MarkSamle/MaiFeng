from django.contrib import admin
from django.contrib.auth.models import User,Group
from django.contrib.auth.admin import UserAdmin,GroupAdmin
from django.utils.translation import gettext, gettext_lazy as _
from django.contrib.auth.hashers import make_password, check_password
from django.db.models import Q
# from rest_framework.authtoken.admin import TokenAdmin

class GroupFilter(admin.SimpleListFilter):
    title = _('权限分组') # 指定过滤器名
    parameter_name = 'groups' # 指定过滤器字段
    
    # 指定过滤器数据集 [(传入值，展示值),(),(),()……]
    def lookups(self, request, model_admin):
        qs = Group.objects.filter(user=request.user)
        groupItem = []
        for thegroup in qs:
            groupItem.append(thegroup.id)
        # 如果是超级用户
        if request.user.is_superuser:
            chapter = Group.objects.all()
            res = []
            for c in chapter:
                res.append((c.id,c.name))
            return res   #它返回过去的值给了request.GEt
        else:
            chapter = Group.objects.filter(id__in=groupItem)
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
            return queryset.filter(groups__id__exact=self.value())
        

class UserAdmin(UserAdmin):
    list_display = ('username', 'email', 'is_staff')
    list_filter = ('is_staff', 'is_superuser', 'is_active', GroupFilter)
    # list_filter = ('is_staff', 'is_superuser', 'is_active', 'groups')
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        (_('Personal info'), {'fields': ('first_name', 'last_name', 'email')}),
        (_('Permissions'), {
            'fields': ('is_active', 'is_staff','groups','user_permissions'),
        }),
    )
    # 使用到外键下拉的字段
    autocomplete_fields = ('groups',)
    def save_model(self, request, obj, form, change):
        # 获取用户分组
        qs = Group.objects.filter(user=request.user)
        if request.user.is_superuser:
            super().save_model(request, obj, form, change)
        else:
            for thegroup in qs:
                obj.save()
                obj.groups.add(thegroup.id)
            super().save_model(request, obj, form, change)
            
    # def get_queryset(self, request):
    #     # 获取查询用户所在组,获取组内用户
    #     qs = Group.objects.filter(user=request.user)
    #     if request.user.is_superuser:
    #         return super(UserAdmin, self).get_queryset(request)
    #     else:
    #         # data1 = super(MerchSetAdminModel, self).get_queryset(request).filter(deleted=0).filter(group__in=qs)
    #         ungroups = super(UserAdmin, self).get_queryset(request).filter(is_active=True).exclude(extension__group__in=qs)
    #         groups = super(UserAdmin, self).get_queryset(request).filter(is_active=True).exclude(id__in=ungroups)
    #         return super(UserAdmin, self).get_queryset(request).filter(is_active=True).filter(Q(id__in=groups)|Q(id=request.user.id))
    def get_queryset(self, request):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=request.user)
        userItem = []
        for thegroup in qs:
            for theuser in thegroup.user_set.all():
                userItem.append(theuser.id)
        # 如果是超级用户
        if request.user.is_superuser:
            return super(UserAdmin, self).get_queryset(request)
        else:
            return super(UserAdmin, self).get_queryset(request).filter(is_active=True).filter(id__in=userItem)
class GroupAdmin(GroupAdmin):
    def get_queryset(self, request):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=request.user)
        groupItem = []
        for thegroup in qs:
            groupItem.append(thegroup.id)
        # 如果是超级用户
        if request.user.is_superuser:
            return super(GroupAdmin, self).get_queryset(request)
        else:
            return super(GroupAdmin, self).get_queryset(request).filter(id__in=groupItem)
    def save_model(self, request, obj, form, change):

        if request.user.is_superuser:
            super().save_model(request, obj, form, change)
        else:
            obj.save()
            thisuser = User.objects.filter(id=request.user.id).first()
            thisuser.groups.add(obj.id)
            thisuser.save()
            super().save_model(request, obj, form, change)
    
    
admin.site.site_header = "脉蜂系统"
admin.site.site_title = '脉蜂系统'
admin.site.unregister(User)
admin.site.register(User, UserAdmin)
admin.site.unregister(Group)
admin.site.register(Group, GroupAdmin)

from django.contrib import admin
from django.utils.text import capfirst
# import OrderedDict


def find_model_index(name):
    count = 0
    for model, model_admin in admin.site._registry.items():
        if capfirst(model._meta.verbose_name_plural) == name:
            return count
        else:
            count += 1
    return count


def index_decorator(func):
    def inner(*args, **kwargs):
        templateresponse = func(*args, **kwargs)
        for app in templateresponse.context_data['app_list']:
            app['models'].sort(key=lambda x: find_model_index(x['name']))
        return templateresponse

    return inner


# registry = OrderedDict()
# registry.update(admin.site._registry)
# admin.site._registry = registry
admin.site.index = index_decorator(admin.site.index)
admin.site.app_index = index_decorator(admin.site.app_index)
