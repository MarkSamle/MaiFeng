
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../routes/app_pages.dart';

class ShopDetailsController extends GetxController {

  // 回到上一页
  void turnBack() async {
    Get.offNamed(Routes.SHOP);
    return ;
  }
  tel(String tel)async {
    var url = 'tel:$tel';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  // 存储数据
  static Map shopData = {};
  List picItems = [];
  List<Map> imageList = [];

  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    super.onReady();
  }
  @override
  void onClose() {
    super.onClose();
  }
}