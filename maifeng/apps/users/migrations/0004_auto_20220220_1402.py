# Generated by Django 3.0 on 2022-02-20 06:02

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0003_remove_userextension_created_by'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='portrait',
            options={'ordering': ['-id'], 'verbose_name': '用户头像', 'verbose_name_plural': '用户头像'},
        ),
    ]
