import 'package:get/get.dart';

import '../controllers/wares_controller.dart';


class WaresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaresController>(
          () => WaresController(),
    );
  }
}