import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

import 'my_wares_list.dart';
// 列表聚合上拉加载下拉刷新

class MyListView extends StatefulWidget {
  // 传入参数
  const MyListView({
    Key? key,
    required this.DataForm,// 数据列表[{},{}……]
    this.FrontHeight: 50.0, // 前置高度，避开搜索栏
    required this.pullup, // 上拉回调函数
    required this.dropdown,// 下拉回调函数
    required this.onPressed,// 点击回调函数
    required this.onTap,// 点击回调函数
  }) : super(key: key,);
  final List DataForm;
  final double FrontHeight;
  final ValueChanged<Map> onPressed;
  final ValueChanged<int> onTap;
  final VoidCallback pullup;//ValueChanged pullup;//
  final VoidCallback dropdown;//ValueChanged dropdown;//
  @override
  State<StatefulWidget> createState() => MyListViewState();
}

// 构建
class MyListViewState extends State<MyListView> {
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
    // setState((){widget.dropdown();});
    setState((){});
    // setState((){Navigator.of(context).pop(this);});
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
      theList.add(MyWaresList(
        title:item['title'],
        code:item['code'],
        color: Colors.black,
        TfontWeight:FontWeight.w500,// FontWeight.bold,18,
        Tsize:18,
        desc:item['descshow'],// 'The msg is the Desc !',
        dcolor:Colors.black38,// Colors.black38,
        imgpath:item['imgpath'],
        id:item['id'],
        onPressed:(){widget.onPressed(item);},// (){MyToast.success2(item['id'].toString());},
        onTap:(){widget.onTap(item['id']);},
        child:SizedBox(height: 1,)// onTap: (){MyToast.success2('点击' + item['id'].toString());},
      ));
    }
    theList.add(SizedBox(height: 50,));
    return theList;
  }

  Future<Null> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));// 强制休眠 1 秒
    setState(() {widget.dropdown();});
    // setState(() {_DataRestart();});
    //模拟网络请求
    // await Future.delayed(Duration(milliseconds: 2000));
    //结束刷新
    // return Future.value(true);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // if(widget.DataForm == null || widget.DataForm == [] || widget.DataForm.length == 0 ){
    //   return CircularProgressIndicator();
    // }else{
    //   return RefreshIndicator(
    //     color: Colors.blue,//圆圈进度颜色
    //     displacement: 44.0,//下拉停止的距离
    //     backgroundColor: Colors.grey[200],//背景颜色
    //     onRefresh: _onRefresh,
    //     child: ListView(
    //       controller: _controller,
    //       children: _MakeList(),
    //     ),
    //   );
    // }

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
  Widget _createPage(BuildContext context, AsyncSnapshot snapshot) {
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

  Future _getData() async {
    widget.dropdown();
    return widget.dropdown();
  }

}