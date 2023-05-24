import 'dart:convert';
import 'package:maifeng_app/config/config.dart' show BASE_URL;
import 'package:http/http.dart' as http;
import 'package:maifeng_app/store/user_data.dart';
import '../../store/login_store.dart';
import '../../util/my_http.dart';
import '../../util/my_toast.dart';

const SHOP_URL = BASE_URL + '/api/shop/';
const SHOP_OPTION_URL = BASE_URL + '/api/shop-option/';
const LARGEREGION_URL = BASE_URL + '/api/large-region-option/';
const REGION_URL = BASE_URL + '/api/region-option/';
LoginStore loginStore = LoginStore();

class ShopApi {

  // 查询数据
  static getAllShop(Map SearchForm) async {
    try {
      String SEARCH_URL = SHOP_URL +
          '?page=' + SearchForm['page'].toString() +
          '&search=' + SearchForm['search'].toString() +
          '&largeregionIds=' + SearchForm['largeregion'].toString() +
          '&regionIds=' + SearchForm['region'].toString() ;
      Uri url = Uri.parse(SEARCH_URL);
      final response = await http.get(
        url,
        headers: await MyHttp.addAuthorizationJson(),
      );
      print(SEARCH_URL);
      print(response.statusCode);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        return result;
      } else if(response.statusCode == 404){
        var result ={};
        result['results'] = {};
        result['results']['code'] = 404;
        return result;
      }else {
        throw Exception('请求异常......');
      }
    } catch (e) {
      print(e);
      throw Exception('请求异常......');
    }
  }
  // 根据id获取详情
  static getShopID(int id) async {
    try {
      String SEARCH_URL = SHOP_URL + '?id=' + id.toString();
      Uri url = Uri.parse(SEARCH_URL);
      final response = await http.get(
        url,
        headers: await MyHttp.addAuthorizationJson(),
      );
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        return result;
      } else {
        throw Exception('请求异常......');
      }
    } catch (e) {
      print(e);
      throw Exception('请求异常......');
    }
  }
  //  根据ID删除对应数据
  static delShopID(int id) async {
    try {
      String DEL_URL = SHOP_URL + id.toString() + '/';
      Uri url = Uri.parse(DEL_URL);
      final response = await http.delete(
        url,
        headers: await MyHttp.addAuthorizationJson(),
      );
      // print('waresid>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        return result;
      } else {
        throw Exception('请求异常......');
      }
    } catch (e) {
      print(e);
      throw Exception('请求异常......');
    }
  }
  // 扫码查询数据
  static getShop(String code) async {
    try {
      String SEARCH_URL = SHOP_URL + '?code=' + code;
      Uri url = Uri.parse(SEARCH_URL);
      final response = await http.get(
        url,
        headers: await MyHttp.addAuthorizationJson(),
        // headers: {'Authorization': 'Bearer ' + await loginStore.getToken(),
        //   'Content-Type': 'application/json'},
      );
      // print('wares--------------------------------------------------------');
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

  static getShopOption() async {
    try {
      Uri url = Uri.parse(SHOP_OPTION_URL);
      print(SHOP_OPTION_URL);
      final response = await http.get(url,headers: await MyHttp.addAuthorizationJson(),);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        return result;
      } else { throw Exception('请求异常......');}
    } catch (e) {throw Exception('请求异常......');}
  }

  static getLargeRegion() async {
    try {
      Uri url = Uri.parse(LARGEREGION_URL);
      print(LARGEREGION_URL);
      final response = await http.get(url,headers: await MyHttp.addAuthorizationJson(),);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        return result;
      } else { throw Exception('请求异常......');}
    } catch (e) {throw Exception('请求异常......');}
  }
  static getRegion() async {
    try {
      Uri url = Uri.parse(REGION_URL);
      print(REGION_URL);
      final response = await http.get(url,headers: await MyHttp.addAuthorizationJson(),);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        return result;
      } else { throw Exception('请求异常......');}
    } catch (e) {throw Exception('请求异常......');}
  }
}