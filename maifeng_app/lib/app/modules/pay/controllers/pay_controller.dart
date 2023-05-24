import 'dart:convert' as convert;

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:maifeng_app/app/modules/pay/models/basket_model.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../api/wares/wares_api.dart';
import '../../../../util/my_toast.dart';
import '../../../routes/app_pages.dart';
import 'basket_controller.dart';
import 'basket_controller.dart';

class PayController extends GetxController {

  static List<String> shopChoicesItems = [];
  static String shopChoices = '';
  static List shopOption = [];
  static Map<String,String> shopOptionMap = {};

  // 扫一扫
  String qrCode = '';
  void handleScan() async {
    await [Permission.camera].request();
    await Get.toNamed(Routes.QR_SCAN)?.then((value) async {
      if (value == null) return;
      qrCode = value;
      // MyToast.success2(qrCode);
      Map<String, dynamic> jsondata = convert.jsonDecode(qrCode);
      if (jsondata['api'] == 'waresku') {
        Map skuData = await WraesApi.getSku(jsondata['wares'],jsondata['code']);
        BasketController.beforeSkuDataItems.add(skuData['results']['data'][0]);
        BasketController.skuDataItems =  ModuleList.fromJson(BasketController.beforeSkuDataItems);
        // print(skuData['results']['data'][0]);
        Get.toNamed(Routes.BASKET);

      }
      print(qrCode);
    });
  }

  // 跳转页面
  bool theRefresh = false;
  void goPage(String page) async {
    print('门店ID----------->');
    print(shopOptionMap[shopChoices]);
    print('跳转页面-------------');
    print(page);
    if (page == 'code') {
      handleScan();
    } else if (page == 'basket') {
      Get.toNamed(Routes.BASKET)?.then((value) async {
        if (value == null) return;
        if (value == true) {
          MyToast.success2('删除成功');
          Get.back(result: true);
        }
      });
    }
    // Get.toNamed(Routes.Demo)?.then((value) async {
    //   if (value == null) return;
    //   if (value == true) {
    //     MyToast.success2('删除成功');
    //     Get.back(result: true);
    //   }
    // }
    // );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}