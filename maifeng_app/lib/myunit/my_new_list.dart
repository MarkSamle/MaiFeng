import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_list_element.dart';
import 'my_wares_list.dart';
// 列表聚合上拉加载下拉刷新

class MyNewListView extends StatefulWidget {
  // 传入参数
  const MyNewListView({
    Key? key,
    required this.DataForm,// 数据列表[{},{}……]
    this.FrontHeight: 50.0, // 前置高度，避开搜索栏
    required this.pullup, // 上拉回调函数
    required this.dropdown,// 下拉回调函数
    required this.onPressed,// 点击回调函数
    required this.onTap,// 点击回调函数
    this.title:'title',
    this.code:'',
    this.desc: 'descshow',
    this.imgpath:'imgpath',
    this.itemid: 'id',
    this.tag:'shoptype_name',
    // "place" "square" "manage_name"
    this.title1:'位置',
    this.desc1:'place',
    this.title2:'店平方',
    this.desc2:'square',
    this.title3:'负责人',
    this.desc3:'manage_name',
  }) : super(key: key,);
  final List DataForm;
  final double FrontHeight;
  final ValueChanged<Map> onPressed;
  final ValueChanged<int> onTap;
  final VoidCallback pullup;//ValueChanged pullup;//
  final VoidCallback dropdown;//ValueChanged dropdown;//
  final String title;
  final String code;
  final String desc;
  final String imgpath;
  final String itemid;
  final String tag;
  final String title1;
  final String title2;
  final String title3;
  final String desc1;
  final String desc2;
  final String desc3;

  @override
  State<StatefulWidget> createState() => MyNewListViewState();
}

// 构建
class MyNewListViewState extends State<MyNewListView> {
  // 上拉加载回调函数
  ScrollController _controller = new ScrollController();
  // 上拉加载更多
  _loadMore() async {
    /// 强制休眠 1 秒
    await Future.delayed(Duration(seconds: 1));
    /// 放入到集合中
    setState(() {widget.pullup();});
    setState((){});
    // setState(() {_DataRestart();});
  }

  @override
  void initState() {
    /// 为滚动控制器添加监听
    _controller.addListener(() {
      var maxScroll = _controller.position.maxScrollExtent;
      var pixel = _controller.position.pixels;

      // 在加载的时候锁死
      if (_controller.position.pixels ==
          _controller.position.maxScrollExtent) {
        /// 触发上拉加载更多机制
        _loadMore();
      }
    });
    setState((){});
    super.initState();
  }
  @override
  void dispose() {
    // 销毁 滚动控制器 ScrollController
    _controller.dispose();
    super.dispose();
  }

  _MakeList() {
    List<Widget> theList = [];
    theList = [
      SizedBox(height: widget.FrontHeight,),// 前置高度
    ];
    for(var item in widget.DataForm) {
      theList.add(MyListElement(
        title:item[widget.title],
        code:widget.code==''?'':item[widget.code],
        color: Colors.black,
        TfontWeight:FontWeight.w500,// FontWeight.bold,18,
        Tsize:18,
        desc:item[widget.desc],// 'The msg is the Desc !',
        dcolor:Colors.black38,// Colors.black38,
        imgpath:item[widget.imgpath]==''?'http://127.0.0.1:8000/media/imgs/2022_03/shops.png':item[widget.imgpath],
        id:item[widget.itemid],
        onPressed:(){widget.onPressed(item);},// (){MyToast.success2(item['id'].toString());},
        onTap:(){widget.onTap(item[widget.itemid]);},// onTap: (){MyToast.success2('点击' + item['id'].toString());},
        tag: item[widget.tag],
        tagColor: item[widget.tag]=='新店'?Colors.redAccent:Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5,),
            Container(
              child: Text.rich(
                  TextSpan(
                      children: [
                        TextSpan( text: ' '+ widget.title1 +' ',style: TextStyle(fontSize:10,color: Color.fromARGB(255,255,97,0),backgroundColor: Color.fromARGB(255,255,226,209)),),
                        TextSpan( text: ' '+ item[widget.desc1] +'',style: TextStyle(fontSize:10,color: Colors.black87),),
                      ]
                  )
              ),
              // padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            ),
            SizedBox(height: 5,),
            Container(
              child: Text.rich(
                  TextSpan(
                      children: [
                        TextSpan( text: ' '+ widget.title2 +' ',style: TextStyle(fontSize:10,color: Color.fromARGB(255,4,100,240),backgroundColor: Color.fromARGB(255,218,240,255)),),
                        TextSpan( text: ' '+ item[widget.desc2] +' ',style: TextStyle(fontSize:10,color: Colors.black87),),
                        TextSpan( text: ' | ', style: TextStyle(fontSize:10,color: Colors.black26),),
                        TextSpan( text: ' '+ widget.title3 +' ',style: TextStyle(fontSize:10,color: Color.fromARGB(255,0,177,40),backgroundColor: Color.fromARGB(255,231,255,231)),),
                        TextSpan( text: ' '+ item[widget.desc3] +' ',style: TextStyle(fontSize:10,color: Colors.black87),),
                      ]
                  )
              ),
              // padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
            ),
            SizedBox(height: 5,),
          ],
        )

        // SizedBox(height: 1,)// "place" "square" "manage_name"
      ));
    }
    theList.add(SizedBox(height: 50,));
    return theList;
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));// 强制休眠 1 秒
    setState(() {widget.dropdown();});
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      color: Colors.blue,//圆圈进度颜色
      displacement: 44.0,//下拉停止的距离
      backgroundColor: Colors.grey[200],//背景颜色
      onRefresh: _onRefresh,
      child: ListView(
        controller: _controller,
        children: _MakeList(),
      ),
    );
  }

}