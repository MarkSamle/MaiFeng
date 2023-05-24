import 'dart:convert';

import 'package:maifeng_app/app/modules/home/model/user_info_model.dart';
import 'package:maifeng_app/config/config.dart' show BASE_URL;
import 'package:maifeng_app/util/my_http.dart';
import 'package:http/http.dart' as http;

const USER_INFO_URL = BASE_URL + '/api/myself/';

class HomeApi {
  Future<UserInfoModel> getUserInfo() async {
    try {
      Uri url = Uri.parse(USER_INFO_URL);
      final response = await http.get(
        url,
        headers: await MyHttp.addAuthorization(),
      );
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        return UserInfoModel.fromJson(result['user']);
      } else {
        throw Exception('请求异常......');
      }
    } catch (e) {
      print(e);
      throw Exception('请求异常......');
    }
  }
}
