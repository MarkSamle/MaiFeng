import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert' as convert;

import '../../../../api/wares/wares_api.dart';
import '../../../routes/app_pages.dart';
import '../models/basket_model.dart';
class BasketController extends GetxController with StateMixin<ModuleList> {

  static Map skuData = {};
  static List<Map> beforeSkuDataItems = [];
  static late ModuleList skuDataItems;
  // static skuDataItems = new dataItem().obs;
  static double money = 0.00;

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
        BasketController.skuDataItems = ModuleList.fromJson(beforeSkuDataItems);
        change(skuDataItems, status: RxStatus.success());
        // skuDataItems.refresh();
        // skuDataItems.refresh();
        // Get.toNamed(Routes.BASKET);

      }
      print(qrCode);
    });
  }
  cleanData(){
    print('clean');
    beforeSkuDataItems = [];
    skuDataItems = ModuleList.fromJson(beforeSkuDataItems);
    change(null,status: RxStatus.success());
  }

  @override
  void onInit() {
    // print(skuDataItems);
    change(null,status: RxStatus.success());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}