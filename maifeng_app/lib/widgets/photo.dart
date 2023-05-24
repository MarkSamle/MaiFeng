import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/modules/photo/controllers/photo_controller.dart';
import '../app/routes/app_pages.dart';

// 生成有序数组
Range(int start,int end, int x){
  List range = [];
  int n = start;
  while( n < end ) {
    range.add(n);
    n = n + x;
  }
  return range;
}
// 单个图片组件
Widget pic(List picItems, int index) {
  return picItems[index] == '' ? Container():Container(
      child: InkWell(
          onTap: () {
            // MyToast.danger('showpic');
            PhotoController.images = picItems;
            PhotoController.index = index;
            PhotoController.images = picItems;
            PhotoController.heroTag = picItems[index];
            Get.toNamed(Routes.PHOTO);
          },
          // child: SizedBox(
          //   width: 120.0,
          //   height: 120.0,
          child:Image.network(
            picItems[index],
            width: 100.0,
            height: 100.0,
            // fit: BoxFit.cover,
          )
        // )
      )
  );
}
// 单排图片
Widget LinePic(List picItems,List indexs) {
  List<Widget> tiles = [];
  for (var i in indexs) {
    tiles.add(
      Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.white, width: 1),
              left: BorderSide(color: Colors.white, width: 1),
              right: BorderSide(color: Colors.white, width: 1),
              top: BorderSide(color: Colors.white, width: 1),
            ),
          ),
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          child:pic(picItems,i),
        ),
        flex: 1,
      ),
    );
  }
  return new Row(
    children: tiles,
  );
}
// 宫格图片
Widget GridPic(List picItems) {
  List<Widget> picList = [];
  // if (picItems.length < 4) {
  //   List indexs = Range(0,picItems.length,1);
  //   picList.add(pic(picItems,indexs[0]));
  // } else if (picItems.length == 4) {
  //   List indexs1 = [0,1];
  //   List indexs2 = [2,3];
  //   picList.add(LinePic(picItems,indexs1));
  //   picList.add(LinePic(picItems,indexs2));
  // } else if (picItems.length > 4) {
  //   int cut = 3;
  //   for(var i in Range(0,(picItems.length / cut).ceil(), 1)) {
  //     // 补全空宫格占位
  //     for (var n in Range(i*cut,i*cut+cut, 1)) {
  //       if (n > picItems.length - 1 ) {
  //         picItems.add('');
  //       }
  //     }
  //     List indexsN = Range(i*cut,i*cut+cut, 1);
  //     picList.add(LinePic(picItems,indexsN));
  //   }
  // }

  int cut = 3;
  for(var i in Range(0,(picItems.length / cut).ceil(), 1)) {
    // 补全空宫格占位
    for (var n in Range(i*cut,i*cut+cut, 1)) {
      if (n > picItems.length - 1 ) {
        picItems.add('');
      }
    }
    List indexsN = Range(i*cut,i*cut+cut, 1);
    picList.add(LinePic(picItems,indexsN));
  }

  return ListView(children: picList,);
}