#!/usr/bin/env python
# -*- coding: UTF-8 -*-
import os
import sys
from .models import *
from rest_framework import mixins
from rest_framework import serializers
from rest_framework.serializers import *

from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

# 登录验证
class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)
        token['name'] = user.username
        return token

# 注册序列化
class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id']

# 验证码
class TelCodeSerializer(serializers.ModelSerializer):
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    class Meta:
        model = TelCode
        fields = "__all__"
#first
class TelCodeOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    # label = serializers.CharField(source='name')

    class Meta:
        model = TelCode
        fields = ['value', ]
    
# 用户拓展信息
class UserExtensionSerializer(serializers.ModelSerializer):
    portrait_src = serializers.ImageField(source='portrait.portrait', read_only=True)
    username = serializers.CharField(source='user.username', read_only=True)
    # groups = serializers.SerializerMethodField()

    class Meta:
        model = UserExtension
        fields = "__all__"
    
# 用户拓展信息下拉选
class UserExtensionOptionSerializer(serializers.ModelSerializer):

    value = serializers.CharField(source='id', read_only=True)
    label = serializers.CharField(source='realname', read_only=True)
    username = serializers.CharField(source='user.username', read_only=True)

    class Meta:
        model = UserExtension
        fields = ['value', 'label','username']
    
#first
class PortraitSerializer(serializers.ModelSerializer):

    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = Portrait
        fields = "__all__"
    
#first
class PortraitOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    # label = serializers.CharField(source='name')

    class Meta:
        model = Portrait
        fields = ['value', ]
