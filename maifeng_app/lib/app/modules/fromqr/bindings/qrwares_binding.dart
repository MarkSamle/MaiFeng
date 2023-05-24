import 'package:get/get.dart';

import '../controllers/qrwares_controller.dart';


class QRWaresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QRWaresController>(
          () => QRWaresController(),
    );
  }
}