#!/usr/bin/env python
# -*- coding: UTF-8 -*-
import os
import sys
from .models import *
from rest_framework import mixins
from rest_framework import serializers
from rest_framework.serializers import *

# # 声明一个NewModel模型表单的序列化器
# class NewModelSerializer(serializers.ModelSerializer):

#     # 序列化处理方法，用来获取对应字段对应外键的其他内容，比如用户id的用户名
#     new_Char = serializers.CharField(source='某字段.对应外键', read_only=True)

#     # 序列化处理方法，用来处理让时间按特定格式显示
#     date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

#     # 序列化处理方法，用来处理显示模型中没有的字段
#     new_serializer_name = serializers.SerializerMethodField()

#     class Meta:
#         model = NewModel
#         fields = "__all__"

#     # 编写想要自定义的序列化处理方法
#     def get_new_serializer_name(self, obj):
#         # 在这里写处理逻辑，并修改返回内容
#         return obj.id



#生成基础表单序列化文件
class LargeRegionSerializer(serializers.ModelSerializer):

    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = LargeRegion
        fields = "__all__"
    
#生成基础表单序列化文件
class LargeRegionOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = LargeRegion
        fields = ['value', 'label']
    
#生成基础表单序列化文件
class RegionSerializer(serializers.ModelSerializer):

    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = Region
        fields = "__all__"
    
#生成基础表单序列化文件
class RegionOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = Region
        fields = ['value', 'label']
    
#生成基础表单序列化文件
class ShopSerializer(serializers.ModelSerializer):
    images = serializers.SerializerMethodField()
    imgpath = serializers.SerializerMethodField()
    shoptype_name = serializers.SerializerMethodField()
    descshow = serializers.SerializerMethodField()
    size_name = serializers.SerializerMethodField()# size_choices = ( ('XS', '超小店'),('S', '小店'),('M', '中店'),('L', '大店'),('XL', '特大店'),('O', '其他'))
    largeregion_name = serializers.CharField(source='region.largeregion.name', read_only=True)
    region_name = serializers.CharField(source='region.name', read_only=True)
    manage_name = serializers.CharField(source='manage.realname', read_only=True)
    manage_tel = serializers.CharField(source='manage.telephone', read_only=True)
    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = Shop
        fields = "__all__"
    def get_descshow(self, obj):
        if obj.desc is not None and len(obj.desc)>15:
            return obj.desc[0:19] + '…'
        elif obj.desc is not None and len(obj.desc)<15 and len(obj.desc)>1:
            return obj.desc
        else:
            return '暂无说明'
    def get_size_name(self, obj):
        sizes = {'XS':'超小店','S':'小店','M':'中店','L': '大店','XL': '特大店','O':'其他'}
        if obj.size:
            return sizes[obj.size]
    def get_shoptype_name(self, obj):
        if obj.shoptype:
            return obj.shoptype.name
        else:
            return ''
    def get_imgpath(self, obj):
        imgpath = ''
        if obj.img:
            imgpath = self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img.img)
        return imgpath
    def get_images(self, obj):
        images = []
        if obj.img:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img.img))
        return images
    
#生成基础表单序列化文件
class ShopOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    # label = serializers.CharField(source='name')
    label = serializers.SerializerMethodField()

    class Meta:
        model = Shop
        fields = ['value', 'label']
    def get_label(self, obj):
        label = str(obj.id)
        if obj.code:
            label = label + '-' + obj.code
        if obj.name:
            label = label + '-' + obj.name
        return label
    
#增加门店类型
class ShopTypeSerializer(serializers.ModelSerializer):

    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = ShopType
        fields = "__all__"
    
#增加门店类型
class ShopTypeOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = ShopType
        fields = ['value', 'label']
    