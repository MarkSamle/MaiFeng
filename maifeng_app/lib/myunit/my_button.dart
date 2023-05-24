import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  // 传入参数
  const MyButton({
    Key? key,
    this.height: 45.0, // 高度
    this.width: 0,
    this.backgroundColor: Colors.white,// 背景色
    this.text: '按钮', // 文字
    this.icon:Icons.search,// 图标
    this.fontSize: 18,// 文字大小
    this.fontColor: Colors.black,// 文字颜色
    this.radius: 15,
    required this.onTap, // 左侧搜索按钮回调函数
  }) : super(key: key,);
  final double height;
  final double width;
  final Color backgroundColor;
  final Color fontColor;
  final String text;
  final IconData icon;
  final double fontSize;
  final VoidCallback onTap;
  final double radius;

  @override
  State<StatefulWidget> createState() => MyButtonState();

}

class MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width == 0 ? null:widget.width,
      child: SizedBox.expand(
        child: ElevatedButton(
          onPressed: () {widget.onTap();},
          child: Row(
            mainAxisSize:MainAxisSize.min,// 均匀分布mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  color: widget.fontColor,
                ),
              ),
              Icon(widget.icon,size: widget.fontSize +5 ,color: widget.fontColor,)
            ],
          ),
          style: ElevatedButton.styleFrom(
            primary: widget.backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius),
            ),
          ),
        ),
      ),
    );
  }

}