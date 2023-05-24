#!/usr/bin/env python
# -*- coding: UTF-8 -*-
import os
import sys
from .models import *
from rest_framework import mixins
from rest_framework import serializers
from rest_framework.serializers import *

# 声明一个NewModel模型表单的序列化器
class SupplySerializer(serializers.ModelSerializer):

    # 序列化处理方法，用来获取对应字段对应外键的其他内容，比如用户id的用户名
    # 序列化处理方法，用来处理让时间按特定格式显示
    images = serializers.SerializerMethodField()
    imgpath = serializers.SerializerMethodField()
    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)  
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    # 序列化处理方法，用来处理显示模型中没有的字段
    # new_serializer_name = serializers.SerializerMethodField()

    class Meta:
        model = Supply
        fields = ('id', 'name','place','tel','scale','grade','typ', 'desc','images','imgpath','created_by_name', 'created_date', 'last_edited_by_name','last_edited_date')
    
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

    # 编写想要自定义的序列化处理方法
    # def get_new_serializer_name(self, obj):
    #     # 在这里写处理逻辑，并修改返回内容
    #     return obj.id



#生成基础表单序列化文件
class SupplyOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = Supply
        fields = ['value', 'label']
    