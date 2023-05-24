import 'package:get/get.dart';

import '../controllers/workbench_controller.dart';

class WorkbenchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkbenchController>(
          () => WorkbenchController(),
    );
  }
}
