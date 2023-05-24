import 'package:get/get.dart';

import '../controllers/shopDetails_controller.dart';



class ShopDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopDetailsController>(
          () => ShopDetailsController(),
    );
  }
}