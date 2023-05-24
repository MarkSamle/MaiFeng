import 'package:get/get.dart';

import '../controllers/sku_controller.dart';


class SkuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SkuController>(
          () => SkuController(),
    );
  }
}