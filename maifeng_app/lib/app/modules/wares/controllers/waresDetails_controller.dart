
import 'package:get/get.dart';
import 'package:maifeng_app/app/modules/wares/controllers/sku_controller.dart';

import '../../../../store/login_store.dart';
import '../../../../store/wares_store.dart';
import '../../../routes/app_pages.dart';

class WaresDetailsController extends GetxController {
  LoginStore _loginStore = LoginStore();
  WaresStore _waresStore = WaresStore();

  // 回到上一页
  void turnBack() async {
    Get.offNamed(Routes.WARES);
    // Get.back();
    return ;
  }

  // 存储数据
  static Map waresData = {};
  List picItems = [];
  List<Map> imageList = [];

  static void toPage(String id) async {
    SkuController.wareid = id;
    Get.toNamed(Routes.SKU);
    return ;
  }

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