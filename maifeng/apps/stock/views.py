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
# router.register(r'Storage',Views.Storage, basename='')
class StorageViews(MyModelViewSet):

    # queryset = Storage.objects.filter(deleted__exact='0')
    serializer_class = StorageSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name', 'code']
    search_fields = ['name', 'code']
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return Storage.objects.filter(deleted__exact='0')
        else:
            ungroups = Storage.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return Storage.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
class StorageOptionViews(MyModelViewSet):

    # queryset = Storage.objects.filter(deleted__exact='0')
    serializer_class = StorageOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return Storage.objects.filter(deleted__exact='0')
        else:
            ungroups = Storage.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return Storage.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
# router.register(r'Stock',Views.Stock, basename='')
class StockViews(MyModelViewSet):

    # queryset = Stock.objects.filter(deleted__exact='0')
    serializer_class = StockSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','storage','waresku',]
    search_fields = ['storage','waresku',]
    #search_fields = ['realname', 'user__username']
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return Stock.objects.filter(deleted__exact='0')
        else:
            ungroups = Stock.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return Stock.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
class StockOptionViews(MyModelViewSet):

    # queryset = Stock.objects.filter(deleted__exact='0')
    serializer_class = StockOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','storage','waresku',]
    search_fields = ['storage','waresku',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return Stock.objects.filter(deleted__exact='0')
        else:
            ungroups = Stock.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return Stock.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    