import 'package:shared_preferences/shared_preferences.dart';

class UserDataStore {
  // 保存Userid
  setUserID(int userid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_userid', userid);
  }
  // 获取Userid
  getUserID() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getInt('user_userid') ?? 0;
    return userid;
  }
  // 保存UserExtensionid
  setUserExtensionID(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user_id', id);
  }
  // 获取UserExtensionid
  getUserExtensionID() async {
    final prefs = await SharedPreferences.getInstance();
    final id = prefs.getInt('user_id') ?? 0;
    return id;
  }
  // 保存Username
  setUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_username', username);
  }
  // 获取Username
  getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('user_username') ?? '';
    return username;
  }
  // 保存realname
  setRealname(String realname) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_realname', realname);
  }
  // 获取realname
  getRealname() async {
    final prefs = await SharedPreferences.getInstance();
    final realname = prefs.getString('user_realname') ?? '';
    return realname;
  }
  // 保存telephone
  setTelephone(String telephone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_telephone', telephone);
  }
  // 获取telephone
  getTelephone() async {
    final prefs = await SharedPreferences.getInstance();
    final telephone = prefs.getString('user_telephone') ?? '';
    return telephone;
  }
  // 保存portrait
  setPortrait(String portrait) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_portrait', portrait);
  }
  // 获取portrait
  getPortrait() async {
    final prefs = await SharedPreferences.getInstance();
    final portrait = prefs.getString('user_portrait') ?? '';
    return portrait;
  }
  // "portrait": null,
  // 保存Birthday
  setBirthday(String birthday) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_birthday', birthday);
  }
  // 获取Birthday
  getBirthday() async {
    final prefs = await SharedPreferences.getInstance();
    final birthday = prefs.getString('user_birthday') ?? '';
    return birthday;
  }
  // 保存Desc
  setDesc(String desc) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_desc', desc);
  }
  // 获取Desc
  getDesc() async {
    final prefs = await SharedPreferences.getInstance();
    final desc = prefs.getString('user_desc') ?? '';
    return desc;
  }

  // 保存Sex
  setSex(String sex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_sex', sex);
  }
  // 获取Sex
  getSex() async {
    final prefs = await SharedPreferences.getInstance();
    final sex = prefs.getString('user_sex') ?? '';
    return sex;
  }








}