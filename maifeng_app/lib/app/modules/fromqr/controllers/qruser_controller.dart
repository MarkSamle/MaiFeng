

import 'package:get/get.dart';

import '../../../../store/login_store.dart';
import '../../../../store/wares_store.dart';
import '../../../routes/app_pages.dart';

class QRUserController extends GetxController {
  LoginStore _loginStore = LoginStore();

  // 回到上一页
  void turnHOME() async {
    Get.offNamed(Routes.HOME);
    return ;
  }

  // 存储数据
  static Map userData = {};



  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    super.onClose();
  }
}