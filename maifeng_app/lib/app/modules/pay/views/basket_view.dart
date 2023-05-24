import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maifeng_app/myunit/my_button.dart';

import '../../../../myunit/my_img_button.dart';
import '../../../../myunit/my_new_img_button.dart';
import '../../../../store/wares_store.dart';
import '../controllers/basket_controller.dart';

class BasketView extends GetView<BasketController> {
  const BasketView({Key? key}) : super(key: key);

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
          '购物篮',
          style: TextStyle(
            color: Color.fromARGB(255, 50, 50, 50),
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255,255),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Color.fromARGB(255, 50, 50, 50),
            ),
            onPressed: (){controller.cleanData();},//controller.turnBack,//
          ),
        ],
        centerTitle: true,
      ),
      body: controller.obx(
            (state) => Container(),
        onError: (err) {
          return Text('$err');
        },
        onLoading: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text(
                "疯狂加载中...",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: controller.obx(
            (state) => BottomAppBar(
              // notchMargin: 10.0,
              elevation: 10.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 2,
                      child: SizedBox(height: 50,)
                  ),
                  Expanded(
                      flex: 3,
                      child: Text.rich(
                          TextSpan(
                              children: [
                                TextSpan( text: '合计: ',style: TextStyle(),),
                                TextSpan( text: ' ¥ ${BasketController.money} 元',style: TextStyle(color: Colors.deepOrange),),

                              ]
                          )
                      )
                  ),
                  Expanded(
                      flex: 3,
                      child: MyButton(
                          onTap: () {},
                          text: '结算(${BasketController.beforeSkuDataItems.length})',fontColor:Colors.white,
                          icon:Icons.check,
                          backgroundColor:BasketController.beforeSkuDataItems.isNotEmpty ?Colors.redAccent:Colors.black12,
                          radius:0
                      )
                  ),
                ],
              ),
            ),
        onError: (err) {
          return Text('$err');
        },
        onLoading: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text(
                "疯狂加载中...",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
        elevation: 10.0,
        onPressed: () {print('新增商品');controller.handleScan();},
        child: new Icon(Icons.qr_code_scanner),
      ),

    );
  }

}