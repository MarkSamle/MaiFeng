import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMessageHint {
  /// 成功弹框
  static void success(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      ),
      messageText: Center(
        child: Text(
          message,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      backgroundColor: Colors.greenAccent,
      maxWidth: Get.width * 0.65,
      duration: Duration(seconds: 2),
    );
  }

  /// 失败弹框
  static void danger(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      ),
      messageText: Center(
        child: Text(
          message,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      backgroundColor: Colors.redAccent,
      maxWidth: Get.width * 0.65,
      duration: Duration(seconds: 2),
    );
  }

  /// 警告弹框
  static void warn(String title, String message) {
    Get.snackbar(
      title,
      message,
      titleText: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
      ),
      messageText: Center(
        child: Text(
          message,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      backgroundColor: Colors.orange,
      maxWidth: Get.width * 0.65,
      duration: Duration(seconds: 2),
    );
  }
}
