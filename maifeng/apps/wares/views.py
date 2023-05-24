from django.shortcuts import render
from django.db.models import Q

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
# router.register(r'Wares',Views.Wares, basename='')
class WaresViews(MyModelViewSet):
    # /api/wares/?page=1&search=&merchtypechildIds=&merchtypeIds=&typesetIds=&merchsetIds=[0]
    # queryset = Wares.objects.filter(deleted__exact='0')
    serializer_class = WaresSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','code','merchtypechild','merchtypechild__merchtype','merchtypechild__merchtype__typeset', 'merchtypechild__merchtype__typeset__merchset']
    search_fields = ['name','code',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        merchtypechildIds = self.request.query_params.get("merchtypechildIds")
        merchtypeIds = self.request.query_params.get("merchtypeIds")
        typesetIds = self.request.query_params.get("typesetIds")
        merchsetIds = self.request.query_params.get("merchsetIds")
        
        _qs = Wares.objects.filter(deleted__exact='0')
        
        if self.request.user.is_superuser:
            # return Wares.objects.filter(deleted__exact='0')
            _qs = Wares.objects.filter(deleted__exact='0')
        else:
            ungroups = Wares.objects.filter(deleted__exact='0').exclude(group__in=qs)
            # return Wares.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
            _qs = Wares.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
            
        if merchsetIds:
            Ids_ = re.split(r',|\]|\[',merchsetIds)
            Ids = []
            for id in Ids_:
                if id != '':
                    Ids.append(int(id))
            if Ids != []:
                _qs = _qs.filter(merchtypechild__merchtype__typeset__merchset__in=Ids)
            
        if typesetIds:
            Ids_ = re.split(r',|\]|\[',typesetIds)
            Ids = []
            for id in Ids_:
                if id != '':
                    Ids.append(int(id))
            if Ids != []:
                _qs = _qs.filter(merchtypechild__merchtype__typeset__in=Ids)
            
        if merchtypeIds:
            Ids_ = re.split(r',|\]|\[',merchtypeIds)
            Ids = []
            for id in Ids_:
                if id != '':
                    Ids.append(int(id))
            if Ids != []:
                _qs = _qs.filter(merchtypechild__merchtype__in=Ids)
            
        if merchtypechildIds:
            Ids_ = re.split(r',|\]|\[',merchtypechildIds)
            Ids = []
            for id in Ids_:
                if id != '':
                    Ids.append(int(id))
            if Ids != []:
                _qs = _qs.filter(merchtypechild__in=Ids)
        
        return _qs
        
    
#生成基础表单序列化文件
class WaresOptionViews(MyModelViewSet):

    # queryset = Wares.objects.filter(deleted__exact='0')
    serializer_class = WaresOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name','code']
    search_fields = ['name','code']
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return Wares.objects.filter(deleted__exact='0')
        else:
            ungroups = Wares.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return Wares.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    
#生成基础表单序列化文件
# router.register(r'WareSKU',Views.WareSKU, basename='')
class WareSKUViews(MyModelViewSet):

    # queryset = WareSKU.objects.filter(deleted__exact='0')
    serializer_class = WareSKUSerializer
    permission_classes = [permissions.IsAuthenticated]
    pagination_class = CommonPagination
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','wares__code','code','wares__merchtypechild','wares__merchtypechild__merchtype','wares__merchtypechild__merchtype__typeset', 'wares__merchtypechild__merchtype__typeset__merchset']
    search_fields = ['name','code',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        ware = self.request.query_params.get("ware")
        merchtypechildIds = self.request.query_params.get("merchtypechildIds")
        merchtypeIds = self.request.query_params.get("merchtypeIds")
        typesetIds = self.request.query_params.get("typesetIds")
        merchsetIds = self.request.query_params.get("merchsetIds")
        
        _qs = WareSKU.objects.filter(deleted__exact='0')
        
        if self.request.user.is_superuser:
            _qs = WareSKU.objects.filter(deleted__exact='0')
        else:
            ungroups = WareSKU.objects.filter(deleted__exact='0').exclude(group__in=qs)
            _qs = WareSKU.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
            
        if merchsetIds:
            Ids_ = re.split(r',|\]|\[',merchsetIds)
            Ids = []
            for id in Ids_:
                if id != '':
                    Ids.append(int(id))
            if Ids != []:
                _qs = _qs.filter(wares__merchtypechild__merchtype__typeset__merchset__in=Ids)
        if typesetIds:
            Ids_ = re.split(r',|\]|\[',typesetIds)
            Ids = []
            for id in Ids_:
                if id != '':
                    Ids.append(int(id))
            if Ids != []:
                _qs = _qs.filter(wares__merchtypechild__merchtype__typeset__in=Ids)
        if merchtypeIds:
            Ids_ = re.split(r',|\]|\[',merchtypeIds)
            Ids = []
            for id in Ids_:
                if id != '':
                    Ids.append(int(id))
            if Ids != []:
                _qs = _qs.filter(wares__merchtypechild__merchtype__in=Ids)
        if merchtypechildIds:
            Ids_ = re.split(r',|\]|\[',merchtypechildIds)
            Ids = []
            for id in Ids_:
                if id != '':
                    Ids.append(int(id))
            if Ids != []:
                _qs = _qs.filter(wares__merchtypechild__in=Ids)
        
        if ware:
            if ware != '':
                _qs = _qs.filter(wares__id = int(ware))
        
        return _qs

          
    
#生成基础表单序列化文件
class WareSKUOptionViews(MyModelViewSet):

    # queryset = WareSKU.objects.filter(deleted__exact='0')
    serializer_class = WareSKUOptionSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [DjangoFilterBackend, filters.SearchFilter]
    filterset_fields = ['id','name']
    search_fields = ['name',]
    def get_queryset(self, *args, **kwargs):
        # 获取查询用户所在组,获取组内用户
        qs = Group.objects.filter(user=self.request.user)
        
        if self.request.user.is_superuser:
            return WareSKU.objects.filter(deleted__exact='0')
        else:
            ungroups = WareSKU.objects.filter(deleted__exact='0').exclude(group__in=qs)
            return WareSKU.objects.filter(deleted__exact='0').exclude(id__in=ungroups)
    