# Generated by Django 3.0 on 2022-03-30 13:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('store', '0005_shop_img'),
    ]

    operations = [
        migrations.AlterField(
            model_name='shoptype',
            name='name',
            field=models.CharField(help_text='门店类型（CharField）', max_length=4, verbose_name='门店类型'),
        ),
    ]