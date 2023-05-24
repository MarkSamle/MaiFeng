import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maifeng_app/app/modules/home/controllers/home_controller.dart';
import 'package:maifeng_app/util/my_toast.dart';
import '../../../../api/login/login_api.dart';
import 'package:maifeng_app/app/routes/app_pages.dart';
import 'package:maifeng_app/store/login_store.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../../store/user_data.dart';
import '../../user/controllers/user_controller.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  // 初始化一个本地存储类LoginStore
  LoginStore store = LoginStore();

  String state = '';
  var subscription;

  //获取Key用来获取Form表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController code = TextEditingController();
  Map loginForm = {
    'username': '',
    'password': ''
  };

  bool isShowPassWord = false;
  bool isShowCode = false;
  // Uint8List bytes = Base64Decoder().convert(
  //     '/9j/4AAQSkZJRgABAgAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCAA8AKADASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDtrW1ga1hZoIySikkoOeKsCztv+feL/vgU2z/484P+ua/yqyKiMY8q0IjGPKtCIWdr/wA+0P8A3wKeLK1/59of+/YqUVR1bWLTRNPkvbx9sUY5x1J9BVwpc8lGMbtj5YroWxZWn/PrD/37FOFjaf8APrB/37Fcdo3xQ0PVLwWsnm2jscI02Njfj2P1ruEYMMg8VtiMFVw0uStDlfmhJQlsRiws/wDn1g/79inCws/+fSD/AL9iphTwRXPyx7D5Y9iEafZf8+lv/wB+x/hThp1l/wA+dv8A9+l/wp8s8VvEZJpEjQdWdgAPxrkta+J/hvRiUW6N7MP+Wdphx+LZ2/rmt6GDqYiXLRhzPyQmoLc60adY/wDPnb/9+l/wpw02x/58rf8A79L/AIVleFfEsPijR11CGFoQXKGNm3EYrfFZ1KDpTdOcbNaMajF62K40yw/58rb/AL9L/hTxplh/z423/fpf8KsCs3WfEWmeH7YT6ldLAjHAzyT9BRCjzyUYRu35A4xXQuDS9P8A+fG2/wC/K/4U8aVp/wDz4Wv/AH5X/CsrSfGXh/WeLLVbZ3/55s4V/wAjyfwrfRlYAg5FFSg6cuWcbPzVgUYvZFcaVp3/AD4Wv/flf8KcNJ07/oH2v/flf8KtCnio5Y9g5Y9iqNJ03/oH2n/flf8ACq2p6Xp8ekXrpY2qusDlWEKgg7TyOK1hVXVv+QLf/wDXvJ/6CaUox5XoKUY8r0OSs/8Ajzg/65r/ACqyKr2f/HnB/wBc1/lVkU4/Chx+FC9q4T4iWz6joklshw6sHUHoSO1d5jIrG1nTRdQtxmt6FadCrGrDeLuhtXVmeIaHHYXsT6XfW4S4BOyQDDj/APV6V12i+LNS8GTxWOrl7vSmO2G5Ay0Y9Pw9OvpVbWfCgmfehMNyhykq+vvWDfazeQ2E2m6tZ73K4WQdD6H/APVX1tKusyn7q5oyfvQb1i/5oN9PL71Ywa5P8/8AM9c8R3VprnhaZYNQ8qKdN0dxHJtAPbJHbsRXHfDbxg2nXb+HdUmyGkP2aVn3DceqZ9CeR7n3Fef2t1Jb2gsb0F7C4+cLn/Vt03r6H19RU8nh4kEwTHPUBxjP40fUsHhKc8LiqnuTd4ytezWl7rqtmrfMOaUnzRWx7p4vSPUfD91ZOflmTGfQ9QfzxXg+lxaba3k8erxsWiPCliAcfTk1pQeM/E8iDTTN9ocfIBLGC/Hv3P1zUx0KfUxHcX8RguAMPsIw47E+lLD055TTnh8VUtCeqcJe8vNLeztZg2qjvFao9H8Aa7oMi/YtNeKCRjuMGNpY9yAevHpXWXXjPQtMvXstRvVs7hBu2zqVDKejKehB9j2IOCK8lTQ9I1G122zLBdw4K3Fu2GRuxOKztU1aW/iTQ/FA3XEHNtfr97Hv6g45+nPPNedDA4XFVXKDlp8Sdudf3l/Mu60fqW5Sij0jW/jD4f05Clh5uozekYKIPqxH8ga4TX9fj+ImlxkhbTULRmbySxZWQ9wfy/ziuak/sbRpiht5Ly4XqJeFH4Yx/OrUXiiaMrJJo0PkL0KKVwPY4xXp08DGlCNXL6UubdTk0r+kXumvJepDlfSbGaR4ZS5ZkupZraZDwyYII9a3l1bxL4Dlgu7fVWvtPL7WhlYkfQg9PqPSuo8I/wBleJbR5rPcssRAlicfMhPT6g4ODWH8SdMltdMQxgmNZAXx27D9awo5ni8Rj1hcalyydnFpaenVeWo3CKjzRPa/D+twa9o9rqNvkRzxhwD1U9x+B4rYFea/Cm7jk8K2kULEhAVYHs2ea9KXpXzeLpKlXnTjsm19zNou6THiqurf8gS//wCvaT/0E1bFVdX/AOQJf/8AXtJ/6Ca5ZfCxS+FnJWf/AB5Qf9c1/lVkVXsv+PKD/rmv8qsiiPwoI/ChwpSgYYNAp4qijG1DS0lQkLzXk3jZrrSrmMLEjQP/ABEZwa9xkXchFcZ4i0X7blWjDr6EV1YOtTo1lOrDnj1RMk2rI8aAuNeuIoYISqqfmYngV6haeGlOmoAMlUAzUuk+GWSRf3YVQeABgV3lnp6x24QjtXRjsesRGNKlDkpxvZXvvu22KMLavc8F1nw3qC6wstlH8+Qc7gMMO9en6bpAexV5kG4r8w6jNbtxoEck+/aOtatvYLHBsx2rCvjKtenTpz2grLvbz9Og1FJtrqeIa/oFxoOptqmiZC9ZYO2O/Hce1c1rutR62sG22aOZTzznr2Fe7axoRlyyDmuQHhEtfeaYF3ZyW28162DzyNOUamIp884fDK9n6PuRKlfRPQyNE8PG4s7aWWBWuVjC7yuSPSulg0K5i52nHpXZ6Hoq28Khl5rfFlFjG0V4darKrNzl1/D0NErHD+HvDtnZan9vhtFguSpR2iyocHsVHB5AOcZq74k0wXMJ3KCCOQRmuujs0Q5C1He2YniK4qZVJzd5O7HY8g+G9x4lt/E8seoxztYOjKGdQqqwPBA9+fzr3CFtyA1zFnozQ3G7HeungTagFbYrE/WKntOVR8krIUVZWJhVXV/+QJf/APXtJ/6Catiqur/8gS//AOvaT/0E1yS+Fil8LOSsv+PK3/65r/KrIrmYtauYokjVIiEUKMg9vxqT+37r/nnD/wB8n/Gso1o2RnGrGyOlFOFcz/wkN3/zzg/75P8AjS/8JFd/884P++T/AI1Xtoj9tE6gCmtAj9QK5r/hJLz/AJ5Qf98n/Gl/4SW8/wCeUH/fJ/xo9tEPbROmjt0TooqwoxXJf8JPe/8APK3/AO+W/wAaX/hKL3/nlb/98t/jR7aIe2ideFFPArjv+Eqvv+eVv/3y3+NL/wAJXff88rb/AL5b/Gj20Q9tE7BolccimCzj3Z2iuT/4S2//AOeNt/3y3+NL/wAJfqH/ADxtv++W/wDiqPbRD20TtEjCjgVKK4f/AITDUP8Anja/98t/8VS/8JlqP/PG1/75b/4qj20Q9tE7oU7Ga4T/AITPUf8Anja/98N/8VS/8JrqX/PC0/74b/4qj20Q9tE7xUHpUgFcB/wm2pf88LT/AL4b/wCKpf8AhONT/wCeFp/3w3/xVHtoh7aJ6CKq6v8A8gPUP+vaT/0E1xX/AAnOp/8APC0/74b/AOKqO58Z6jdWs1u8NqElRkYqrZAIxx81TKtGzFKrGzP/2Q==');
  late Uint8List bytes;

  @override
  void onInit() {
    super.onInit();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      //监听判断网络信息
      // if (result == ConnectivityResult.mobile) {
      //   state = "mobile";
      // } else if (result == ConnectivityResult.wifi) {
      //   state = "wifi";
      // } else {
      //   state = "noNetwork";
      // }
    });
    // getCurrentNetworkState();
    _getLoginInfo();
  }

  // 获取当前网络状态
  // getCurrentNetworkState() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     MyToast.hint('无网络，服务器异常');
  //     state = "mobile";
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     // getCode();
  //     state = "wifi";
  //   } else if (connectivityResult == ConnectivityResult.none) {
  //     MyToast.hint('无网络，服务器异常');
  //     state = "noNetwork";
  //   }
  // }

  // 从本地磁盘获取用户名密码
  _getLoginInfo() async {
    username.text = await store.getUsername() ?? '';
    password.text = await store.getPassword() ?? '';
  }

  // 获取验证码
  // void getCode() async {
  //   //判断是否有网络信息，并弹出弹出框
  //   if (state == 'mobile') {
  //     MyToast.hint('无网络，服务器异常');
  //   } else if (state == 'noNetwork') {
  //     MyToast.hint('无网络，服务器异常');
  //   } else {
  //     // print('**********$state*************');
  //     try {
  //       var result = await LoginApi.getCode();
  //       bytes = Base64Decoder().convert(result['img']);
  //       loginForm['uuid'] = result['uuid'];
  //       isShowCode = true;
  //       update(['codeImage']);
  //     } catch (e) {
  //       MyToast.hint('请重新获取验证码！');
  //     }
  //   }
  // }

  // 执行登录函数
  void handleLogin() {
    var form = loginKey.currentState;
    if (form!.validate()) {
      form.save();
      loginForm['username'] = username.text;
      loginForm['password'] = password.text;
      // loginForm['code'] = code.text;
      loginRequest();
    }
  }

  // 跳转到注册页面
  void turnRegister() async {
    Get.toNamed(Routes.Register);
    return ;
  }
  // 跳转到忘记密码页面
  void turnForget() async {
    Get.toNamed(Routes.Forget);
    return ;
  }

  // 发起登录请求
  void loginRequest() async {
    var result = await LoginApi.login(loginForm);
    // print('------登录返回的结果-------$result-----------');
    if (result['code'] == 200) {
      store.setToken(result['data']['token']);
      store.setUsername(loginForm['username']);
      store.setPassword(loginForm['password']);
      store.setUserId(result['data']['user']);
      store.setSuper(result['data']['is_superuser']);
      store.setPerms(result['data']['perms'].cast<String>());
      // print('---------------');
      // // 在Dart中，有await标记的运算，其结果值都是一个Future对象,有async标记的函数，只能由await来调用
      // print(perms.runtimeType.toString());
      // print(perms);
      // print('---------------');
      Get.offNamed(Routes.HOME);
      return;
      // return MyMessageHint.success('登录成功！', '欢迎使用脉蜂系统！');
    } else if (result['code'] == 500) {
      MyToast.danger(result['msg']);
    } else {
      MyToast.danger('登录失败，请重新尝试！');
    }
  }

  // 点击显示密码的的事件
  void showPassWord() {
    isShowPassWord = !isShowPassWord;
    update(['isShowPassWord']);
  }
  toPage() async {
    String page = await loginStore.getPage();
    if (page == 'user') {
      print('回到user');
      HomeController.currentIndex = 2;
      return;
    } else if (page == 'board') {
      print('回到board');
      HomeController.currentIndex = 1;
      return;
    } else if (page == 'workbench') {
      print('回到workbench');
      HomeController.currentIndex = 0;
      return;
    } else {
      HomeController.currentIndex = 0;
      return;
    }
  }

  UserDataStore _userDataStore = UserDataStore();
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

  // 验证Token
  void testToken() async {
    var result = await LoginApi.getmyself();
    print('----------------login_controller');
    print(result);
    if (result['code'] == 200) {
      print('token有效');
      toPage();
      getUserData();
      Get.offNamed(Routes.HOME);
      return;
    }

  }

  @override
  void onReady() {
    testToken();
    super.onReady();
  }

  @override
  void onClose() {
    subscription.cancel();
    super.onClose();
  }
}
