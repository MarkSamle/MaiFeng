import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../config/config.dart';
import '../../../../store/user_data.dart';
import '../../../../util/my_toast.dart';
import '../../../../widgets/full_width_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/user_controller.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:qr_flutter/qr_flutter.dart';
class UserView extends GetView<UserController> {
  UserDataStore _userDataStore = UserDataStore();

  _buildPopupMenuItem(IconData iconName, String title) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Icon(iconName, size: 22.0, color: Colors.black),
            SizedBox(width: 12.0),
            Text(title, style: TextStyle(color: Colors.black)),
          ],
        ),
      ],
    );
  }
  List<PopupMenuEntry> getPopupList() {
    if (controller.isAdmin) {
      return [
        PopupMenuItem(
          child: _buildPopupMenuItem(Icons.flip, "扫一扫"),
          value: 'qr_code',
        ),
        PopupMenuItem(
          child: _buildPopupMenuItem(Icons.cast_connected, "NFC"),
          value: 'nfc_code',
        ),
        PopupMenuDivider(height: 1.0),
        PopupMenuItem(
          child: _buildPopupMenuItem(Icons.exit_to_app, "退出登录"),
          value: 'goLogin',
        ),
        PopupMenuDivider(height: 1.0),
        PopupMenuItem(
          child: _buildPopupMenuItem(Icons.computer, "管理后台"),
          value: 'superuser',
        ),
      ];
    } else {
      return [
        PopupMenuItem(
          child: _buildPopupMenuItem(Icons.flip, "扫一扫"),
          value: 'qr_code',
        ),
        PopupMenuItem(
          child: _buildPopupMenuItem(Icons.cast_connected, "NFC"),
          value: 'nfc_code',
        ),
        PopupMenuDivider(height: 1.0),
        PopupMenuItem(
          child: _buildPopupMenuItem(Icons.exit_to_app, "退出登录"),
          value: 'goLogin',
        ),
      ];
    }
  }
  /// 展示读取NFC弹框
  void showReadDialog() async {
    TextEditingController nfcEditing = TextEditingController();
    bool isBack = false;

    Get.defaultDialog(
      title: '读取NFC',
      radius: 8.0,
      barrierDismissible: false,
      content: Container(
        child: Column(
          children: [
            Text(
              '将手机感应区贴近NFC标签感应',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(35.0, 5.0, 35.0, 0.0),
              child: TextField(
                controller: nfcEditing,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.grey[100],
                  filled: true,
                ),
              ),
            ),
          ],
        ),
      ),
      cancel: TextButton(
        onPressed: () {
          Get.back();
          isBack = true;
        },
        child: Text(
          '退出',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );

    do {
      // 扫描NFC卡
      try {
        NFCTag tag = await FlutterNfcKit.poll(timeout: Duration(days: 1));
        nfcEditing.text = tag.id;
        print('扫描结果：${tag.id}');
      } catch (e) {
        print('Scan Error: $e');
      }
    } while (!isBack);
  }
  // 二维码展示
  void showQR() async {
    TextEditingController nfcEditing = TextEditingController();
    bool isBack = false;
    Get.defaultDialog(
      title: UserController.realname,
      radius: 0.0,
      barrierDismissible: false,
      content: Container(
        child: Column(
          children: [
            SizedBox(
              width: 250.0,
              height: 250.0,
              child:QrImage(
                data: '{"api":"user","username":"'+UserController.username+'"}',
                size: 200.0,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              '扫一扫 查看用户进行操作',
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
      cancel: TextButton(
        onPressed: () {
          Get.back();
          isBack = true;
        },
        child: Text(
          '确认',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    UserController controller = Get.put(UserController());

    // 拆分元素
    // 用户真实姓名
    Widget userRealName = new Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: new Text(
        UserController.realname,
        style: new TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    // 用户账号
    Widget userName = new Text(
        '账号：' + UserController.username,
        style: new TextStyle(
          color: Colors.grey[500],
        ),
    );
    // 用户信息-顶部信息中间部分
    Widget userData = new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userRealName,
            userName,
          ],
        ),
    );

    // 头像-顶部信息左侧部分
    Widget portrait = Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
      child:
        UserController.portrait.contains('http') ? Image.network(
          UserController.portrait,
          width: 50.0,
          height: 50.0,
          fit: BoxFit.cover,
        ): Image(
          image:UserController.portrait=='' ? AssetImage('assets/images/maifeng.png') : AssetImage(UserController.portrait),
          width: 50.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
    );

    // 二维码点击按钮-顶部信息右侧部分
    Widget qrCode = new TextButton(
        onPressed: showQR,
        style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 53, 53, 53)),),
        child: new Row(
          children: [
            new Icon(Icons.qr_code_2,),
            new Icon(Icons.chevron_right,),
          ],
        )
    );

    // 用户
    Widget titleSection = new Container(
        padding: const EdgeInsets.all(32.0),
        decoration: BoxDecoration(
          color: Colors.white,// 传入背景色
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        child: new Row(
          children: [
            portrait,
            userData,
            qrCode,
          ],
        ));


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 255, 255,255),
        title: Text(
          '脉蜂',
          style: TextStyle(
            color: Color.fromARGB(255, 50, 50, 50),
            fontWeight: FontWeight.w600,
          ),
        ),
        // elevation: 0.0,
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return getPopupList();
            },
            offset: Offset(0.0, 55.0),
            elevation: 3.0,
            // color: Colors.lightBlue,
            icon: Icon(Icons.more_vert, size: 30, color: Color.fromARGB(255, 50, 50, 50),),
            onSelected: (value) async {
              print('点击的是$value');
              if (value == 'qr_code') {
                controller.handleScan();
              } else if (value == 'goLogin') {
                controller.turnLogin();
              } else if (value == 'nfc_code') {
                NFCAvailability availability = await FlutterNfcKit.nfcAvailability;
                if (availability == NFCAvailability.not_supported) {
                  // MyMessageHint.danger('NFC功能无效', '您的设备不支持NFC功能！');
                  MyToast.hint('您的设备不支持NFC功能！');
                } else if (availability == NFCAvailability.disabled) {
                  // MyMessageHint.danger('NFC功能无效', '请先打开NFC功能！');
                  MyToast.danger('请先打开NFC功能！');
                } else {
                  // MyToast.danger('扫到了！');
                  showReadDialog();
                }
              } else if (value == 'superuser') {
                launch(BASE_URL + '/admin/');
              }
            },
          ),
          SizedBox(width: 10.0),
        ],
      ),

      body: Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: BoxDecoration(
          color: Colors.grey[200],// 传入背景色
          borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        child:ListView(

        children: [
          titleSection,
          SizedBox(height: 20.0),
          FullWidthButton(
            iconPath: 'assets/images/maifeng.png',
            title: '待开发',
            onPressed: () {},
          ),
          SizedBox(height: 20.0),
          FullWidthButton(
            iconPath: 'assets/images/maifeng.png',
            title: '待开发',
            showDivider: true,
            onPressed: () {},
          ),
          FullWidthButton(
            iconPath: 'assets/images/maifeng.png',
            title: '待开发',
            showDivider: true,
            onPressed: () {},
          ),
          FullWidthButton(
            iconPath: 'assets/images/maifeng.png',
            title: '待开发',
            showDivider: true,
            onPressed: () {},
          ),
          FullWidthButton(
            iconPath: 'assets/images/maifeng.png',
            title: '待开发',
            onPressed: () {},
          ),
          SizedBox(height: 20.0),
          FullWidthButton(
            iconPath: 'assets/images/maifeng.png',
            title: '设置',
            onPressed: () {
              // Get.toNamed(Routes.SETTINGS);
            },
          ),
          ],
        )
      )
    );
  }
}
