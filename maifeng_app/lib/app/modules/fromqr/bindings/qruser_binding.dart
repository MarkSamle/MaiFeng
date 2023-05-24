import 'package:get/get.dart';

import '../controllers/qruser_controller.dart';


class QRUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QRUserController>(
          () => QRUserController(),
    );
  }
}