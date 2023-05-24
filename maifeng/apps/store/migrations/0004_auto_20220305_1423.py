# Generated by Django 3.0 on 2022-03-05 06:23

from django.db import migrations, models
import django.db.models.deletion
import mdeditor.fields


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0004_auto_20220220_1402'),
        ('auth', '0011_update_proxy_permissions'),
        ('store', '0003_auto_20220220_1436'),
    ]

    operations = [
        migrations.AddField(
            model_name='shop',
            name='square',
            field=models.DecimalField(blank=True, decimal_places=2, default=0, help_text='店平方（CharField）', max_digits=10, null=True, verbose_name='店平方'),
        ),
        migrations.CreateModel(
            name='ShopType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(help_text='门店类型（CharField）', max_length=60, verbose_name='门店类型')),
                ('desc', mdeditor.fields.MDTextField(blank=True, verbose_name='说明')),
                ('created_date', models.DateTimeField(auto_now_add=True, help_text='创建时间（DateTimeField）', null=True, verbose_name='创建时间')),
                ('last_edited_date', models.DateTimeField(auto_now=True, help_text='最后编辑时间（DateTimeField）', null=True, verbose_name='最后编辑时间')),
                ('deleted', models.CharField(choices=[('0', '未删除'), ('1', '已删除')], default='0', help_text='是否删除（CharField，可选值：0，1）', max_length=1, verbose_name='是否删除')),
                ('created_by', models.ForeignKey(blank=True, help_text='创建人ID（ForeignKey）', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='ShopType_cb', to='users.UserExtension', verbose_name='创建人ID')),
                ('group', models.ManyToManyField(blank=True, help_text='可见分组', related_name='ShopType_group', to='auth.Group', verbose_name='可见分组')),
                ('last_edited_by', models.ForeignKey(blank=True, help_text='最后编辑人ID（ForeignKey）', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='ShopType_eb', to='users.UserExtension', verbose_name='最后编辑人ID')),
            ],
            options={
                'verbose_name': '门店类型',
                'verbose_name_plural': '门店类型',
                'ordering': ['-id'],
            },
        ),
        migrations.AddField(
            model_name='shop',
            name='shoptype',
            field=models.ForeignKey(blank=True, help_text='店类型（ForeignKey）', null=True, on_delete=django.db.models.deletion.CASCADE, related_name='shoptype', to='store.ShopType', verbose_name='店类型'),
        ),
    ]