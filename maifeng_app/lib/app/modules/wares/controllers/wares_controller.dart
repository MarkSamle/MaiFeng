
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

class WaresController extends GetxController with StateMixin<List> {
  LoginStore _loginStore = LoginStore();
  WaresStore _waresStore = WaresStore();

  //获取Key用来获取Form表单组件
  GlobalKey<FormState> waresKey = GlobalKey<FormState>();
  TextEditingController search = TextEditingController();
  TextEditingController merchtypechild = TextEditingController();
  TextEditingController merchtype = TextEditingController();
  TextEditingController typeset = TextEditingController();
  TextEditingController merchset = TextEditingController();
  TextEditingController page = TextEditingController();

  List dataForm = [].obs;
  int pagenum = 1;
  Map SearchForm = {
    'search': '',
    'merchtypechild': '',
    'merchtype': '',
    'typeset': '',
    'merchset':'',
    'page':1
  }.obs;

  List Option = [{'value': '1','label': 'test1',}];
  static List MerchSetOption = [].obs;
  static List<int> MerchSetChoices = [];
  static List TypeSetOption = [].obs;
  static List<int> TypeSetChoices = [];
  static List MerchTypeOption = [].obs;
  static List<int> MerchTypeChoices = [];
  static List MerchTypeChildOption = [].obs;
  static List<int> MerchTypeChildChoices = [];

  // 第一次获取数据
  Future<void> getWaresData() async {
    page.text = '1';
    pagenum = 1;
    print('刷新商品数据');
    SearchForm['search'] = search.text;
    SearchForm['merchtypechild'] = merchtypechild.text;
    SearchForm['merchtype'] = merchtype.text;
    SearchForm['typeset'] = typeset.text;
    SearchForm['merchset'] = merchset.text;
    SearchForm['page'] = page.text;

    var result = await WraesApi.getAllWares(SearchForm);
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
  Future<void> getWaresDataAddPage() async {
    // change(dataForm, status: RxStatus.loading());
    pagenum = pagenum + 1;
    page.text = pagenum.toString();
    print('加载商品数据');
    SearchForm['search'] = search.text;
    SearchForm['merchtypechild'] = merchtypechild.text;
    SearchForm['merchtype'] = merchtype.text;
    SearchForm['typeset'] = typeset.text;
    SearchForm['merchset'] = merchset.text;
    SearchForm['page'] = page.text;

    var result = await WraesApi.getAllWares(SearchForm);
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
    merchtypechild.text = '';
    merchtype.text = '';
    typeset.text = '';
    merchset.text = '';
    page.text = '1';
  }
  // 回到上一页
  void turnHOME() async {
      Get.offNamed(Routes.HOME);
    return ;
  }

  bool Refresh = false;
  void goDetails(int id) async {
    WaresDetailsController.waresData = await WraesApi.getWaresID(id);
    Get.toNamed(Routes.WARESDETAILS)?.then((value) async {
      if (value == null) return;
      if (value == true) {
        MyToast.success2('删除成功');
        Get.back(result: true);
      }
    });
  }


  @override
  void onInit() {
    getWaresData();
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