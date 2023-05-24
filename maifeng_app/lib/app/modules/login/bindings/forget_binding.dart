import 'package:get/get.dart';

import '../controllers/forget_controller.dart';

class ForgetBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ForgetController>(
          () => ForgetController(),
    );
  }

}