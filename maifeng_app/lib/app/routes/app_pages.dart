import 'package:get/get.dart';

import 'package:maifeng_app/app/modules/home/bindings/home_binding.dart';
import 'package:maifeng_app/app/modules/home/views/home_view.dart';
import 'package:maifeng_app/app/modules/login/bindings/login_binding.dart';
import 'package:maifeng_app/app/modules/login/views/login_view.dart';
import 'package:maifeng_app/app/modules/login/bindings/register_binding.dart';
import 'package:maifeng_app/app/modules/login/views/register_view.dart';
import 'package:maifeng_app/app/modules/wares/views/waresDetails_view.dart';

import '../modules/board/bindings/board_binding.dart';
import '../modules/board/views/board_view.dart';
import '../modules/demo/bindings/demo_binding.dart';
import '../modules/demo/views/demo_view.dart';
import '../modules/fromqr/bindings/qruser_binding.dart';
import '../modules/fromqr/bindings/qrwares_binding.dart';
import '../modules/fromqr/views/qruser_view.dart';
import '../modules/fromqr/views/qrwares_view.dart';
import '../modules/login/bindings/forget_binding.dart';
import '../modules/login/views/forget_view.dart';
import '../modules/pay/bindings/basket_binding.dart';
import '../modules/pay/bindings/pay_binding.dart';
import '../modules/pay/views/basket_view.dart';
import '../modules/pay/views/pay_view.dart';
import '../modules/photo/bindings/photo_binding.dart';
import '../modules/photo/views/photo_view.dart';
import '../modules/qrscan/bindings/qr_scan_binding.dart';
import '../modules/qrscan/views/qr_scan_view.dart';
import '../modules/shop/bindings/shopDetails_binding.dart';
import '../modules/shop/bindings/shop_binding.dart';
import '../modules/shop/views/shopDetails_view.dart';
import '../modules/shop/views/shop_view.dart';
import '../modules/user/bindings/user_binding.dart';
import '../modules/user/views/user_view.dart';
import '../modules/wares/bindings/skuDetails_binding.dart';
import '../modules/wares/bindings/sku_binding.dart';
import '../modules/wares/bindings/waresDetails_binding.dart';
import '../modules/wares/bindings/wares_binding.dart';
import '../modules/wares/views/skuDetails_view.dart';
import '../modules/wares/views/sku_view.dart';
import '../modules/wares/views/wares_view.dart';
import '../modules/workbench/bindings/workbench_binding.dart';
import '../modules/workbench/views/workbench_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.Register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.Forget,
      page: () => ForgetView(),
      binding: ForgetBinding(),
    ),
    GetPage(
      name: _Paths.QR_SCAN,
      page: () => QrScanView(),
      binding: QrScanBinding(),
    ),
    GetPage(
      name: _Paths.PHOTO,
      page: () => PhotoView(),
      binding: PhotoBinding(),
    ),
    GetPage(
      name: _Paths.WORKBENCH,
      page: () => WorkbenchView(),
      binding: WorkbenchBinding(),
    ),
    GetPage(
      name: _Paths.BOARD,
      page: () => BoardView(),
      binding: BoardBinding(),
    ),
    GetPage(
      name: _Paths.USER,
      page: () => UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.WARES,
      page: () => WaresView(),
      binding: WaresBinding(),
    ),
    GetPage(
      name: _Paths.SKU,
      page: () => SkuView(),
      binding: SkuBinding(),
    ),
    GetPage(
      name: _Paths.SHOP,
      page: () => ShopView(),
      binding: ShopBinding(),
    ),
    GetPage(
      name: _Paths.SHOPDETAILS,
      page: () => ShopDetailsView(),
      binding: ShopDetailsBinding(),
    ),
    GetPage(
      name: _Paths.WARESDETAILS,
      page: () => WaresDetailsView(),
      binding: WaresDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SKUDETAILS,
      page: () => SkuDetailsView(),
      binding: SkuDetailsBinding(),
    ),
    GetPage(
      name: _Paths.QRWARES,
      page: () => QRWaresView(),
      binding: QRWaresBinding(),
    ),
    GetPage(
      name: _Paths.QRUSER,
      page: () => QRUserView(),
      binding: QRUserBinding(),
    ),
    GetPage(
      name: _Paths.PAY,
      page: () => PayView(),
      binding: PayBinding(),
    ),
    GetPage(
      name: _Paths.DEMO,
      page: () => DemoView(),
      binding: DemoBinding(),
    ),
    GetPage(
      name: _Paths.BASKET,
      page: () => BasketView(),
      binding: BasketBinding(),
    )
  ];
}
