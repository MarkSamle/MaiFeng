import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'my_list_element.dart';
import 'my_wares_list.dart';
// 列表聚合上拉加载下拉刷新

class MySelect extends StatefulWidget {
  // 传入参数
  const MySelect({
    Key? key,
  }) : super(key: key,);
  @override
  State<StatefulWidget> createState() => MySelectState();
}


class MySelectState extends State<MySelect> {
  static String choices = '测试';
  static List DataFrom = ['测试1','测试2','测试3','测试4','测试5',];
  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () { Navigator.of(context).pop();},
    );
    AlertDialog alert = AlertDialog(
      title: Text("My Title"),
      content: Container(
          child: SizedBox(
            height: 200,
            width: 200,
            child: ListView(
              children: _MakeList(DataFrom),
            ),
          )
      ),
      actions: [
        okButton,
      ],
    );
    //显示对话框
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _MakeList(List dataFrom) {
    List<Widget> theList = [];
    for(var item in dataFrom) {
      print(item);
      theList.add(Text(item));
    }
    return theList;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: (){showAlertDialog(context);},
        style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 53, 53, 53)),),
        child: new Row(
          children: [
            new Icon(Icons.search_outlined,),
            Text(choices)
          ],
        )
      );
  }
  
}