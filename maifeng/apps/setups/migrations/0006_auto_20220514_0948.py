# Generated by Django 3.0 on 2022-05-14 01:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('setups', '0005_auto_20220301_1428'),
    ]

    operations = [
        migrations.AlterField(
            model_name='sysimages',
            name='img',
            field=models.ImageField(blank=True, help_text='图片（ImageField）', null=True, upload_to='sys_imgs/%Y/%m/', verbose_name='图片'),
        ),
    ]