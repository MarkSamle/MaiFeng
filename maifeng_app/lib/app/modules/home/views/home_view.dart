import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:maifeng_app/app/modules/board/views/board_view.dart';
import 'package:maifeng_app/app/modules/user/views/user_view.dart';
// import 'package:maifeng_app/app/modules/message/views/message_view.dart';
import 'package:maifeng_app/app/modules/workbench/views/workbench_view.dart';
import '../controllers/home_controller.dart';
// import 'package:url_launcher_web/url_launcher_web.dart';
import 'package:url_launcher/url_launcher.dart';
class HomeView extends GetView<HomeController> {
  // 底部导航项目
  late final List<BottomNavigationBarItem> bottomTabs = [
    // BottomNavigationBarItem(
    //   icon: Icon(Icons.home),
    //   activeIcon: Icon(Icons.home),
    //   label: '首页',
    // ),
    BottomNavigationBarItem(
      icon: Icon(Icons.widgets),
      activeIcon: Icon(Icons.widgets),
      label: '工作台',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.assessment),
      activeIcon: Icon(Icons.assessment),
      label: '看板',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      activeIcon: Icon(Icons.person),
      label: '我的',
    ),
  ];

  // 底部导航
  Widget _getBottomNavigationBar() {
    return GetBuilder(
      init: controller,
      builder: (_) => BottomNavigationBar(
        items: bottomTabs,
        currentIndex: HomeController.currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => controller.handleNavBarTap(index),
        selectedItemColor: Color.fromARGB(255, 0, 137, 253),
        unselectedItemColor: Color(0xFF191A1E),
      ),
    );
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        WorkbenchView(),
        BoardView(),
        UserView(),
      ],
      controller: controller.pageController,
      onPageChanged: (index) => controller.handleNavBarTap(index),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isPad = context.isTablet;
    return Scaffold(
      bottomNavigationBar: _getBottomNavigationBar(),
      // body: _buildPageView(),
      body: GetBuilder<HomeController>(
        init: controller,
        builder: (_) {
          if (controller.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            controller.addWatermark(context, isPad);
            return _buildPageView();
          }
        },
      ),
    );
  }
}
