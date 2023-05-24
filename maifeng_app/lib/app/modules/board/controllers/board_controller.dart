import 'package:get/get.dart';

import '../../../../api/user/user_api.dart';
import '../../../../api/wares/wares_api.dart';
import '../../../../store/login_store.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../util/my_toast.dart';
import '../../../routes/app_pages.dart';
import 'dart:convert' as convert;

import '../../fromqr/controllers/qruser_controller.dart';
import '../../fromqr/controllers/qrwares_controller.dart' as qrwares;
import '../../fromqr/controllers/qrwares_controller.dart';
import '../../wares/controllers/skuDetails_controller.dart';
import '../../wares/controllers/waresDetails_controller.dart';
class BoardController extends GetxController {
// 初始化缓存
  LoginStore _loginStorestore = LoginStore();
  bool isAdmin = false;
//  判断是否超级管理员
  void isSuper() async {
    bool isSuper = await _loginStorestore.getSuper();
    if (isSuper) {
      isAdmin = true;
    }
  }
  // 扫一扫
  String qrCode = '';
  void handleScan() async {
    await [Permission.camera].request();
    await Get.toNamed(Routes.QR_SCAN)?.then((value) async {
      if (value == null) return;
      qrCode = value;
      // MyToast.success2(qrCode);
      Map<String, dynamic> jsondata = convert.jsonDecode(qrCode);
      if (jsondata['api'] == 'wares') {
        WaresDetailsController.waresData = await WraesApi.getWares(jsondata['code']);
        Get.toNamed(Routes.WARESDETAILS);
      } else if (jsondata['api'] == 'waresku') {
        SkuDetailsController.skuData = await WraesApi.getSku(jsondata['wares'],jsondata['code']);
        Get.toNamed(Routes.SKUDETAILS);
      } else if (jsondata['api'] == 'user') {
        QRUserController.userData = await UserApi.getUser(jsondata['username']);
        Get.toNamed(Routes.QRUSER);
      }
      print(qrCode);
    });
  }
  // 跳转回首页
  void turnLogin() async {
    _loginStorestore.setToken('');
    Get.offNamed(Routes.LOGIN);
    return ;
  }

  final count = 0.obs;
  @override
  void onInit() {
    isSuper();
    _loginStorestore.setPage('board');
    print('--------------board');
    super.onInit();
  }

  @override
  void onReady() {
    isSuper();
    _loginStorestore.setPage('board');
    print('-------------board');
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
