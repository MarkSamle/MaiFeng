

import 'package:get/get.dart';

import '../../../../store/login_store.dart';
import '../../../../store/wares_store.dart';
import '../../../routes/app_pages.dart';

class QRWaresController extends GetxController {
  LoginStore _loginStore = LoginStore();
  WaresStore _waresStore = WaresStore();

  // 回到上一页
  void turnHOME() async {
      Get.offNamed(Routes.HOME);
    return ;
  }

  // 存储数据
  static Map waresData = {};
  // static List<Map<String, String>> picItems = [];
  static List picItems = [
    'https://www.eatqionline.top:8008/media/img/logo/maifeng_dgHndBi.png',
    'https://www.eatqionline.top:8008/media/img/logo/traveler.png',
    'https://www.eatqionline.top:8008/media/img/logo/todo.png',
    'https://www.eatqionline.top:8008/media/img/logo/movie.png',
    'https://www.eatqionline.top:8008/media/img/logo/AboutU.jpg',
    'https://www.eatqionline.top:8008/media/img/logo/wologo.png',
    'https://www.eatqionline.top:8008/media/img/logo/serplogo.png',
    'https://www.eatqionline.top:8008/media/img/logo/meeting.png',
    'https://www.eatqionline.top:8008/media/img/logo/blog.png',
  ];
  static List<Map> imageList = [
    {
      "url":"http://www.itying.com/images/flutter/1.png"
    },
    {
      "url":"http://www.itying.com/images/flutter/2.png"
    },
    {
      "url":"http://www.itying.com/images/flutter/3.png"
    },
    {
      "url":"http://www.itying.com/images/flutter/4.png"
    }
  ];

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