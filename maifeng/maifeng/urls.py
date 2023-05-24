"""maifeng URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""


from django.contrib import admin
from django.urls import path, include, re_path
from django.views.static import serve
from django.views.generic import TemplateView
from django.conf.urls.static import static
from django.views.generic.base import RedirectView
# from django.contrib.staticfiles.views import serve
from rest_framework import routers
from rest_framework.documentation import include_docs_urls

from maifeng.settings import MEDIA_URL, MEDIA_ROOT, STATIC_ROOT

from users import views as usersViews
from files import views as filesViews
from merch import views as merchViews
from wares import views as waresViews
from supply import views as supplyViews
from store import views as storeViews
from sales import views as salesViews
from statistic import views as statisticViews
from stock import views as stockViews
from setups import views as setupsViews

router = routers.DefaultRouter()

# router.register(r'', .usersViews, basename='')
router.register(r'rc', usersViews.RegisterCodeViewSet, basename='rc')
router.register(r'register', usersViews.Register, basename='register')
router.register(r'fc', usersViews.ForgetCodeViewSet, basename='fc')
router.register(r'forget', usersViews.Forget, basename='forget')
router.register(r'code', usersViews.TelCodeViews, basename='code')
router.register(r'myself',usersViews.MySelf, basename='myself')
router.register(r'user-extension', usersViews.UserExtensionViews, basename='user-extension')
router.register(r'user-extension-option', usersViews.UserExtensionOptionViews, basename='user-extension-option')
router.register(r'portrait', usersViews.PortraitViews, basename='portrait')


# router.register(r'', .filesViews, basename='')
router.register(r'imgs', filesViews.ImagesViews, basename='imgs')
# router.register(r'imgs-option', FilesViews.ImagesOptionViews, basename='imgs-option')
router.register(r'files', filesViews.FilesViews, basename='files')
# router.register(r'files-option', FilesViews.FilesOptionViews, basename='files-option')

router.register(r'merch-set', merchViews.MerchSetViews, basename='merch-set')
router.register(r'merch-set-option', merchViews.MerchSetOptionViews, basename='merch-set-option')
router.register(r'type-set', merchViews.TypeSetViews, basename='type-set')
router.register(r'type-set-option', merchViews.TypeSetOptionViews, basename='type-set-option')
router.register(r'merch-type', merchViews.MerchTypeViews, basename='merch-type')
router.register(r'merch-type-option', merchViews.MerchTypeOptionViews, basename='merch-type-option')
router.register(r'merch-type-child', merchViews.MerchTypeChildViews, basename='merch-type-child')
router.register(r'merch-type-child-option', merchViews.MerchTypeChildOptionViews, basename='merch-type-child-option')


router.register(r'wares', waresViews.WaresViews, basename='wares')
router.register(r'wares-option', waresViews.WaresOptionViews, basename='wares-option')
router.register(r'ware-sku', waresViews.WareSKUViews, basename='ware-sku')
router.register(r'ware-sku-option', waresViews.WareSKUOptionViews, basename='ware-sku-option')


router.register(r'supply', supplyViews.SupplyViews, basename='supply')
router.register(r'supply-option', supplyViews.SupplyOptionViews, basename='supply-option')


router.register(r'large-region', storeViews.LargeRegionViews, basename='large-region')
router.register(r'large-region-option', storeViews.LargeRegionOptionViews, basename='large-region-option')
router.register(r'region', storeViews.RegionViews, basename='region')
router.register(r'region-option', storeViews.RegionOptionViews, basename='region-option')
router.register(r'shop-type', storeViews.ShopTypeViews, basename='shop-type')
router.register(r'shop-type-option', storeViews.ShopTypeOptionViews, basename='shop-type-option')
router.register(r'shop', storeViews.ShopViews, basename='shop')
router.register(r'shop-option', storeViews.ShopOptionViews, basename='shop-option')

router.register(r'promotion', salesViews.PromotionViews, basename='promotion')
router.register(r'promotion-option', salesViews.PromotionOptionViews, basename='promotion-option')
router.register(r'sales', salesViews.SalesViews, basename='sales')
router.register(r'sales-option', salesViews.SalesOptionViews, basename='sales-option')
router.register(r'sales-details', salesViews.SalesDetailsViews, basename='sales-details')
router.register(r'sales-details-option', salesViews.SalesDetailsOptionViews, basename='sales-details-option')


router.register(r'storage', stockViews.StorageViews, basename='storage')
router.register(r'storage-option', stockViews.StorageOptionViews, basename='storage-option')
router.register(r'stock', stockViews.StockViews, basename='stock')
router.register(r'stock-option', stockViews.StockOptionViews, basename='stock-option')


# router.register(r'', statisticViews., basename='')



urlpatterns = [
    # path('', TemplateView.as_view(template_name='index.html')),
    path(r'', setupsViews.homePage, name=''),
    path('api/', include(router.urls)),
    path('admin/', admin.site.urls),
    path('docs/', include_docs_urls(title="接口文档")),
    path('api-auth/', include('rest_framework.urls', namespace='rest_framework')),  
    path('login/', usersViews.Login.as_view(), name='my_token'),
    # 配置mdeditor路由
    path(r'mdeditor/', include('mdeditor.urls')),
    path('favicon.ico', RedirectView.as_view(url='static/img/favicon.ico')),
    # django关闭debug模式后，静态文件无法访问，这里要设置下静态文件的访问路由
    re_path(r'^static/(?P<path>.*)$', serve, {'document_root': STATIC_ROOT}),
    re_path(r'^media/(?P<path>.*)', serve, {"document_root": MEDIA_ROOT}),
] + static(MEDIA_URL, document_root=MEDIA_ROOT)







