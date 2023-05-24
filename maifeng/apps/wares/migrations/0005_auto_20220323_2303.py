# Generated by Django 3.0 on 2022-03-23 15:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('wares', '0004_auto_20220223_2344'),
    ]

    operations = [
        migrations.AlterField(
            model_name='wares',
            name='code',
            field=models.CharField(blank=True, help_text='货号（CharField）', max_length=15, verbose_name='货号'),
        ),
        migrations.AlterField(
            model_name='wares',
            name='name',
            field=models.CharField(help_text='品名（CharField）', max_length=15, verbose_name='品名'),
        ),
        migrations.AlterField(
            model_name='waresku',
            name='code',
            field=models.CharField(blank=True, help_text='色号（CharField）', max_length=15, verbose_name='色号'),
        ),
        migrations.AlterField(
            model_name='waresku',
            name='name',
            field=models.CharField(help_text='SKU（CharField）', max_length=15, verbose_name='SKU'),
        ),
    ]
