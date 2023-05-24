import 'dart:convert';

import 'package:maifeng_app/config/config.dart' show BASE_URL;
import 'package:http/http.dart' as http;

import '../../util/my_toast.dart';

const FC_URL = BASE_URL + '/api/fc/';
const FORGET_URL = BASE_URL + '/api/forget/';

class ForgetApi {
  // 获取验证码接口
  static rcode(Map forgetForm) async {
    Map Tel = {
      'telephone': forgetForm['telephone']
    };
    try {
      Uri url = Uri.parse(FC_URL);
      final response = await http.post(
        url,
        body: jsonEncode(Tel),
        headers: {'Content-Type': 'application/json'},
      );
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      if (result['code'] == 201) {
        return result;
      } else {
        throw Exception('请求异常......');
      }
    } catch (e) {
      print(e);
      throw Exception('请求异常......');
    }
  }

  // 改密码接口
  static forget(Map forgetForm) async {
    try {
      Uri url = Uri.parse(FORGET_URL);
      final response = await http.post(
        url,
        body: jsonEncode(forgetForm),
        headers: {'Content-Type': 'application/json'},
      );
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));

      print('------------------------------------------------');
      print(response.statusCode);
      if (response.statusCode == 200) {
        // MyToast.danger(result['msg']);
        return result;
      } else {
        throw Exception('请求异常......');
      }
    } catch (e) {
      print(e);
      throw Exception('请求异常......');
    }
  }
}