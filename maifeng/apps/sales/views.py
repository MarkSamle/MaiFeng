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
# router.register(r'Sales',Views.Sales, basename='')
class SalesViews(MyModelViewSet):

    # queryset = Sales.objects.filter(deleted__exact='0')
    serializer_class = SalesSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    #search_fields = ['realname', 'user__username']
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return Sales.objects.filter(deleted__exact='0')
        else:
            ungroups = Sales.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return Sales.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
class SalesOptionViews(MyModelViewSet):

    # queryset = Sales.objects.filter(deleted__exact='0')
    serializer_class = SalesOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return Sales.objects.filter(deleted__exact='0')
        else:
            ungroups = Sales.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return Sales.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
# router.register(r'SalesDetails',Views.SalesDetails, basename='')
class SalesDetailsViews(MyModelViewSet):

    # queryset = SalesDetails.objects.filter(deleted__exact='0')
    serializer_class = SalesDetailsSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    #search_fields = ['realname', 'user__username']
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return SalesDetails.objects.filter(deleted__exact='0')
        else:
            ungroups = SalesDetails.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return SalesDetails.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
class SalesDetailsOptionViews(MyModelViewSet):

    # queryset = SalesDetails.objects.filter(deleted__exact='0')
    serializer_class = SalesDetailsOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return SalesDetails.objects.filter(deleted__exact='0')
        else:
            ungroups = SalesDetails.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return SalesDetails.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#增加促销计划
# router.register(r'Promotion',Views.Promotion, basename='')
class PromotionViews(MyModelViewSet):

    queryset = Promotion.objects.filter(deleted__exact='0')
    serializer_class = PromotionSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    #search_fields = ['realname', 'user__username']
    
#增加促销计划
class PromotionOptionViews(MyModelViewSet):

    queryset = Promotion.objects.filter(deleted__exact='0')
    serializer_class = PromotionOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    