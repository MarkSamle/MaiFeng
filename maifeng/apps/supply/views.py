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
# router.register(r'Supply',Views.Supply, basename='')
class SupplyViews(MyModelViewSet):

    # queryset = Supply.objects.filter(deleted__exact='0')
    serializer_class = SupplySerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name', ]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return Supply.objects.filter(deleted__exact='0')
        else:
            ungroups = Supply.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return Supply.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
class SupplyOptionViews(MyModelViewSet):

    # queryset = Supply.objects.filter(deleted__exact='0')
    serializer_class = SupplyOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return Supply.objects.filter(deleted__exact='0')
        else:
            ungroups = Supply.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return Supply.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    