// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../myunit/my_button.dart';
import '../../../../myunit/my_choices.dart';
import '../../../../myunit/my_listview.dart';
import '../../../../myunit/my_search_fence.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/wares_controller.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
class WaresView extends GetView<WaresController> {
  var _scaffoldkey = new GlobalKey<ScaffoldState>();
  // 二维码展示
  void showQR(String title,String code,String date,String createdby) async {
    TextEditingController nfcEditing = TextEditingController();
    bool isBack = false;
    Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),
      radius: 0.0,
      barrierDismissible: false,
      content: Container(
        child: Column(
          children: [
            Divider(
              height: 1.0,
              indent: 0.0,
              color: Colors.black38,
            ),
            SizedBox(height: 10,),
            SizedBox(
              width: 250.0,
              height: 250.0,
              child:QrImage(
                data: '{"api":"wares","code":"'+code+'"}',
                size: 200.0,
              ),
            ),
            SizedBox(height: 10,),
            Divider(
              height: 1.0,
              indent: 0.0,
              color: Colors.black38,
            ),
            SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.only(right: 12.0),
              alignment: Alignment.bottomRight,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: date,
                      style: TextStyle(fontSize:13,color: Colors.black26),
                    ),
                    TextSpan(
                      text: ' '+ createdby,
                      style: TextStyle(fontSize:13,color: Colors.black26),
                    ),
                  ]
              )
              )
            ),
            // Divider(
            //   height: 1.0,
            //   indent: 0.0,
            //   color: Colors.black38,
            // ),
            // Text(
            //   '扫一扫 查看商品详情',
            //   style: TextStyle(fontSize: 15.0),
            // ),
          ],
        ),
      ),
      cancel: TextButton(
        onPressed: () {
          Get.back();
          isBack = true;
        },
        child: Text(
          '确认',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var _focusNode = FocusNode();
    var _controller = TextEditingController();
    // 右侧抽屉
    Drawer drawer = Drawer(

      // alignment:Alignment.center ,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: MyChoices(
              inChoices: (value) { WaresController.MerchSetChoices = value; },
              onValues: WaresController.MerchSetChoices,
              choices: WaresController.MerchSetOption,
              onChoices: (value) { controller.merchset.text = value.toString(); },
              title: '顾客群',
            )
          ),
          Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: MyChoices(
                inChoices: (value) { WaresController.TypeSetChoices = value; },
                onValues: WaresController.TypeSetChoices,
                choices: WaresController.TypeSetOption,
                onChoices: (value) { controller.typeset.text = value.toString(); },
                title: '品类组',
              )
          ),
          Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: MyChoices(
                inChoices: (value) { WaresController.MerchTypeChoices = value; },
                onValues: WaresController.MerchTypeChoices,
                choices: WaresController.MerchTypeOption,
                onChoices: (value) { controller.merchtype.text = value.toString(); },
                title: '品类',
              )
          ),
          Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: MyChoices(
                inChoices: (value) { WaresController.MerchTypeChildChoices = value; },
                onValues: WaresController.MerchTypeChildChoices,
                choices: WaresController.MerchTypeChildOption,
                onChoices: (value) { controller.merchtypechild.text = value.toString(); },
                title: '子品类',
              )
          ),
          Divider(
            height: 1.0,
            indent: 0.0,
            color: Colors.black38,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: MyButton(
              onTap: () {controller.onInit();Navigator.pop(context);},
              text: '查    询 ',icon: Icons.search,fontColor: Colors.white,fontSize: 20,backgroundColor: Colors.lightBlueAccent,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: MyButton(
              onTap: () {controller.handleScan();},
              text: '扫一扫 ',icon: Icons.flip,fontColor: Colors.white,fontSize: 20,backgroundColor: Colors.lightGreen,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: MyButton(
              onTap: () {controller.cleanData();controller.onInit();Navigator.pop(context);},
              text: '清    空 ',icon: Icons.delete_forever,fontColor: Colors.white,fontSize: 20,backgroundColor: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
    // HomeController.isSuperUser // 超级管理员
    // HomeController.permsItem.contains("wares.add_wares") //可以创建商品
    return Scaffold(
      key: _scaffoldkey,
      endDrawer: drawer,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 50, 50, 50),),
          onPressed: Get.back,//controller.turnHOME,
        ),
        title: Text('商品管理',
          style: TextStyle(
            color: Color.fromARGB(255, 50, 50, 50),
            fontWeight: FontWeight.w600,
          ),),
        backgroundColor: Color.fromARGB(255, 255, 255,255),
        centerTitle: true,
      ),
      body: ConstrainedBox( //约束盒子
          constraints: BoxConstraints.expand(),//不指定高和宽时则铺满整个屏慕
          child: Stack(
            alignment:Alignment.center , //指定对齐方式为居中
            children: <Widget>[
              controller.obx(
                (state) => Center(
                  child: MyListView(
                    DataForm: controller.dataForm,
                    onPressed: (item){showQR(item['title'],item['code'],item['created_date'],item['created_by_name']);},
                    onTap: (id){controller.goDetails(id);},
                    dropdown: (){
                      controller.getWaresData();},
                    pullup: (){
                      controller.getWaresDataAddPage();},
                  ),
                ),
                onError: (err) {return Text('$err');},
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
              Positioned(
                  top: 0.0,//距离顶部18px（在中轴线上,因为Stack摆放在正中间）
                  child: MySearchFence(
                    backgroundColor: Colors.white,
                    onSearch:(value){controller.search.text = value;controller.onInit();},
                    rightIcon: Icons.format_list_bulleted,//Icons.flip,
                    onIcon:(value){openDrawer();},
                  )
              ),
            ],
          ),
        ),
      bottomNavigationBar: HomeController.isSuperUser || HomeController.permsItem.contains("wares.add_wares") ? new BottomAppBar(
        // notchMargin: 10.0,
        elevation: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 50,),
            // new IconButton(
            //   icon: new Icon(Icons.refresh),
            //   onPressed: () {controller.cleanData();controller.onInit();},
            // ),
          ],
        ),
      ):null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeController.isSuperUser || HomeController.permsItem.contains("wares.add_wares") ? new FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        foregroundColor: Colors.white,
        elevation: 10.0,
        onPressed: () {print('新增商品');},
        child: new Icon(Icons.post_add_outlined),
      ):null,
    );
  }
  void openDrawer(){
    // controller.getMerchSetOption();
    // controller.getTypeSetOption();
    // controller.getMerchTypeOption();
    // controller.getMerchTypeChildOption();
    //通过全局变量打开侧边栏
    //避免出现Scaffold.of() called with a context that does not contain a Scaffold的情况
    _scaffoldkey.currentState!.openEndDrawer();
  }
}



