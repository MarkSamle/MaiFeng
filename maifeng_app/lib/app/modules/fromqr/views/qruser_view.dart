import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/qruser_controller.dart';

class QRUserView extends GetView<QRUserController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 50, 50, 50),),
          onPressed: Get.back,//controller.turnHOME,
        ),
        title: Text(QRUserController.userData['results']['data'][0]['realname'],
          style: TextStyle(
            color: Color.fromARGB(255, 50, 50, 50),
            fontWeight: FontWeight.w600,
          ),),
        backgroundColor: Color.fromARGB(255, 255, 255,255),
        centerTitle: true,
      ),
      body: Text('searchdata:' + json.encode(QRUserController.userData)),
    );
  }

}