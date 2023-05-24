import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scan/scan.dart';

class QrScanController extends GetxController {
  //TODO: Implement QrScanController

  IconData lightIcon = Icons.flash_off;
  final ScanController scanController = ScanController();

  @override
  void onInit() {
    super.onInit();
  }

  void pressFlash () {
    scanController.toggleTorchMode();
    if (lightIcon == Icons.flash_on) {
      lightIcon = Icons.flash_off;
    } else {
      lightIcon = Icons.flash_on;
    }
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
