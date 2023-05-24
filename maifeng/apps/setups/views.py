from django.shortcuts import render
from django.views.decorators.clickjacking import xframe_options_exempt


from django.utils.timezone import now
from .models import *
from .serializers import *
from rest_framework import filters
from rest_framework import permissions
from django_filters.rest_framework import DjangoFilterBackend
from tool import restful
from tool.paginations import CommonPagination
from rewrite.my_modelviewset import MyModelViewSet
from rewrite.my_mixins import MyListModelMixin

import math

# Create your views here.
@xframe_options_exempt
def homePage(request):
    if  request.method=='GET':
        context = {}
        context['page_urls'] = []
        json_list = []
        page_urls = SysImages.objects.filter(deleted='0').filter(with_models='page_urls')
        for page_url in SysImagesSerializer(page_urls, many=True).data:
            page_data = {'name':page_url['name'],'path':page_url['path'],'img':page_url['img']}
            json_list.append(page_data)
        cut = 3
        for i in range(0,math.ceil(len(json_list)/cut)):
            context['page_urls'].append(json_list[i*cut:i*cut+cut])
        
        return render(request, 'homepage.html',context)
    # return render(request, 'homepage.html')
#系统配置
# router.register(r'SysImages',Views.SysImages, basename='')
# class SysImagesViews(MyModelViewSet):

#     queryset = SysImages.objects.filter(deleted__exact='0')
#     serializer_class = SysImagesSerializer
#     permission_classes = [permissions.IsAuthenticated]
#     pagination_class = CommonPagination
#     filter_backends = [DjangoFilterBackend, filters.SearchFilter]
#     filterset_fields = ['id','name']
#     #search_fields = ['realname', 'user__username']
    
# #系统配置
# class SysImagesOptionViews(MyModelViewSet):

#     queryset = SysImages.objects.filter(deleted__exact='0')
#     serializer_class = SysImagesOptionSerializer
#     permission_classes = [permissions.IsAuthenticated]
#     filter_backends = [DjangoFilterBackend, filters.SearchFilter]
#     filterset_fields = ['id','name']
#     search_fields = ['name',]
    