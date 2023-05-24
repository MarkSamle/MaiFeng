import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maifeng_app/util/my_toast.dart';
import '../../../../api/login/forget_api.dart';
import '../../../../api/login/login_api.dart';
import 'package:maifeng_app/app/routes/app_pages.dart';
import 'package:maifeng_app/store/login_store.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../../api/login/register_api.dart';

// Register控制层
class ForgetController extends GetxController {
  // 初始化缓存
  LoginStore _loginStorestore = LoginStore();

  GlobalKey<FormState> forgetKey = GlobalKey<FormState>();
  TextEditingController telephone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController code = TextEditingController();

  var subscription;

  Map forgetForm = {
    'password': '',
    'telephone': '',
    'code': '',
  };

  bool isShowPassWord = false;
  bool isShowCode = false;
  late Uint8List bytes;

  // 点击显示密码的的事件
  void showPassWord() {
    isShowPassWord = !isShowPassWord;
    update(['isShowPassWord']);
  }


  // 跳转回首页
  void turnLogin() async {
    Get.offNamed(Routes.LOGIN);
    return ;
  }

  Timer countDownTimer = new Timer.periodic(new Duration(seconds: 1), (timer){});

  String gettext = '获取验证码';
  // 获取验证码
  void rcodeRequest() async {
    forgetForm['telephone'] = telephone.text;
    var result = await ForgetApi.rcode(forgetForm);
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
  }

  // 发送修改密码请求
  void forgetRequest() async {
    MyToast.danger('修改密码中，请稍等');
    var form = forgetKey.currentState;
    if (form!.validate()) {
      form.save();
      forgetForm['telephone'] = telephone.text;
      forgetForm['code'] = code.text;
      forgetForm['password'] = password.text;

      var result = await ForgetApi.forget(forgetForm);
      print(result['code']);
      if (result['code'] == 200) {
        MyToast.danger(result['msg']);
        _loginStorestore.setUsername('');
        _loginStorestore.setPassword('');
        Get.offNamed(Routes.LOGIN);
        return;
      } else if (result['code'] == 401) {
        MyToast.danger(result['msg']);
      } else {
        MyToast.danger('修改密码失败，请重新尝试！');
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
      countDownTimer.cancel();
    });
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