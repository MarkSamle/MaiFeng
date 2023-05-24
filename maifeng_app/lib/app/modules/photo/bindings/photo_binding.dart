import 'package:get/get.dart';

import '../controllers/photo_controller.dart';
// import '../controllers/qr_scan_controller.dart';

class PhotoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoController>(
          () => PhotoController(),
    );
  }
}