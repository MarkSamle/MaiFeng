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
//     theList.add(MyWaresList(
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

class MyWaresList extends StatefulWidget {
  // 传入参数
  const MyWaresList({
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
    required this.child,

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
  final Color dcolor;
  // 图片
  final String imgpath;
  final VoidCallback onPressed;
  final VoidCallback onTap;
  final Widget child;
  @override
  State<StatefulWidget> createState() => MyWaresListState();
}

class MyWaresListState extends State<MyWaresList> {
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
        widget.child
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
Widget ListHeadLeft(String imgpath){
  return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
      child:
      imgpath.contains('http') ? Image.network(
        imgpath,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ): Image(
        image:imgpath=='' ? AssetImage('assets/images/maifeng.png') : AssetImage(imgpath),
        width: 50.0,
        height: 50.0,
        fit: BoxFit.cover,
      ),
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
Widget OneListLine(Color tcolor,String code,String title,FontWeight TfontWeight,double Tsize,String desc,Color dcolor,String imgpath,int id,Function onPressed,Function onTap,Widget child){
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
              ListHeadLeft(imgpath),
              // DataHead('Title',FontWeight.bold,18,'The msg is the Desc !',Colors.black38),
              DataHead(tcolor,code,title,TfontWeight,Tsize,desc,dcolor,child),
              LineCheck(id,onPressed),
            ],
          )
      )
  ),);
}

class PopupTap extends StatefulWidget {
  const PopupTap({
    Key? key,
    required this.onPressed,
    required this.id,
  }) : super(key: key,);
  //  说明参数 使用参数widget.id
  final VoidCallback onPressed;
  final int id;
  
  @override
  _PopupTapTapState createState() => _PopupTapTapState();
}
class _PopupTapTapState extends State<PopupTap> with WidgetsBindingObserver {
  void _onAfterRendering(Duration timeStamp) {
    RenderObject? renderObject = context.findRenderObject(); //获取元素大小
    Size? size = renderObject?.paintBounds.size; //获取元素位置
    var vector3 = renderObject?.getTransformTo(null)?.getTranslation();
    // MyToast.success2(vector3.toString());
    print(vector3![1]);
    Navigator.push(
      context,
      new PopRoute(
        child: new Popup(
          btnContext: context,
          onClick: (v) => debugPrint('${widget.id}: 你点击了$v'), right: vector3[0], top: vector3[1], // 传到外面来的回调事件
        ),
      ),
    );
    // showbox(context,vector3[1],vector3[0]);
  }

  @override
  Widget build(BuildContext context) {

    RenderObject? renderObject = context.findRenderObject(); //获取元素大小
    Size? size = renderObject?.paintBounds.size; //获取元素位置
    var vector3 = renderObject?.getTransformTo(null).getTranslation();
    return GestureDetector(
      child: ButtonCheck((){}),
      onTapDown: (TapDownDetails details) {
        WidgetsBinding.instance?.addPostFrameCallback(_onAfterRendering);
        setState(() {});
      },
    );
  }
}
class PopRoute extends PopupRoute {
  // push的耗时，milliseconds为毫秒
  final Duration _duration = Duration(milliseconds: 300);

  // 接收一个child，也就是我们push的内容。
  Widget child;

  // 构造方法
  PopRoute({required this.child});

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}
// 类型声明回调
typedef OnItem = Function(String value);
class Popup extends StatefulWidget {
  final BuildContext btnContext;
  final OnItem onClick; //点击child事件
  final double top;
  final double right;
  Popup({required this.btnContext, required this.onClick,required this.top,required this.right});

  PopupState createState() => PopupState();
}
class PopupState extends State<Popup> {
  // 声明对象
  RenderBox? button;
  RenderBox? overlay;
  RelativeRect? position;

  @override
  void initState() {
    super.initState();
    // 找到并渲染对象button
    button = widget.btnContext.findRenderObject() as RenderBox?;
    // 找到并渲染对象overlay
    overlay = Overlay.of(widget.btnContext)?.context.findRenderObject() as RenderBox?;
  }


  // item构建
  Widget itemBuild(item) {
    // 字体样式
    TextStyle labelStyle = TextStyle(color: Colors.white);
    return new Expanded(
      child: new TextButton(
        //点击Item
        onPressed: () {
          // 如果没接收也返回的花就会报错，所以这里需要判断
          if (widget.onClick != null) {
            Navigator.of(context).pop();
            widget.onClick(item); // 事件返回String类型的值
          }
        },
        child: new Text(item, style: labelStyle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      type: MaterialType.transparency, // Material类型设置
      child: new GestureDetector(
        child: new Stack(
          children: <Widget>[
            new Container(
              // 设置一个容器组件，是整屏幕的。
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent, // 它的颜色为透明色
            ),
            new Positioned(
              child: new Container(
                width: 200,
                height: 36,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(75, 75, 75, 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)), // 圆角
                ),
                child: new Row(children: ['点赞', '评论'].map(itemBuild).toList()),
              ),
              top: widget.top+40, // 顶部位置
              right: 30,
              // left: widget.right-100, // 右边位置
            )
          ],
        ),
        onTap: () => Navigator.of(context).pop(), //点击空白处直接返回
      ),
    );
  }
}