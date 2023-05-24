
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maifeng_app/app/modules/wares/controllers/skuDetails_controller.dart';
import 'package:maifeng_app/app/modules/wares/controllers/waresDetails_controller.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../api/user/user_api.dart';
import '../../../../api/wares/wares_api.dart';
import '../../../../store/login_store.dart';
import '../../../../store/wares_store.dart';
import '../../../../util/my_toast.dart';
import '../../../routes/app_pages.dart';
import '../../fromqr/controllers/qruser_controller.dart';
import '../../home/controllers/home_controller.dart';

class SkuController extends GetxController with StateMixin<List> {
  LoginStore _loginStore = LoginStore();
  WaresStore _waresStore = WaresStore();

  //获取Key用来获取Form表单组件
  GlobalKey<FormState> skuKey = GlobalKey<FormState>();
  TextEditingController search = TextEditingController();
  TextEditingController page = TextEditingController();

  List dataForm = [].obs;
  int pagenum = 1;
  Map SearchForm = {
    'search': '',
    'wareid': '1',
    'page':1
  }.obs;


  static String wareid = '1';
  // 第一次获取数据
  Future<void> getSkuData() async {
    page.text = '1';
    pagenum = 1;
    print('刷新商品数据');
    SearchForm['ware'] = wareid;
    SearchForm['search'] = search.text;
    SearchForm['page'] = page.text;

    var result = await WraesApi.getAllSku(SearchForm);
    if (result['results']['code'] == 200) {
      dataForm = result['results']['data'];
      change(dataForm, status: RxStatus.success());
    } else if (result['results']['code'] == 500) {
      change(null, status: RxStatus.error('超时'));
    } else {
      change(null, status: RxStatus.error('网络错误'));
    }

  }
  // 执行查询语句
  Future<void> getSkuDataAddPage() async {
    // change(dataForm, status: RxStatus.loading());
    pagenum = pagenum + 1;
    page.text = pagenum.toString();
    print('加载数据');
    SearchForm['ware'] = wareid;
    SearchForm['search'] = search.text;
    SearchForm['page'] = page.text;

    var result = await WraesApi.getAllSku(SearchForm);
    // print('--------$result-----------');
    if (result['results']['code'] == 200) {
      dataForm..addAll(result['results']['data']);
      change(dataForm, status: RxStatus.success());
    } else if (result['results']['code'] == 500) {
      MyToast.danger(result['msg']);
    } else {
      if (pagenum > 1) {
        pagenum = pagenum - 1;
        page.text = pagenum.toString();
      }
      MyToast.danger('已经到底部！');
    }
  }

  // 扫一扫
  String qrCode = '';
  void handleScan() async {
    await [Permission.camera].request();
    await Get.toNamed(Routes.QR_SCAN)?.then((value) async {
      if (value == null) return;
      qrCode = value;
      // MyToast.success2(qrCode);
      Map<String, dynamic> jsondata = convert.jsonDecode(qrCode);
      if (jsondata['api'] == 'wares') {
        WaresDetailsController.waresData = await WraesApi.getWares(jsondata['code']);
        Get.toNamed(Routes.WARESDETAILS);
      } else if (jsondata['api'] == 'waresku') {
        SkuDetailsController.skuData = await WraesApi.getSku(jsondata['wares'],jsondata['code']);
        Get.toNamed(Routes.SKUDETAILS);
      } else if (jsondata['api'] == 'user') {
        QRUserController.userData = await UserApi.getUser(jsondata['username']);
        Get.toNamed(Routes.QRUSER);
      }
      print(qrCode);
    });
  }
  void cleanData() {
    search.text = '';
    page.text = '1';
  }


  void goDetails(int id) async {
    SkuDetailsController.skuData = await WraesApi.getSkuID(id);
    Get.toNamed(Routes.SKUDETAILS)?.then((value) async {
      if (value == null) return;
      if (value == true) {
        MyToast.success2('删除成功');
        Get.back(result: true);
      }
    });
  }




  @override
  void onInit() {
    getSkuData();
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