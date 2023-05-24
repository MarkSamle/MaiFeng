import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import '../util/my_toast.dart';
import 'my_hidden_button.dart';
// import '../util/my_toast.dart';
// 使用方法
// Widget WaresList(List dataform) {
//   List<Widget> theList = [];
//   for(var item in dataform) {
//     theList.add(MyListElement(
//         title:item['title'],
//         color: Colors.black,
//         TfontWeight:FontWeight.w500,// FontWeight.bold,18,
//         Tsize:18,
//         desc:item['desc'],// 'The msg is the Desc !',
//         dcolor:Colors.black38,// Colors.black38,
//         imgpath:item['imgpath'],
//         id:item['id'],
//         onPressed:(){MyToast.success2(item['id'].toString());},
//         onTap: (){MyToast.success2('点击' + item['id'].toString());},
//     ));
//   }
//   return ListView(
//     children: theList,
//   );
// }

class MyListElement extends StatefulWidget {
  // 传入参数
  const MyListElement({
    Key? key,
    required this.id,
    required this.title,
    required this.color,
    required this.TfontWeight,
    required this.Tsize,
    required this.desc,
    required this.dcolor,
    required this.imgpath,
    required this.onPressed,
    required this.onTap,
    this.code:'',
    this.tagColor: Colors.orange,
    this.tagtextColor:Colors.white,
    required this.child,
    this.tag:'',

  }) : super(key: key,);
  //  说明参数 使用参数widget.id
  final int id;
  // 标题属性
  final String title;
  final String code;
  final Color color;
  final FontWeight TfontWeight;
  final double Tsize;
  // 说明文字属性
  final String desc;
  final String tag;
  final Color dcolor;
  final Color tagColor;
  final Color tagtextColor;
  // 图片
  final String imgpath;
  final VoidCallback onPressed;
  final VoidCallback onTap;
  final Widget child;
  @override
  State<StatefulWidget> createState() => MyListElementState();
}

class MyListElementState extends State<MyListElement> {
  @override
  Widget build(BuildContext context) {
    return OneListLine(
        widget.color,
        widget.code,
        widget.title,
        widget.TfontWeight,// FontWeight.bold,18,
        widget.Tsize,
        widget.desc,// 'The msg is the Desc !',
        widget.dcolor,// Colors.black38,
        widget.imgpath,
        widget.id,
        widget.onPressed,
        widget.onTap,
        widget.child,
        widget.tag,
        widget.tagColor,
        widget.tagtextColor
    );
  }
}
// 标题
Widget Title(Color tcolor,String title,FontWeight fontWeight,double Size){
  return Container(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: new Text(
      title,
      style: new TextStyle(
        color:tcolor,
        fontSize: Size-4, // 18,
        fontWeight: fontWeight,// FontWeight.bold,
      ),
    ),
  );
}

Widget Code(Color tcolor,String code,FontWeight fontWeight,double Size){
  return Container(
    padding: const EdgeInsets.only(bottom: 2.0),
    child: new Text(
      code,
      style: new TextStyle(
        color:tcolor,
        fontSize: Size, // 18,
        fontWeight: fontWeight,// FontWeight.bold,
      ),
    ),
  );
}

// 说明
Widget Desc(String desc,Color dcolor){
  return Text(
    desc,// 'The msg is the Desc !',
    style: new TextStyle(
      color: dcolor,// Colors.grey[500],
      fontSize: 13
    ),
  );
}
// 组合头部（标题+说明）
Widget DataHead(Color tcolor,String code,String title,FontWeight TfontWeight,double Tsize,String desc,Color dcolor,Widget child){
  return Expanded(
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        code == ''?SizedBox(height: 1,):Code(tcolor,code,TfontWeight,Tsize),
        Title(tcolor,title,TfontWeight,Tsize),
        Desc(desc,dcolor),
        child
      ],
    ),
  );
}
// 单行左边图片
Widget ListHeadLeft(String imgpath,String tag,Color tagColor,Color tagtextColor){
  return Stack(
    alignment: AlignmentDirectional.center,//指定未定位或部分定位的子组件的对齐方式
    children: <Widget>[
      Container(
        padding: const EdgeInsets.fromLTRB(5, 5, 15, 5),
        child:
          imgpath.contains('http') ? Image.network(
            imgpath,
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          ): Image(
            image:imgpath=='' ? AssetImage('assets/images/maifeng.png') : AssetImage(imgpath),
            width: 100.0,
            height: 100.0,
            fit: BoxFit.cover,
          ),
      ),
      tag == ''?SizedBox(height: 0,):Positioned(
        top: 0,
        right: 5,
        child: Container(
          padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
          decoration: BoxDecoration(
            color: tagColor,
            borderRadius: BorderRadius.circular(5),
            // border: new Border(bottom:BorderSide(width: 1,color: Color(0xffe5e5e5)) ),
          ),
          child: Text(tag,style: TextStyle(color: tagtextColor,fontWeight: FontWeight.w600,fontSize: 12),),
        )
      ),
    ],
  );
}
// 单行右侧点击图标
Widget LineCheck(int id,Function onPressed){
  return Container(
    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
    child: ButtonCheck(onPressed), // PopupTap(onPressed: (){onPressed();},id: id,)// ButtonCheck(onPressed)
  );
}
Widget ButtonCheck(Function onPressed){
  return TextButton(
    // onPressed: () {MyToast.success2('$id');} ,
      onPressed: () {onPressed();},
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 53, 53, 53)),
        minimumSize: MaterialStateProperty.all(Size(10, 5)),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        // backgroundColor: MaterialStateProperty.all(Colors.grey),
      ),
      child: new Row(
        children: [
          new Icon(Icons.more_horiz,),
        ],
      )
  );
}
// 组合列表单行（图片+头部+按钮）
Widget OneListLine(
    Color tcolor,
    String code,
    String title,
    FontWeight TfontWeight,
    double Tsize,
    String desc,
    Color dcolor,
    String imgpath,
    int id,
    Function onPressed,
    Function onTap,
    Widget child,
    String tag,
    Color tagColor,
    Color tagtextColor
    ){
  return InkWell(
    onTap: () {onTap();},
    child:Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: new Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: BoxDecoration(
              border: new Border(bottom:BorderSide(width: 1,color: Color(0xffe5e5e5)) ),
            ),
            child:new Row(
              children: [
                ListHeadLeft(imgpath,tag,tagColor,tagtextColor),
                // DataHead('Title',FontWeight.bold,18,'The msg is the Desc !',Colors.black38),
                DataHead(tcolor,code,title,TfontWeight,Tsize,desc,dcolor,child),
                LineCheck(id,onPressed),
              ],
            )
        )
    ),);
}