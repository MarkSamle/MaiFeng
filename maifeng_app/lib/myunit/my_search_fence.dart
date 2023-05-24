import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
// 使用方法
// 使用悬浮层悬浮在正常页面，列表中预留组件高度
// Center(
//   child:ConstrainedBox( //约束盒子
//     constraints: BoxConstraints.expand(),//不指定高和宽时则铺满整个屏慕
//     child: Stack(
//       alignment:Alignment.center , //指定对齐方式为居中
//       children: <Widget>[ //子组件列表
//       ListView(children: [SizedBox(height: 50,),],),
//           Positioned(
//           top: 0.0,//距离顶部18px（在中轴线上,因为Stack摆放在正中间）
//           child: MySearchFence(
//             onSearch:(value){print(value);},// 回调函数传值
//             rightIcon: Icons.flip,
//             onIcon:(value){print(value);},// 回调函数传值
//             ),
//           ),
//       ],
//     ),
//   ),
// )

class MySearchFence extends StatefulWidget {
  // 传入参数
  const MySearchFence({
    Key? key,
    this.height: 50.0, // 搜索栏高度
    this.hintText: '搜索', // 搜索栏初始提示
    this.backgroundColor: Colors.white,// 背景色
    this.fontSize: 18,// 文字大小
    this.fontColor: Colors.black,// 文字颜色
    required this.onSearch, // 左侧搜索按钮回调函数
    required this.onIcon,// 右侧图标按钮回调函数
    this.rightIcon: Icons.flip,// 右侧图标
    this.leftIcon:Icons.search,// 左侧图标
  }) : super(key: key,);
  final double height;
  final String hintText;
  final Color backgroundColor;
  final double fontSize;
  final Color fontColor;
  final ValueChanged<String> onSearch;
  final ValueChanged<String> onIcon;
  final IconData rightIcon;
  final IconData leftIcon;
  @override
  State<StatefulWidget> createState() => MySearchFenceState();
}

// 监听值变化绑定函数
void _textFieldChanged(String str) {
  print(str);
}

// 构建
class MySearchFenceState extends State<MySearchFence> {
  TextEditingController value = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,// 宽度全屏
      height: widget.height,// 传入高度
      child: Container(
        padding: EdgeInsets.fromLTRB(13, 0, 10, 0),
        decoration: BoxDecoration(
          color: widget.backgroundColor,// 传入背景色
          border: new Border(bottom:BorderSide(width: 1,color: Color(0xffe5e5e5)) ),
          // borderRadius: BorderRadius.all(Radius.circular(0)),
        ),
        child:
        Row(
          children: [
            // 左侧搜索按钮
            SizedBox(
              height: 26,
              width: 26,
              child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 53, 53, 53)),
                    minimumSize: MaterialStateProperty.all(Size(10, 5)),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  onPressed: (){widget.onSearch(value.text);},// 回调函数
                  child: new Row(
                    children: [
                      new Icon(widget.leftIcon,color: Colors.black38,),
                    ],
                  )
              ),
            ),
            // 中间搜索框
            SizedBox(
              height: widget.height,
              width: MediaQuery.of(context).size.width-75,
              child: TextField(
                controller: value,
                style: TextStyle(color: widget.fontColor,fontSize: widget.fontSize),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {value.clear();},
                    icon: Icon(Icons.cancel, color: Colors.black38,size: 18,)
                  ),
                  contentPadding: EdgeInsets.all(10.0),
                  hintText: widget.hintText,
                  border: InputBorder.none,
                ),
                autofocus: false,
                // onChanged: _textFieldChanged,
              )
            ),
            // 右侧自定义图标按钮
            SizedBox(
              height: 26,
              width: 26,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 53, 53, 53)),
                  minimumSize: MaterialStateProperty.all(Size(10, 5)),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                ),
                onPressed: (){widget.onIcon(value.text);},
                child: new Row(
                  children: [
                   new Icon(widget.rightIcon,color: Colors.black38,),
                  ],
                )
              ),
            )
          ],
        )
      )
    );
  }
}