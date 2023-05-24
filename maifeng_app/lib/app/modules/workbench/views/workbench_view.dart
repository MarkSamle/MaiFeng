import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../config/config.dart';
import '../../../../util/my_toast.dart';
import '../../../routes/app_pages.dart';
import '../controllers/workbench_controller.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:url_launcher/url_launcher.dart';
class WorkbenchView extends GetView<WorkbenchController> {
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

  @override
  Widget build(BuildContext context) {
    WorkbenchController controller = Get.put(WorkbenchController());
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

      body: workToolItems(WorkbenchController.dataFrom)
    );
  }
}
// 通用按钮组件
Widget workTool(String imgPath,String boxName,String job) {
  return Container(
      padding: EdgeInsets.fromLTRB(14.0, 5.0, 14.0, 5.0),
      child: job == '' ? Center():Container(
          child: InkWell(
          onTap: () {
            // MyToast.danger(job);
            WorkbenchController.jobPage(job);
          },
          child: SizedBox(
            width: 50.0,
            height: 75.0,
            child: ListView(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Container(
                    width: 60.0,
                    padding: EdgeInsets.fromLTRB(3.0, 3.0, 3.0, 3.0),
                    child: new Image.asset(
                      // decoration: BoxDecoration(
                      //   border: new Border.all(color: Color.fromARGB(255, 200, 200, 200), width: 0.3),
                      //   borderRadius: BorderRadius.all(Radius.circular(15)),
                      //   color: Color.fromARGB(255, 255, 255, 255),
                      //   boxShadow: [
                      //     BoxShadow(color: Color.fromARGB(255, 255, 255, 255), offset: Offset(5.0, 5.0),    blurRadius: 10.0, spreadRadius: 2.0),
                      //     BoxShadow(color: Color.fromARGB(255, 200, 200, 200), offset: Offset(1.0, 1.0)),
                      //     BoxShadow(color: Color.fromARGB(255, 200, 200, 200))],
                      // ),
                      imgPath,
                      width: 61.8,
                      height: 61.8,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    boxName,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ]
            )
          )
      )
    )
  );
}
// 单排按钮
Widget workToolLine(List dataform) {
  List<Widget> tiles = [];
  for(var item in dataform) {
    tiles.add(
      Expanded(
        child: Container(
          // padding: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 0.0),
          child:workTool(item['imgPath'], item['boxName'], item['job']),
        ),
        flex: 1,
      ),
    );
  };
  return new Row(
    children: tiles,
  );
}
// 按钮墙 WorkbenchController.
Widget workToolItems(List dataItems) {
  List<Widget> listview = [
    SizedBox(
      height: 12,
    ),
  ];
  for(var item in dataItems) {
    listview.add(
      workToolLine(item),
    );
  };
  // listview.add(
  //   Center(
  //     child: Text(
  //       '工作台界面，开发中……',
  //       style: TextStyle(fontSize: 20),
  //     ),
  //   ),
  // );
  return new ListView(
      children:listview,
  );
}

