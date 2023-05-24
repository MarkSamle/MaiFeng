import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class MyImgButton extends StatefulWidget {
  // 传入参数
  const MyImgButton({
    Key? key,
    this.height: 45.0, // 高度
    this.width: 0,
    this.backgroundColor: Colors.white,// 背景色
    this.text: '按钮', // 文字
    this.icon:Icons.search,// 图标
    this.fontSize: 18,// 文字大小
    this.fontColor: Colors.black,// 文字颜色
    this.radius: 15,
    this.imgPath: '',
    required this.onTap, // 左侧搜索按钮回调函数
  }) : super(key: key,);
  final double height;
  final double width;
  final Color backgroundColor;
  final Color fontColor;
  final String text;
  final String imgPath;
  final IconData icon;
  final double fontSize;
  final VoidCallback onTap;
  final double radius;

  @override
  State<StatefulWidget> createState() => MyImgButtonState();

}

class MyImgButtonState extends State<MyImgButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width == 0 ? null:widget.width,
      child: SizedBox.expand(
        child: ElevatedButton(
          onPressed: () {widget.onTap();},
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                  child: widget.imgPath.contains('http') ? Image.network(
                    widget.imgPath,
                    width: widget.height * 0.70>20?widget.height * 0.70-10:widget.height * 0.70,
                    height: widget.height * 0.70>20?widget.height * 0.70-10:widget.height * 0.70,
                    fit: BoxFit.contain,
                  ): Image(
                    image: widget.imgPath=='' ? AssetImage('assets/images/maifeng.png') : AssetImage(widget.imgPath),
                    width: widget.height * 0.70>20?widget.height * 0.70-10:widget.height * 0.70,
                    height: widget.height * 0.70>20?widget.height * 0.70-10:widget.height * 0.70,
                    fit: BoxFit.contain,
                  ),
              ),
              Text.rich(
                  TextSpan(
                      children: [
                        TextSpan( text: widget.text,style: TextStyle(fontSize:widget.fontSize,color: widget.fontColor),),
                      ]
                  )
              ),
              // Row(
              //   mainAxisSize:MainAxisSize.min,// 均匀分布mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text(
              //       widget.text,
              //       style: TextStyle(
              //         fontSize: widget.fontSize,
              //         color: widget.fontColor,
              //       ),
              //     ),
              //     Icon(widget.icon,size: widget.fontSize +5 ,color: widget.fontColor,)
              //   ],
              // ),
            ],
          ),


          style: ElevatedButton.styleFrom(
            primary: widget.backgroundColor,
            padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius),
            ),
          ),
        ),
      ),
    );
  }

}