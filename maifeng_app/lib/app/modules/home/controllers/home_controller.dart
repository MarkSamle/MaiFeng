import 'package:disable_screenshots/disable_screenshots.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maifeng_app/api/home/home_api.dart';
import 'package:maifeng_app/api/login/login_api.dart';
import 'package:maifeng_app/app/modules/home/model/user_info_model.dart';
import 'package:maifeng_app/widgets/watermark.dart';

import '../../../../store/login_store.dart';
import '../../../../store/user_data.dart';
import '../../../../util/my_toast.dart';
import '../../user/controllers/user_controller.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  bool isLoading = true;
  final DisableScreenshots plugin = DisableScreenshots();

  // 页面控制器
  late final PageController pageController;

  // 当前底部导航下标
  static int currentIndex = 0;

  UserDataStore _userDataStore = UserDataStore();

  // 缓存用户信息
  void setUserData() async {
    var result = await LoginApi.getmyself();
    // print('------登录返回的结果-------$result-----------');
    if (result['code'] == 200) {
      if (result['data'][0]['id'] != null) {_userDataStore.setUserExtensionID(result['data'][0]['id']);UserController.euserid = result['data'][0]['id'];} else {_userDataStore.setUserExtensionID(0);}
      if (result['data'][0]['user'] != null) {_userDataStore.setUserID(result['data'][0]['user']);UserController.userid = result['data'][0]['user'];} else {_userDataStore.setUserID(0);}
      if (result['data'][0]['username'] != null) {_userDataStore.setUsername(result['data'][0]['username']);UserController.username = result['data'][0]['username'];} else {_userDataStore.setUsername('');}
      if (result['data'][0]['realname'] != null) {_userDataStore.setRealname(result['data'][0]['realname']);UserController.realname = result['data'][0]['realname'];} else {_userDataStore.setRealname('');}
      if (result['data'][0]['telephone'] != null) {_userDataStore.setTelephone(result['data'][0]['telephone']);UserController.telephone = result['data'][0]['telephone'];} else {_userDataStore.setTelephone('');}
      if (result['data'][0]['portrait'] != null) {_userDataStore.setPortrait(result['data'][0]['portrait']);UserController.portrait = result['data'][0]['portrait'];} else {_userDataStore.setPortrait('');}
      if (result['data'][0]['birthday'] != null) {_userDataStore.setBirthday(result['data'][0]['birthday']);UserController.birthday = result['data'][0]['birthday'];} else {_userDataStore.setBirthday('');}
      if (result['data'][0]['desc'] != null) {_userDataStore.setDesc(result['data'][0]['desc']);UserController.desc = result['data'][0]['desc'];} else {_userDataStore.setDesc('');}
      if (result['data'][0]['sex'] != null) {_userDataStore.setSex(result['data'][0]['sex']);UserController.sex = result['data'][0]['sex'];} else {_userDataStore.setSex('0');}
      // // 在Dart中，有await标记的运算，其结果值都是一个Future对象,有async标记的函数，只能由await来调用
      // List<String> perms = await store.getPerms();
      return;
      // return MyMessageHint.success('登录成功！', '欢迎使用脉蜂系统！');
    } else if (result['code'] == 500) {
      MyToast.danger(result['msg']);
    } else {
      MyToast.danger('获取用户信息失败，请重新尝试！');
    }
  }

  void getUserData() async {
    UserController.userid = await _userDataStore.getUserID();
    UserController.euserid = await _userDataStore.getUserExtensionID();
    UserController.username = await _userDataStore.getUsername();
    UserController.realname = await _userDataStore.getRealname();
    UserController.desc = await _userDataStore.getDesc();
    UserController.sex = await _userDataStore.getSex();
    UserController.telephone = await _userDataStore.getTelephone();
    UserController.birthday = await _userDataStore.getBirthday();
    UserController.portrait = await _userDataStore.getPortrait();
  }
  // 获取用户信息
  void getUserInfo() async {
    isLoading = true;
    setUserData();
    getUserData();
    // userInfoModel = await HomeApi().getUserInfo();
    // UserInfoStore().setUserInfo(userInfoModel);
    isLoading = false;
    update();
  }

  // 点击底部导航栏的事件
  handleNavBarTap(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
    update();
  }

  addWatermark(BuildContext context, bool isPad) async {
    String nowStr = DateTime.now().toString().substring(0, 10);

    Future.delayed(Duration(milliseconds: 200), () {
      plugin.addCustomWatermark(
        context,
        Watermark(
          rowCount: isPad ? 3 : 2,
          columnCount: isPad ? 10 : 6,
          text: UserController.realname + ' ' + nowStr,
          // text: userInfoModel.nickName + nowStr,
        ),
      );
    });
  }

  LoginStore _loginStorestore = LoginStore();
  static bool isSuperUser = false;
  static List<String> permsItem = [];
  // 获取管理员权限和其他权限信息
  void getPerms() async {
    isSuperUser = await _loginStorestore.getSuper();
    permsItem = await _loginStorestore.getPerms();
  }

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
    getPerms();
    // toPage();
    pageController = PageController(initialPage: currentIndex);
  }
  @override
  void onReady() {
    getPerms();
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
