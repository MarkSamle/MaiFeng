import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<MessageController>(() => MessageController());
    // Get.lazyPut<MineController>(() => MineController());
  }
}
