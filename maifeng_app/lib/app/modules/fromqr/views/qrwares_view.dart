import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../widgets/photo.dart';
import '../controllers/qrwares_controller.dart';

class QRWaresView extends GetView<QRWaresController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 50, 50, 50),),
          onPressed: Get.back,//controller.turnHOME,
        ),
        title: Text('商品查询',
          style: TextStyle(
            color: Color.fromARGB(255, 50, 50, 50),
            fontWeight: FontWeight.w600,
          ),),
        backgroundColor: Color.fromARGB(255, 255, 255,255),
        centerTitle: true,
      ),
        // body: Text('searchdata:' + json.encode(QRWaresController.waresData)),
        body: ListView(
          padding: EdgeInsets.all(8.0),
          children: [
            Container(
              alignment: Alignment.center,
              child:Text(
                  '${QRWaresController.waresData['results']['data'][0]['name']}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0,0)),
                  ),
              padding: EdgeInsets.all(6.0),
            ),
            Table(
              //所有列宽
                columnWidths: const {
                  //列宽
                  0: FixedColumnWidth(100.0),
                  1: FixedColumnWidth(100.0),
                },
                //表格边框样式
                border: TableBorder.all(
                  color: Colors.black38,
                  width: 2.0,
                  style: BorderStyle.solid,
                ),
                children: [
                  TableRow(
                      children: [
                        Container(child:Text('ID：${QRWaresController.waresData['results']['data'][0]['id']}'),padding: EdgeInsets.all(6.0),),
                        Container(child:Text('货号：${QRWaresController.waresData['results']['data'][0]['code']}'),padding: EdgeInsets.all(6.0),),
                      ]
                  ),
                  TableRow(
                      children: [
                        Container(child:Text('顾客群：${QRWaresController.waresData['results']['data'][0]['merchset']}'),padding: EdgeInsets.all(6.0),),
                        Container(child:Text('品类组：${QRWaresController.waresData['results']['data'][0]['typeset']}'),padding: EdgeInsets.all(6.0),),
                      ]
                  ),
                  TableRow(
                      children: [
                        Container(child:Text('品类：${QRWaresController.waresData['results']['data'][0]['merchtype']}'),padding: EdgeInsets.all(6.0),),
                        Container(child:Text('子品类：${QRWaresController.waresData['results']['data'][0]['merchtypechild_name']}'),padding: EdgeInsets.all(6.0),),
                      ]
                  ),
                  TableRow(
                      children: [
                        Container(child:Text('特征/款式：${QRWaresController.waresData['results']['data'][0]['style']}'),padding: EdgeInsets.all(6.0),),
                        Container(child:Text('质地：${QRWaresController.waresData['results']['data'][0]['quality']}'),padding: EdgeInsets.all(6.0),),
                      ]
                  ),
                  TableRow(
                      children: [
                        Container(child:Text('重量：${QRWaresController.waresData['results']['data'][0]['weight']} g'),padding: EdgeInsets.all(6.0),),
                        Container(child:Text('厚度：${QRWaresController.waresData['results']['data'][0]['land']} cm'),padding: EdgeInsets.all(6.0),),
                      ]
                  ),
                  TableRow(
                      children: [
                        Container(child:Text('季节：${QRWaresController.waresData['results']['data'][0]['season']}'),padding: EdgeInsets.all(6.0),),
                        Container(child:Text('物流：${QRWaresController.waresData['results']['data'][0]['logistics']}'),padding: EdgeInsets.all(6.0),),
                      ]
                  ),

                ]
            ),
            
            SizedBox(height: 10,),
            QRWaresController.waresData['results']['data'][0]['images'].length > 6 ?SizedBox(height: 320,
              child:GridPic(QRWaresController.waresData['results']['data'][0]['images']),
            ):SizedBox(height: 220,
              child:GridPic(QRWaresController.waresData['results']['data'][0]['images']),
            ),
          ],
        )
    );
  }

}