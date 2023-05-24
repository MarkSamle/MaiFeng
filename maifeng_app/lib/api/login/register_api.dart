import 'dart:convert';

import 'package:maifeng_app/config/config.dart' show BASE_URL;
import 'package:http/http.dart' as http;

import '../../util/my_toast.dart';

const RC_URL = BASE_URL + '/api/rc/';
const REGISTER_URL = BASE_URL + '/api/register/';

class RegisterApi {
  // 获取验证码接口
  static rcode(Map registerForm) async {
    Map Tel = {
    'telephone': registerForm['telephone']
    };
    try {
      Uri url = Uri.parse(RC_URL);
      final response = await http.post(
        url,
        body: jsonEncode(Tel),
        headers: {'Content-Type': 'application/json'},
      );
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));

      if (result['code'] == 201) {
        // Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        // var result = json.decode(utf8decoder.convert(response.bodyBytes));
        // print(result['data']['code'].toString());
        return result;
      } else {
        throw Exception('请求异常......');
      }
    } catch (e) {
      print(e);
      throw Exception('请求异常......');
    }
  }

  // 注册接口
  static register(Map registerForm) async {
    try {
      Uri url = Uri.parse(REGISTER_URL);
      final response = await http.post(
        url,
        body: jsonEncode(registerForm),
        headers: {'Content-Type': 'application/json'},
      );
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));

      print('------------------------------------------------');
      if (response.statusCode == 201) {
        return result;
      } else if (response.statusCode == 200) {
        MyToast.danger(result['msg']);
      } else {
        throw Exception('请求异常......');
      }
    } catch (e) {
      print(e);
      throw Exception('请求异常......');
    }
  }
}