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
class WaresSerializer(serializers.ModelSerializer):
    # 'id':1,
    # 'title':'[xxx1]测试标题',
    # 'desc':'The msg is the Desc1 !',
    # 'imgpath':'',

    merchset = serializers.SerializerMethodField()
    typeset = serializers.SerializerMethodField()
    merchtype = serializers.SerializerMethodField()
    merchtypechild_name = serializers.SerializerMethodField()
    images = serializers.SerializerMethodField()
    imgpath = serializers.SerializerMethodField()
    descshow = serializers.SerializerMethodField()
    sku_num = serializers.SerializerMethodField()
    sku_bid = serializers.SerializerMethodField()
    sku_fix = serializers.SerializerMethodField()
    sku_base = serializers.SerializerMethodField()
    sku_startorder = serializers.SerializerMethodField()
    sku_delivery = serializers.SerializerMethodField()
    supply_name = serializers.CharField(source='supply.name', read_only=True)
    title = serializers.CharField(source='name', read_only=True)
    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = Wares
        fields = "__all__"
    def get_sku_num(self, obj):
        WareSKU.objects.filter(deleted__exact='0',wares=obj).count()
        return WareSKU.objects.filter(deleted__exact='0',wares=obj).count()
    def get_sku_bid(self, obj):
        bid_ = WareSKU.objects.filter(deleted__exact='0',wares=obj).order_by('bid')
        return bid_.first().bid
    def get_sku_fix(self, obj):
        fix_ = WareSKU.objects.filter(deleted__exact='0',wares=obj).order_by('fix')
        return fix_.first().fix
    def get_sku_base(self, obj):
        base_ = WareSKU.objects.filter(deleted__exact='0',wares=obj).order_by('base')
        return base_.first().base
    def get_sku_startorder(self, obj):
        startorder_ = WareSKU.objects.filter(deleted__exact='0',wares=obj).order_by('startorder')
        return startorder_.first().startorder
    def get_sku_delivery(self, obj):
        delivery_ = WareSKU.objects.filter(deleted__exact='0',wares=obj).order_by('delivery')
        return delivery_.first().delivery
        
    def get_descshow(self, obj):
        if obj.desc is not None and len(obj.desc)>15:
            return obj.desc[0:19] + '…'
        elif obj.desc is not None and len(obj.desc)<15 and len(obj.desc)>1:
            return obj.desc
        else:
            return '暂无说明'
    def get_merchset(self, obj):
        if obj.merchtypechild:
            return obj.merchtypechild.merchtype.typeset.merchset.name
    def get_typeset(self, obj):
        if obj.merchtypechild:
            return obj.merchtypechild.merchtype.typeset.name
    def get_merchtype(self, obj):
        if obj.merchtypechild:
            return obj.merchtypechild.merchtype.name
    def get_merchtypechild_name(self, obj):
        if obj.merchtypechild:
            return obj.merchtypechild.name
    def get_imgpath(self, obj):
        imgpath = ''
        if obj.img1:
            imgpath = self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img1.img)
        return imgpath
    def get_images(self, obj):
        images = []
        if obj.img1:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img1.img))
        if obj.img2:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img2.img))
        if obj.img3:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img3.img))
        if obj.img4:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img4.img))
        if obj.img5:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img5.img))
        if obj.img6:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img6.img))
        if obj.img7:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img7.img))
        if obj.img8:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img8.img))
        if obj.img9:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img9.img))
        return images
    
#生成基础表单序列化文件
class WaresOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = Wares
        fields = ['value', 'label']
    
#生成基础表单序列化文件
class WareSKUSerializer(serializers.ModelSerializer):
    merchset = serializers.SerializerMethodField()
    typeset = serializers.SerializerMethodField()
    merchtype = serializers.SerializerMethodField()
    merchtypechild_name = serializers.SerializerMethodField()
    images = serializers.SerializerMethodField()
    imgpath = serializers.SerializerMethodField()
    descshow = serializers.SerializerMethodField()
    code = serializers.SerializerMethodField()
    logistics = serializers.CharField(source='wares.logistics', read_only=True)
    warescode = serializers.CharField(source='wares.code', read_only=True)
    skucode = serializers.CharField(source='code', read_only=True)
    supply_name = serializers.CharField(source='wares.supply.name', read_only=True)
    title = serializers.SerializerMethodField() # serializers.CharField(source='name', read_only=True)
    created_by_name = serializers.CharField(source='created_by.realname', read_only=True)
    created_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')
    last_edited_by_name = serializers.CharField(source='last_edited_by.realname', read_only=True)
    last_edited_date = serializers.DateTimeField(required=False, format='%Y-%m-%d %H:%M:%S')

    class Meta:
        model = WareSKU
        fields = "__all__"
    def get_code(self, obj):
        if obj.wares.code:
            return obj.wares.code + '-' + obj.code
        else:
            return obj.code
    def get_title(self, obj):
        if obj.wares.name:
            return obj.wares.name + '-' + obj.name
        else:
            return obj.name
            
    def get_descshow(self, obj):
        if obj.desc is not None and len(obj.desc)>15:
            return obj.desc[0:19] + '…'
        elif obj.desc is not None and len(obj.desc)<15 and len(obj.desc)>1:
            return obj.desc
        else:
            return '暂无说明'
    def get_merchset(self, obj):
        if obj.wares.merchtypechild:
            return obj.wares.merchtypechild.merchtype.typeset.merchset.name
    def get_typeset(self, obj):
        if obj.wares.merchtypechild:
            return obj.wares.merchtypechild.merchtype.typeset.name
    def get_merchtype(self, obj):
        if obj.wares.merchtypechild:
            return obj.wares.merchtypechild.merchtype.name
    def get_merchtypechild_name(self, obj):
        if obj.wares.merchtypechild:
            return obj.wares.merchtypechild.name
    def get_imgpath(self, obj):
        imgpath = ''
        if obj.img1:
            imgpath = self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img1.img)
        return imgpath
    
    def get_images(self, obj):
        images = []
        if obj.img1:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img1.img))
        if obj.img2:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img2.img))
        if obj.img3:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img3.img))
        if obj.img4:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img4.img))
        if obj.img5:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img5.img))
        if obj.img6:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img6.img))
        if obj.img7:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img7.img))
        if obj.img8:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img8.img))
        if obj.img9:
            images.append(self.context['request'].META['wsgi.url_scheme'] + '://' + self.context['request'].META['HTTP_HOST'] + '/media/' + str(obj.img9.img))
        return images
    
#生成基础表单序列化文件
class WareSKUOptionSerializer(serializers.ModelSerializer):

    value = serializers.IntegerField(source='id')
    label = serializers.CharField(source='name')

    class Meta:
        model = WareSKU
        fields = ['value', 'label']
    