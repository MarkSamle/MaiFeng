// img = qrcode.make('/api/ware-sku/?id=&name=&wares__code=' + str(obj.wares.code)+'&code'+str(obj.code))
// img = qrcode.make('/api/wares/?id=&name=&code=' + str(obj.code))

import 'dart:convert';
import 'package:maifeng_app/config/config.dart' show BASE_URL;
import 'package:http/http.dart' as http;
import 'package:maifeng_app/store/user_data.dart';
import '../../store/login_store.dart';
import '../../util/my_http.dart';
import '../../util/my_toast.dart';

const WARES_URL = BASE_URL + '/api/wares/';
const WARESKU_URL = BASE_URL + '/api/ware-sku/';

const MERCHTYPECHILD_URL = BASE_URL + '/api/merch-type-child-option/';
const MERCHTYPE_URL = BASE_URL + '/api/merch-type-option/';
const TYPESET_URL = BASE_URL + '/api/type-set-option/';
const MERCHSET_URL = BASE_URL + '/api/merch-set-option/';

LoginStore loginStore = LoginStore();

class WraesApi {
  //  顾客群下拉选
  static getMerchSet() async {
    try {
      Uri url = Uri.parse(MERCHSET_URL);
      // print('MerchSet--------------------------------------------------------');
      print(MERCHSET_URL);
      final response = await http.get(url,headers: await MyHttp.addAuthorizationJson(),);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        return result;
      } else { throw Exception('请求异常......');}
    } catch (e) {throw Exception('请求异常......');}
  }
  //  品类组下拉选
  static getTypeSet() async {
    try {
      Uri url = Uri.parse(TYPESET_URL);
      print(TYPESET_URL);
      final response = await http.get(url,headers: await MyHttp.addAuthorizationJson(),);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        return result;
      } else { throw Exception('请求异常......');}
    } catch (e) {throw Exception('请求异常......');}
  }
  //  品类下拉选
  static getMerchType() async {
    try {
      Uri url = Uri.parse(MERCHTYPE_URL);
      print(MERCHTYPE_URL);
      final response = await http.get(url,headers: await MyHttp.addAuthorizationJson(),);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        return result;
      } else { throw Exception('请求异常......');}
    } catch (e) {throw Exception('请求异常......');}
  }
  //  子品类下拉选
  static getMerchTypeChild() async {
    try {
      Uri url = Uri.parse(MERCHTYPECHILD_URL);
      print(MERCHTYPECHILD_URL);
      final response = await http.get(url,headers: await MyHttp.addAuthorizationJson(),);
      if (response.statusCode == 200) {
        Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
        var result = json.decode(utf8decoder.convert(response.bodyBytes));
        return result;
      } else { throw Exception('请求异常......');}
    } catch (e) {throw Exception('请求异常......');}
  }

  // 查询商品数据
  static getAllWares(Map SearchForm) async {
    try {
      String SEARCH_URL = WARES_URL +
          '?page=' + SearchForm['page'].toString() +
          '&search=' + SearchForm['search'].toString() +
          '&merchtypechildIds=' + SearchForm['merchtypechild'].toString() +
          '&merchtypeIds=' + SearchForm['merchtype'].toString() +
          '&typesetIds=' + SearchForm['typeset'].toString() +
          '&merchsetIds=' + SearchForm['merchset'].toString();
      Uri url = Uri.parse(SEARCH_URL);
      final response = await http.get(
        url,
        headers: await MyHttp.addAuthorizationJson(),
      );
      // print('allwares--------------------------------------------------------');
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
  // 根据id获取商品详情
  static getWaresID(int id) async {
    try {
      String SEARCH_URL = WARES_URL + '?id=' + id.toString();
      Uri url = Uri.parse(SEARCH_URL);
      final response = await http.get(
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
  //  根据ID删除对应商品
  static delWaresID(int id) async {
    try {
      String DEL_URL = WARES_URL + id.toString() + '/';
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
  // 扫码查询商品信息接口
  static getWares(String code) async {
    try {
      String SEARCH_URL = WARES_URL + '?code=' + code;
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





  // 获取商品sku
  static getAllSku(Map SearchForm) async {
    try {
      String SEARCH_URL = WARESKU_URL +
          '?ware=' + SearchForm['ware'].toString() +
          '&page=' + SearchForm['page'].toString() +
          '&search=' + SearchForm['search'].toString();

      Uri url = Uri.parse(SEARCH_URL);
      final response = await http.get(
        url,
        headers: await MyHttp.addAuthorizationJson(),
      );
      // print('allsku--------------------------------------------------------');
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
  // 根据id获取商品sku详情
  static getSkuID(int id) async {
    try {
      String SEARCH_URL = WARESKU_URL + '?id=' + id.toString();
      Uri url = Uri.parse(SEARCH_URL);
      final response = await http.get(
        url,
        headers: await MyHttp.addAuthorizationJson(),
      );
      // print('skuid>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
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
  //  根据ID删除对应商品sku
  static delSkuID(int id) async {
    try {
      String DEL_URL = WARESKU_URL + id.toString() + '/';
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
  // 扫码查询商品信息接口
  static getSku(String wares,String code) async {
    try {
      // wares__code=ZH000001&code=
      String SEARCH_URL = WARESKU_URL + '?wares__code=' + wares + '&code=' + code;
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
}