import 'package:shared_preferences/shared_preferences.dart';

class LoginStore {
  // 设置本地存储登录信息
  bool isLogin = false;

  // 保存页面位置
  setPage(String page) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('this_page', page);
  }

  // 获取页面位置
  getPage() async {
    final prefs = await SharedPreferences.getInstance();
    final page = prefs.getString('this_page') ?? '';
    return page;
  }

  // 保存令牌token
  setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }

  // 获取token
  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token') ?? '';
    return token;
  }

  // 保存用户名(工号)
  setUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  // 获取用户名(工号)
  getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username') ?? '';
    return username;
  }

  // 保存密码
  setPassword(String pwd) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', pwd);
  }

  // 获取密码
  getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    final pwd = prefs.getString('password') ?? '';
    return pwd;
  }

  // 'perms': user.get_all_permissions(),

  // 保存用户ID
  setUserId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_id', id);
  }

  // 获取用户ID
  getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('user_id') ?? '';
    return id;
  }

  // 记录是否超级用户
  setSuper(bool isSuper) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('super', isSuper);
  }

  // 查询是否超级用户
  getSuper() async {
    final prefs = await SharedPreferences.getInstance();
    final isSuper = prefs.getBool('super') ?? '';
    return isSuper;
  }

  // 记录权限
  setPerms(List<String> perms) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('the_perms', perms);
  }

  // 查询权限
  getPerms() async {
    final prefs = await SharedPreferences.getInstance();
    final perms = prefs.getStringList('the_perms') ?? [];
    // print(perms.runtimeType.toString());
    // List<String> perms = prefs.getStringList('the_perms') ?? [];
    return perms;
  }


  // 退出登录，清除存储的token等用户信息
  logout() async {
    final prefs = await SharedPreferences.getInstance();
    final result = await prefs.clear();
    return result;
  }
}
