from django.shortcuts import render
from django.db.models import Q
from django.contrib.auth.models import User,Group
from django_filters.rest_framework import DjangoFilterBackend

from rest_framework import filters
from rest_framework import permissions

from .models import *
from .serializers import *


from tool import restful
from tool.paginations import CommonPagination
from rewrite.my_modelviewset import MyModelViewSet
from rewrite.my_mixins import MyListModelMixin

# Create your views here.

#生成基础表单序列化文件
# router.register(r'MerchSet',Views.MerchSet, basename='')
class MerchSetViews(MyModelViewSet):

    # queryset = MerchSet.objects.filter(deleted__exact='0')
    serializer_class = MerchSetSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    #search_fields = ['realname', 'user__username']
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return MerchSet.objects.filter(deleted__exact='0')
        else:
            ungroups = MerchSet.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return MerchSet.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
class MerchSetOptionViews(MyModelViewSet):

    # queryset = MerchSet.objects.filter(deleted__exact='0')
    serializer_class = MerchSetOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return MerchSet.objects.filter(deleted__exact='0')
        else:
            ungroups = MerchSet.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return MerchSet.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
# router.register(r'TypeSet',Views.TypeSet, basename='')
class TypeSetViews(MyModelViewSet):

    # queryset = TypeSet.objects.filter(deleted__exact='0')
    serializer_class = TypeSetSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    #search_fields = ['realname', 'user__username']
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return TypeSet.objects.filter(deleted__exact='0')
        else:
            ungroups = TypeSet.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return TypeSet.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
class TypeSetOptionViews(MyModelViewSet):

    # queryset = TypeSet.objects.filter(deleted__exact='0')
    serializer_class = TypeSetOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return TypeSet.objects.filter(deleted__exact='0')
        else:
            ungroups = TypeSet.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return TypeSet.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
# router.register(r'MerchType',Views.MerchType, basename='')
class MerchTypeViews(MyModelViewSet):

    # queryset = MerchType.objects.filter(deleted__exact='0')
    serializer_class = MerchTypeSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    #search_fields = ['realname', 'user__username']
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return MerchType.objects.filter(deleted__exact='0')
        else:
            ungroups = MerchType.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return MerchType.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
class MerchTypeOptionViews(MyModelViewSet):

    # queryset = MerchType.objects.filter(deleted__exact='0')
    serializer_class = MerchTypeOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return MerchType.objects.filter(deleted__exact='0')
        else:
            ungroups = MerchType.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return MerchType.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
# router.register(r'MerchTypeChild',Views.MerchTypeChild, basename='')
class MerchTypeChildViews(MyModelViewSet):

    # queryset = MerchTypeChild.objects.filter(deleted__exact='0')
    serializer_class = MerchTypeChildSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    #search_fields = ['realname', 'user__username']
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return MerchTypeChild.objects.filter(deleted__exact='0')
        else:
            ungroups = MerchTypeChild.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return MerchTypeChild.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
class MerchTypeChildOptionViews(MyModelViewSet):

    # queryset = MerchTypeChild.objects.filter(deleted__exact='0')
    serializer_class = MerchTypeChildOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return MerchTypeChild.objects.filter(deleted__exact='0')
        else:
            ungroups = MerchTypeChild.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return MerchTypeChild.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    