import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan/scan.dart';

class PhotoController extends GetxController {
  static List images=[];
  static int index=0;
  static String heroTag = '';
  static PageController controller = new PageController();


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}