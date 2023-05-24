import 'package:shared_preferences/shared_preferences.dart';

class WaresStore {
  // 保存Search
  setSearch(String Search) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('wares_search', Search);
  }
  // 获取Search
  getSearch() async {
    final prefs = await SharedPreferences.getInstance();
    final Search = prefs.getString('wares_search') ?? '';
    return Search;
  }

  static setShopChoices(String Shop) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('shop_choices', Shop);
  }
  // 获取Search
  static getShopChoices() async {
    final prefs = await SharedPreferences.getInstance();
    final Shop = prefs.getString('shop_choices') ?? '';
    return Shop;
  }

}