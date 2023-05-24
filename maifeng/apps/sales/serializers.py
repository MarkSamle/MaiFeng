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
class SalesSerializer(serializers.ModelSerializer):

    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = Sales
        fields = "__all__"
    
#生成基础表单序列化文件
class SalesOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = Sales
        fields = ['value', 'label']
    
#生成基础表单序列化文件
class SalesDetailsSerializer(serializers.ModelSerializer):

    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = SalesDetails
        fields = "__all__"
    
#生成基础表单序列化文件
class SalesDetailsOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = SalesDetails
        fields = ['value', 'label']
    
#增加促销计划
class PromotionSerializer(serializers.ModelSerializer):
    entry_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    stop_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = Promotion
        fields = "__all__"
    
#增加促销计划
class PromotionOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = Promotion
        fields = ['value', 'label']
    