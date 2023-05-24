// /api/user-extension/?id=&user__username=samle

import 'dart:convert';
import 'package:maifeng_app/config/config.dart' show BASE_URL;
import 'package:http/http.dart' as http;
import 'package:maifeng_app/store/user_data.dart';
import '../../store/login_store.dart';
import '../../util/my_http.dart';
import '../../util/my_toast.dart';

const USER_URL = BASE_URL + '/api/user-extension/';

LoginStore loginStore = LoginStore();

class UserApi {
  // 扫码查询用户信息
  static getUser(String username) async {
    try {
      String SEARCH_URL = USER_URL + '?user__username=' + username;
      Uri url = Uri.parse(SEARCH_URL);
      final response = await http.get(
        url,
        headers: await MyHttp.addAuthorizationJson(),
        // headers: {'Authorization': 'Bearer ' + await loginStore.getToken(),
        //   'Content-Type': 'application/json'},
      );
      print('user--------------------------------------------------------');
      print(response.statusCode);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        print(result);
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