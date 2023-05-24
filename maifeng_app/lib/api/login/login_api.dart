import 'dart:convert';

import 'package:maifeng_app/config/config.dart' show BASE_URL;
import 'package:http/http.dart' as http;
import 'package:maifeng_app/store/user_data.dart';

import '../../store/login_store.dart';
import '../../util/my_http.dart';
import '../../util/my_toast.dart';

// const CODE_URL = BASE_URL + '/code';
const LOGIN_URL = BASE_URL + '/login/';
const MYSELF_URL = BASE_URL + '/api/myself/';

LoginStore loginStore = LoginStore();


class LoginApi {
  // 登录
  static login(Map loginForm) async {
    try {
      Uri url = Uri.parse(LOGIN_URL);
      final response = await http.post(
        url,
        body: jsonEncode(loginForm),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        return result;
      } else {
        throw Exception('请求异常......');
        MyToast.danger('网络异常！');
      }
    } catch (e) {
      print(e);
      MyToast.danger('网络异常！');
      throw Exception('请求异常......');
    }
  }
  // 获取用户信息，测试token是否有效
  static getmyself() async {
    try {
      Uri url = Uri.parse(MYSELF_URL);
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer ' + await loginStore.getToken(),
          'Content-Type': 'application/json'},
      );
      print('testtoken---------------------->>');
      // print(await loginStore.getToken());
      print(response.statusCode);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        // _userDataStore.setUserExtensionID(result['data'][0]['id']);
        // _userDataStore.setUserID(result['data'][0]['user']);
        // _userDataStore.setUsername(result['data'][0]['username']);
        // _userDataStore.setRealname(result['data'][0]['realname']);
        // _userDataStore.setTelephone(result['data'][0]['telephone']);
        // _userDataStore.setPortrait(result['data'][0]['portrait']);
        // _userDataStore.setBirthday(result['data'][0]['birthday']);
        // _userDataStore.setDesc(result['data'][0]['desc']);
        // _userDataStore.setSex(result['data'][0]['sex']);
        return result;
      } else {
        throw Exception('请求异常......');
        MyToast.danger('网络异常！');
      }
    } catch (e) {
      print(e);
      // MyToast.danger('网络异常！');
      throw Exception('请求异常......');
    }
  }
}
