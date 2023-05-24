import 'package:get/get.dart';

import '../controllers/waresDetails_controller.dart';


class WaresDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaresDetailsController>(
          () => WaresDetailsController(),
    );
  }
}