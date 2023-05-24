import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maifeng_app/store/login_store.dart';

/// 应用入口图标组件
class AppItem extends StatelessWidget {
  final String url;
  final String name;
  final String path;

  const AppItem({Key? key, this.url = '', this.name = '', this.path = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        String token = await LoginStore().getToken();
        Get.toNamed(path, arguments: token);
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // 设置圆角
              child: Image.network(
                url,
                height: 50,
                width: 50,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(name)
          ],
        ),
      ),
    );
  }
}
