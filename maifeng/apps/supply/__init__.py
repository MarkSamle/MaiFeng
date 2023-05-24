from django.apps import AppConfig
import os
 
default_app_config = 'supply.SupplyConfig'

def get_current_app_name(_file):
    return os.path.split(os.path.dirname(_file))[-1]
 
class SupplyConfig(AppConfig):
    name = get_current_app_name(__file__)
    verbose_name = '供应管理'