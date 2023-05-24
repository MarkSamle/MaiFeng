import 'package:get/get.dart';

import '../controllers/skuDetails_controller.dart';
import '../controllers/waresDetails_controller.dart';


class SkuDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SkuDetailsController>(
          () => SkuDetailsController(),
    );
  }
}