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
class MerchSetSerializer(serializers.ModelSerializer):

    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = MerchSet
        fields = "__all__"
    
#生成基础表单序列化文件
class MerchSetOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = MerchSet
        fields = ['value', 'label']
    
#生成基础表单序列化文件
class TypeSetSerializer(serializers.ModelSerializer):

    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = TypeSet
        fields = "__all__"
    
#生成基础表单序列化文件
class TypeSetOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = TypeSet
        fields = ['value', 'label']
    
#生成基础表单序列化文件
class MerchTypeSerializer(serializers.ModelSerializer):

    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = MerchType
        fields = "__all__"
    
#生成基础表单序列化文件
class MerchTypeOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = MerchType
        fields = ['value', 'label']
    
#生成基础表单序列化文件
class MerchTypeChildSerializer(serializers.ModelSerializer):

    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = MerchTypeChild
        fields = "__all__"
    
#生成基础表单序列化文件
class MerchTypeChildOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = MerchTypeChild
        fields = ['value', 'label']
    