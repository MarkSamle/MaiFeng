import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/qr_scan_controller.dart';
import 'package:scan/scan.dart';

class QrScanView extends GetView<QrScanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('扫一扫'),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Container(
        child: Stack(
          children: [
            ScanView(
              controller: controller.scanController,
              scanAreaScale: .7,
              scanLineColor: Colors.blue,
              onCapture: (data) {
                Get.back(result: data);
              },
            ),
            Positioned(
              bottom: 50,
              left: Get.width * 0.44,
              child: GetBuilder<QrScanController>(
                init: controller, // 首次启动
                builder: (_) => IconButton(
                  icon: Icon(
                    controller.lightIcon,
                    size: 50,
                    color: Colors.lightBlue,
                  ),
                  onPressed: () => controller.pressFlash(),
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              left: 5.0,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
