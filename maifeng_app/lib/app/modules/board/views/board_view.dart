import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../config/config.dart';
import '../../../../util/my_toast.dart';
import '../chart/barchatsample1.dart';
import '../chart/barchatsample2.dart';
import '../chart/barchatsample3.dart';
import '../chart/barchatsample4.dart';
import '../chart/barchatsample5.dart';
import '../chart/linechartsample1.dart';
import '../chart/linechartsample10.dart';
import '../chart/linechartsample2.dart';
import '../chart/linechartsample3.dart';
import '../chart/linechartsample4.dart';
import '../chart/linechartsample5.dart';
import '../chart/linechartsample6.dart';
import '../chart/linechartsample7.dart';
import '../chart/linechartsample8.dart';
import '../chart/linechartsample9.dart';
import '../chart/piechartsample1.dart';
import '../chart/piechartsample2.dart';
import '../chart/piechartsample3.dart';
import '../chart/radarchartsample1.dart';
import '../chart/scatterchartsample2.dart';
import '../controllers/board_controller.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
// import 'package:example/radar_chart/radar_chart_page.dart';
// import 'package:example/scatter_chart/scatter_chart_page.dart';
// import 'bar_chart/bar_chart_page.dart';
// import 'bar_chart/bar_chart_page2.dart';
// import 'bar_chart/bar_chart_page3.dart';
// import 'line_chart/line_chart_page.dart';
// import 'line_chart/line_chart_page2.dart';
// import 'line_chart/line_chart_page3.dart';
// import 'line_chart/line_chart_page4.dart';
// import 'pie_chart/pie_chart_page.dart';
// import 'utils/platform_info.dart';
// import 'scatter_chart/scatter_chart_page.dart';
import 'package:fl_chart/fl_chart.dart';
class BoardView extends GetView<BoardController> {
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
    BoardController controller = Get.put(BoardController());
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

      body: new ListView(
        children:[
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // BarChartSample1(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // BarChartSample2(),
          SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          BarChartSample3(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // BarChartSample4(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // BarChartSample5(),
          SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          LineChartSample1(),
          SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          LineChartSample2(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // LineChartSample3(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // LineChartSample4(),
          SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          LineChartSample5(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // LineChartSample6(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // LineChartSample7(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // LineChartSample8(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // LineChartSample9(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // LineChartSample10(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // PieChartSample1(),
          SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          PieChartSample2(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // PieChartSample3(),
          SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          ScatterChartSample2(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // RadarChartSample1(),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
          // Center(
          //   child: Text(
          //     '看板界面，开发中……',
          //     style: TextStyle(fontSize: 20),
          //   ),
          // ),
          // SizedBox(height: 35, child:Container(margin: EdgeInsets.only(left: 32, bottom: 0,top:10,),child:Text('· Demo',style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.w600,)))),
        SizedBox(height: 35)
        ]
      )
    );
  }
}
