import 'package:maifeng_app/store/login_store.dart';

class MyHttp{
  // 添加token身份认证信息
  static addAuthorization() async{
    LoginStore store = LoginStore();
    String token = await store.getToken();
    // return {'Authorization': 'Token' + ' ' + token};
    return {'Authorization': 'Bearer ' + token};
  }

  // 添加token身份认证信息，并指明传输数据类型为json
  static addAuthorizationJson() async{
    LoginStore store = LoginStore();
    String token = await store.getToken();
    return {'Authorization': 'Bearer ' + token,
      'Content-Type': 'application/json'};
  }

}