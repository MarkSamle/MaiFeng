from django.shortcuts import render
from django.db.models import Q
from django.contrib.auth.models import User,Group
from django_filters.rest_framework import DjangoFilterBackend

from rest_framework import filters
from rest_framework import permissions

from .models import *
from .serializers import *
import re

from tool import restful
from tool.paginations import CommonPagination
from rewrite.my_modelviewset import MyModelViewSet
from rewrite.my_mixins import MyListModelMixin

# Create your views here.

#生成基础表单序列化文件
# router.register(r'LargeRegion',Views.LargeRegion, basename='')
class LargeRegionViews(MyModelViewSet):

    # queryset = LargeRegion.objects.filter(deleted__exact='0')
    serializer_class = LargeRegionSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    #search_fields = ['realname', 'user__username']
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return LargeRegion.objects.filter(deleted__exact='0')
        else:
            ungroups = LargeRegion.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return LargeRegion.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
class LargeRegionOptionViews(MyModelViewSet):

    # queryset = LargeRegion.objects.filter(deleted__exact='0')
    serializer_class = LargeRegionOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return LargeRegion.objects.filter(deleted__exact='0')
        else:
            ungroups = LargeRegion.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return LargeRegion.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
# router.register(r'Region',Views.Region, basename='')
class RegionViews(MyModelViewSet):

    # queryset = Region.objects.filter(deleted__exact='0')
    serializer_class = RegionSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    #search_fields = ['realname', 'user__username']
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return Region.objects.filter(deleted__exact='0')
        else:
            ungroups = Region.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return Region.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
class RegionOptionViews(MyModelViewSet):

    # queryset = Region.objects.filter(deleted__exact='0')
    serializer_class = RegionOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return Region.objects.filter(deleted__exact='0')
        else:
            ungroups = Region.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return Region.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
# router.register(r'Shop',Views.Shop, basename='')
class ShopViews(MyModelViewSet):

    # queryset = Shop.objects.filter(deleted__exact='0')
    serializer_class = ShopSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name','code']
    search_fields = ['name', 'code']
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return Shop.objects.filter(deleted__exact='0')
        else:
            ungroups = Shop.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return Shop.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        largeregionIds = self.request.query_params.get("largeregionIds")
        regionIds = self.request.query_params.get("regionIds")

        
        _qs = Shop.objects.filter(deleted__exact='0')
        
        if self.request.user.is_superuser:
            _qs = Shop.objects.filter(deleted__exact='0')
        else:
            ungroups = Shop.objects.filter(deleted__exact='0').exclude(group__in=qs)
            _qs = Shop.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
            
        if largeregionIds:
            Ids_ = re.split(r',|\]|\[',largeregionIds)
            Ids = []
            for id in Ids_:
                if id != '':
                    Ids.append(int(id))
            if Ids != []:
                _qs = _qs.filter(region__largeregion__in=Ids)
        if regionIds:
            Ids_ = re.split(r',|\]|\[',regionIds)
            Ids = []
            for id in Ids_:
                if id != '':
                    Ids.append(int(id))
            if Ids != []:
                _qs = _qs.filter(region__in=Ids)
        
        return _qs
    
#生成基础表单序列化文件
class ShopOptionViews(MyModelViewSet):

    # queryset = Shop.objects.filter(deleted__exact='0')
    serializer_class = ShopOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return Shop.objects.filter(deleted__exact='0')
        else:
            ungroups = Shop.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return Shop.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#增加门店类型
# router.register(r'ShopType',Views.ShopType, basename='')
class ShopTypeViews(MyModelViewSet):

    # queryset = ShopType.objects.filter(deleted__exact='0')
    serializer_class = ShopTypeSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    #search_fields = ['realname', 'user__username']
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return ShopType.objects.filter(deleted__exact='0')
        else:
            ungroups = ShopType.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return ShopType.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#增加门店类型
class ShopTypeOptionViews(MyModelViewSet):

    # queryset = ShopType.objects.filter(deleted__exact='0')
    serializer_class = ShopTypeOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return ShopType.objects.filter(deleted__exact='0')
        else:
            ungroups = ShopType.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return ShopType.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    