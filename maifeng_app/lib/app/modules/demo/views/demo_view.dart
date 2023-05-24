import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../myunit/my_img_button.dart';
import '../../../../myunit/my_new_img_button.dart';
import '../../../../store/wares_store.dart';
import '../controllers/demo_controller.dart';

class DemoView extends GetView<DemoController> {
  const DemoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 50, 50, 50),
            ),
            onPressed: Get.back,//controller.turnBack,//
          ),
          title: const Text(
            'Demo',
            style: TextStyle(
              color: Color.fromARGB(255, 50, 50, 50),
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255,255),
          centerTitle: true,
        ),
        body: Container()
    );
  }

}