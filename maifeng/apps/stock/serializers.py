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
class StorageSerializer(serializers.ModelSerializer):
    images = serializers.SerializerMethodField()
    imgpath = serializers.SerializerMethodField()
    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = Storage
        fields = "__all__"
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
class StorageOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = Storage
        fields = ['value', 'label']
    
#生成基础表单序列化文件
class StockSerializer(serializers.ModelSerializer):

    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = Stock
        fields = "__all__"
    
#生成基础表单序列化文件
class StockOptionSerializer(serializers.ModelSerializer):

    # value = serializers.IntegerField(source='id')
    storage_name = serializers.CharField(source='storage', read_only=True)
    wares_name = serializers.CharField(source='waresku.wares', read_only=True)
    waresku_name = serializers.CharField(source='waresku', read_only=True)
    class Meta:
        model = Stock
        fields = ['id' ,'storage_name','wares_name','waresku_name','stock']
    