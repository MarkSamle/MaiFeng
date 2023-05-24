import 'package:get/get.dart';
import '../../../../api/shop/shop_api.dart';
import '../../../../api/user/user_api.dart';
import '../../../../api/wares/wares_api.dart';
import '../../../../store/login_store.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../store/wares_store.dart';
import '../../../../util/my_toast.dart';
import '../../../routes/app_pages.dart';
import 'dart:convert' as convert;
import '../../fromqr/controllers/qruser_controller.dart';
import '../../fromqr/controllers/qrwares_controller.dart' as qrwares;
import '../../fromqr/controllers/qrwares_controller.dart';
import '../../pay/controllers/pay_controller.dart';
import '../../shop/controllers/shop_controller.dart';
import '../../wares/controllers/skuDetails_controller.dart';
import '../../wares/controllers/waresDetails_controller.dart';
import '../../wares/controllers/wares_controller.dart';

class WorkbenchController extends GetxController {

  // 初始化登录数据缓存
  LoginStore _loginStorestore = LoginStore();
  bool isAdmin = false;
  //  判断是否超级管理员
  void isSuper() async {
    bool isSuper = await _loginStorestore.getSuper();
    if (isSuper) {
      isAdmin = true;
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
  // 跳转回首页
  void turnLogin() async {
    _loginStorestore.setToken('');
    Get.offNamed(Routes.LOGIN);
    return ;
  }

  // 按钮表单数据
  static List dataFrom = [
    [
      {'imgPath':'assets/images/icons/shangpin.png', 'boxName':'商品管理', 'job':'wares'},
      {'imgPath':'assets/images/icons/mendian.png', 'boxName':'门店管理', 'job':'shop'},
      {'imgPath':'assets/images/icons/cangchu.png', 'boxName':'仓储管理', 'job':'触发功能仓储管理'},
      {'imgPath':'assets/images/icons/xiaoshou.png', 'boxName':'销售管理', 'job':'触发功能销售管理'},
    ],
    [
      {'imgPath':'assets/images/icons/gongyingshang.png', 'boxName':'供应商', 'job':'触发功能供应商管理'},
      {'imgPath':'assets/images/icons/churuku.png', 'boxName':'出入库', 'job':'触发功能出入库管理'},
      {'imgPath':'assets/images/icons/julei.png', 'boxName':'聚类维护', 'job':'触发功能商品层级管理'},
      {'imgPath':'assets/images/icons/wenjian.png', 'boxName':'文件管理', 'job':'触发功能文件管理'},
    ],
    [
      {'imgPath':'assets/images/icons/yonghu.png', 'boxName':'用户管理', 'job':'触发功能用户管理'},
      {'imgPath':'assets/images/icons/gonggao.png', 'boxName':'公告通知', 'job':'触发功能公告通知管理'},
      {'imgPath':'assets/images/icons/pay.png', 'boxName':'收银台', 'job':'pay'},
      {'imgPath':'', 'boxName':'', 'job':''},
    ]
  ];
// 从本地磁盘获取参数缓存
  // Future<void> _getInfo() async {
  //   if (search.text != '') {_waresStore.setSearch(search.text);} else {search.text = await _waresStore.getSearch() ?? '';}
  // }

  // 拉取顾客群下拉选数据
  static Future<void> getMerchSetOption() async {
    var MerchSetresult  = await WraesApi.getMerchSet();
    if (MerchSetresult['code'] == 200) {
      WaresController.MerchSetOption = MerchSetresult['data'];
      // change(MerchSetOption, status: RxStatus.success());
    } else {
      MyToast.danger('顾客群数据获取失败');
      // change(null, status: RxStatus.error('网络错误'));
    }
  }
  // 拉取品类组下拉选数据
  static Future<void> getTypeSetOption() async {
    var TypeSetresult  = await WraesApi.getTypeSet();
    if (TypeSetresult['code'] == 200) {
      WaresController.TypeSetOption = TypeSetresult['data'];
      // change(TypeSetOption, status: RxStatus.success());
    } else {
      MyToast.danger('品类组数据获取失败');
      // change(null, status: RxStatus.error('网络错误'));
    }
  }
  // 拉取品类下拉选数据
  static Future<void> getMerchTypeOption() async {
    var MerchTyperesult  = await WraesApi.getMerchType();
    if (MerchTyperesult['code'] == 200) {
      WaresController.MerchTypeOption = MerchTyperesult['data'];
      // change(MerchTypeOption, status: RxStatus.success());
    } else {
      MyToast.danger('品类数据获取失败');
      // change(null, status: RxStatus.error('网络错误'));
    }
  }
  // 拉取子品类下拉选数据
  static Future<void> getMerchTypeChildOption() async {
    var MerchTypeChildresult  = await WraesApi.getMerchTypeChild();
    if (MerchTypeChildresult['code'] == 200) {
      WaresController.MerchTypeChildOption = MerchTypeChildresult['data'];
      // change(MerchTypeChildOption, status: RxStatus.success());
    } else {
      MyToast.danger('子品类数据获取失败');
      // change(null, status: RxStatus.error('网络错误'));
    }
  }

  // 大区数据
  static Future<void> getLargeRegionOption() async {
    var LargeRegionresult  = await ShopApi.getLargeRegion();
    if (LargeRegionresult['code'] == 200) {
      ShopController.LargeRegionOption = LargeRegionresult['data'];
      // change(MerchTypeChildOption, status: RxStatus.success());
    } else {
      MyToast.danger('大区数据获取失败');
      // change(null, status: RxStatus.error('网络错误'));
    }
  }
  // 区域数据
  static Future<void> getRegionOption() async {
    var Regionresult  = await ShopApi.getRegion();
    if (Regionresult['code'] == 200) {
      ShopController.RegionOption = Regionresult['data'];
      // change(MerchTypeChildOption, status: RxStatus.success());
    } else {
      MyToast.danger('区域数据获取失败');
      // change(null, status: RxStatus.error('网络错误'));
    }
  }

  // 拉取子品类下拉选数据
  static Future<void> getShopOption() async {
    var ShopChoicesStore =  await WaresStore.getShopChoices();
    var ShopOption  = await ShopApi.getShopOption();
    if (ShopOption['code'] == 200) {
      PayController.shopOption = ShopOption['data'];
      PayController.shopChoicesItems = [];
      PayController.shopOptionMap = {};
      for (var element in PayController.shopOption) {
        PayController.shopChoicesItems.add(element["label"]);
        PayController.shopOptionMap.addAll({element["label"]: element["value"].toString()});
      }

      if (PayController.shopChoicesItems.isNotEmpty && ShopChoicesStore == ''){
        PayController.shopChoices = PayController.shopChoicesItems[0];
      } else if (ShopChoicesStore != '' && PayController.shopChoicesItems.contains(ShopChoicesStore)){
        PayController.shopChoices = ShopChoicesStore;
      } else if (!PayController.shopChoicesItems.contains(ShopChoicesStore)) {
        PayController.shopChoices = PayController.shopChoicesItems[0];
        WaresStore.setShopChoices(PayController.shopChoicesItems[0]);
      }
      // change(MerchTypeChildOption, status: RxStatus.success());
    } else {
      MyToast.danger('门店数据获取失败');
      // change(null, status: RxStatus.error('网络错误'));
    }
  }



  // 根据job判断跳转页面
  static void jobPage(String job) async {
    if (job == "wares") {
      await WorkbenchController.getMerchSetOption();
      await WorkbenchController.getTypeSetOption();
      await WorkbenchController.getMerchTypeOption();
      await WorkbenchController.getMerchTypeChildOption();
      Get.toNamed(Routes.WARES);
    } else if (job == "shop") {
      await WorkbenchController.getLargeRegionOption();
      await WorkbenchController.getRegionOption();
      Get.toNamed(Routes.SHOP);
    } else if (job == "pay") {
      // await WorkbenchController.getLargeRegionOption();
      await WorkbenchController.getShopOption();

      Get.toNamed(Routes.PAY);
    } else {
      MyToast.danger(job);
    }
    return ;
  }


  final count = 0.obs;
  @override
  void onInit() {
    isSuper();
    _loginStorestore.setPage('workbench');
    print('-------------workbench');
    super.onInit();
  }

  @override
  void onReady() {
    isSuper();
    _loginStorestore.setPage('workbench');
    print('-------------workbench');
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
