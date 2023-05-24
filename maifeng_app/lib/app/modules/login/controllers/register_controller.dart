import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maifeng_app/util/my_toast.dart';
import '../../../../api/login/login_api.dart';
import 'package:maifeng_app/app/routes/app_pages.dart';
import 'package:maifeng_app/store/login_store.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../../api/login/register_api.dart';

// Register控制层
class RegisterController extends GetxController {
  // 初始化缓存
  LoginStore _loginStorestore = LoginStore();
  // get registerKey => null;
  //获取Key用来获取Form表单组件
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController realname = TextEditingController();
  TextEditingController desc = TextEditingController();
  TextEditingController code = TextEditingController();
  // TextEditingController  = TextEditingController();

  Map registerForm = {
    'username': '',
    'password': '',
    'telephone': '',
    'realname': '',
    'desc': '',
    'code': '',
    'is_staff': true,
  };

  bool isShowPassWord = false;
  bool isShowCode = false;
  late Uint8List bytes;


  // 点击显示密码的的事件
  void showPassWord() {
    isShowPassWord = !isShowPassWord;
    update(['isShowPassWord']);
  }

  var subscription;

  // 跳转回首页
  void turnLogin() async {
    Get.offNamed(Routes.LOGIN);
    return ;
  }

  Timer countDownTimer = new Timer.periodic(new Duration(seconds: 1), (timer){});

  String gettext = '获取验证码';
  // 获取验证码
  void rcodeRequest() async {
    registerForm['telephone'] = telephone.text;
    var result = await RegisterApi.rcode(registerForm);
    if (result['code'] == 201) {
      print('成功获取到验证码');
      countDownTimer.cancel();//如果已存在先取消置空
      countDownTimer = new Timer.periodic(new Duration(seconds: 1), (timer){
        print(timer.tick);
        if(60-timer.tick>0){//60-t.tick代表剩余秒数，如果大于0，设置yzmText为剩余秒数，否则重置yzmText，关闭countTimer
          gettext = "${60-timer.tick}秒";
        }else{
          gettext = '获取验证码';
          countDownTimer.cancel();
        }
      });
    }
    // registerForm
  }

  // 发送注册请求
  void registerRequest() async {
    MyToast.danger('注册中，请稍等');
    var form = registerKey.currentState;
    if (form!.validate()) {
      form.save();
      registerForm['username'] = username.text;
      registerForm['realname'] = realname.text;
      registerForm['desc'] = desc.text;
      registerForm['telephone'] = telephone.text;
      registerForm['code'] = code.text;
      registerForm['password'] = password.text;

      var result = await RegisterApi.register(registerForm);
      print(result['code']);
      if (result['code'] == 201) {
        _loginStorestore.setUsername(registerForm['username']);
        _loginStorestore.setPassword(registerForm['password']);
        Get.offNamed(Routes.LOGIN);
        return;
      } else if (result['code'] == 401) {
        MyToast.danger(result['msg']);
      } else {
        MyToast.danger('注册失败，请重新尝试！');
      }
    }

  }

  @override
  void onInit() {
    super.onInit();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
    });
    countDownTimer.cancel();
  }
  @override
  void onReady() {
    countDownTimer.cancel();
    super.onReady();
  }
  @override
  void onClose() {
    subscription.cancel();
    countDownTimer.cancel();
    super.onClose();
  }
}