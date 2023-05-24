import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

import 'my_wares_list.dart';
// 列表聚合上拉加载下拉刷新

class MyList extends StatefulWidget {
  // 传入参数
  const MyList({
    Key? key,
    required this.DataForm,// 数据列表[{},{}……]
    this.FrontHeight: 50.0, // 前置高度，避开搜索栏
    required this.onPressed,// 点击回调函数
    required this.onTap,// 点击回调函数
  }) : super(key: key,);
  final List DataForm;
  final double FrontHeight;
  final ValueChanged<int> onPressed;
  final ValueChanged<int> onTap;
  @override
  State<StatefulWidget> createState() => MyListState();
}

// 构建
class MyListState extends State<MyList> {
  _MakeList() {
    List<Widget> theList = [];
    theList = [
      SizedBox(height: widget.FrontHeight,),// 前置高度
    ];
    for(var item in widget.DataForm) {
      theList.add(MyWaresList(
        title:item['title'],
        color: Colors.black,
        TfontWeight:FontWeight.w500,// FontWeight.bold,18,
        Tsize:18,
        desc:item['desc'],// 'The msg is the Desc !',
        dcolor:Colors.black38,// Colors.black38,
        imgpath:item['imgpath'],
        id:item['id'],
        onPressed:(){widget.onPressed(item['id']);},// (){MyToast.success2(item['id'].toString());},
        onTap:(){widget.onTap(item['id']);},// onTap: (){MyToast.success2('点击' + item['id'].toString());},
          child:SizedBox(height: 1,)
      ));
    }
    theList.add(SizedBox(height: 50,));
    return theList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: _MakeList(),
    );
  }

}