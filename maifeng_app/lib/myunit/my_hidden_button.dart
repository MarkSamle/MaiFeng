import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class MyHiddenButton extends StatefulWidget {
  // 传入参数
  const MyHiddenButton({
    Key? key,
    // required this.id,
  }) : super(key: key,);
  //  说明参数 使用参数widget.id
  // final int id;
  @override
  State<StatefulWidget> createState() => MyHiddenButtonState();
}

class MyHiddenButtonState extends State<MyHiddenButton> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  
}

