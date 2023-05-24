# maifeng_app
## Flutter文档
+ [Flutter中文网](https://flutterchina.club/setup-windows/) `https://flutterchina.club/setup-windows/`
## Get插件
### Add Get to your pubspec.yaml file:
```
dependencies:
    get:
```
### Import get in files that it will be used:
```
import 'package:get/get.dart';
```
## 记录
### 页面说明
+ `modules/xxxx/views/xxxx_view.dart` 视图层写界面
+ `modules/xxxx/views/xxxx_controller.dart` 控制层写方法
+ `modules/xxxx/views/xxxx_binding.dart` 绑定层写绑定页面
+ `lib/api/xxxx/xxxx_api.dart` api封装请求方法
+ `lib/app/routes/app_routes.dart` 注册页面
+ `lib/app/routes/app_pages.dart` 生效页面
### 说明
#### GetX - GetxController 生命周期
```
@override
void onInit() {
    super.onInit();
}
@override
void onReady() {
    super.onReady();
}
@override
void onClose() {
    super.onClose();
}
```
#### 空安全报错
```
Error: Cannot run with sound null safety, because the following dependencies
```

```
flutter run --no-sound-null-safety
```

#### 打包

```
flutter build apk --no-sound-null-safety
```

## 文件结构
~~~
maifeng_app
    ├──lib
    │   └──api                                                            # 接口
    │   │    └──home                                                      # 首页接口
    │   │    └──login                                                     # 登录接口
    │   │    └──workbench                                                 # 工作台接口
    │   │    └──board                                                     # 看板接口
    │   │    └──user                                                      # 用户接口
    │   └──app                                                       
    │   │    └──modules                                                   # 页面
    │   │    │    └──login
    │   │    │    │    └──views
    │   │    │    │    │    └──login_view.dart                            # 登录界面
    │   │    │    │    │    └──register_view.dart                         # 注册界面
    │   │    │    │    │    └──forget_view.dart                           # 忘记密码
    │   │    │    │    └──controllers
    │   │    │    │    │    └──login_controller.dart                      # 登录控制层
    │   │    │    │    │    └──register_controller.dart                   # 注册控制层
    │   │    │    │    │    └──forget_controller.dart                     # 忘记控制层
    │   │    │    │    └──bindings
    │   │    │    │         └──login_binding.dart                         # 登录绑定层
    │   │    │    │         └──register_binding.dart                      # 注册绑定层
    │   │    │    │         └──forget_binding.dart                        # 忘记绑定层
    │   │    │    └──home
    │   │    │    │    └──views
    │   │    │    │    │    └──home_view.dart                             # 首页界面
    │   │    │    │    └──controllers
    │   │    │    │    │    └──home_controller.dart                       # 首页控制层
    │   │    │    │    └──bindings
    │   │    │    │         └──home_binding.dart                          # 首页绑定层
    │   │    │    └──workbench
    │   │    │    │    └──views
    │   │    │    │    │    └──workbench_view.dart                        # 工作台界面
    │   │    │    │    └──controllers
    │   │    │    │    │    └──workbench_controller.dart                  # 工作台控制层
    │   │    │    │    └──bindings
    │   │    │    │         └──workbench_binding.dart                     # 工作台绑定层
    │   │    │    └──board
    │   │    │    │    └──views
    │   │    │    │    │    └──board_view.dart                            # 看板界面
    │   │    │    │    └──controllers
    │   │    │    │    │    └──board_controller.dart                      # 看板控制层
    │   │    │    │    └──bindings
    │   │    │    │    │    └──board_binding.dart                         # 看板绑定层
    │   │    │    │    └──chart                                           # 图表插件Demo
    │   │    │    └──user
    │   │    │    │    └──views
    │   │    │    │    │    └──user_view.dart                             # 用户界面
    │   │    │    │    └──controllers
    │   │    │    │    │    └──user_controller.dart                       # 用户控制层
    │   │    │    │    └──bindings
    │   │    │    │         └──user_binding.dart                          # 用户绑定层
    │   │    │    └──wares
    │   │    │    │    └──views
    │   │    │    │    │    └──wares_view.dart                            # 商品查询界面
    │   │    │    │    │    └──waresDetails_view.dart                     # 商品详情界面
    │   │    │    │    │    └──sku_view.dart                              # 色码列表界面
    │   │    │    │    │    └──skuDetails_view.dart                       # 色码详情界面
    │   │    │    │    └──controllers
    │   │    │    │    │    └──wares_controller.dart                      # 商品查询控制层
    │   │    │    │    │    └──waresDetails_controller.dart               # 商品详情控制层
    │   │    │    │    │    └──sku_controller.dart                        # 色码列表控制层
    │   │    │    │    │    └──skuDetails_controller.dart                 # 色码详情控制层
    │   │    │    │    └──bindings
    │   │    │    │         └──wares_binding.dart                         # 商品查询绑定层
    │   │    │    │         └──waresDetails_binding.dart                  # 商品详情绑定层
    │   │    │    │         └──sku_binding.dart                           # 色码列表绑定层
    │   │    │    │         └──skuDetails_binding.dart                    # 色码详情绑定层
    │   │    │    └──shop
    │   │    │    │    └──views
    │   │    │    │    │    └──shop_view.dart                             # 门店列表界面
    │   │    │    │    └──controllers
    │   │    │    │    │    └──shop_controller.dart                       # 门店列表控制层
    │   │    │    │    └──bindings
    │   │    │    │         └──shop_binding.dart                          # 门店列表绑定层
    │   │    │    └──fromqr【废弃】
    │   │    │    │    └──views
    │   │    │    │    │    └──qruser_view.dart                           # 扫码跳转用户界面
    │   │    │    │    │    └──qrwares_view.dart                          # 扫码跳转商品查询界面
    │   │    │    │    └──controllers
    │   │    │    │    │    └──qruser_controller.dart                     # 扫码跳转用户控制层
    │   │    │    │    │    └──qrwares_controller.dart                    # 扫码跳转商品查询控制层
    │   │    │    │    └──bindings
    │   │    │    │         └──qruser_binding.dart                        # 扫码跳转用户绑定层
    │   │    │    │         └──qrwares_binding.dart                       # 扫码跳转商品查询绑定层
    │   │    │    └──user
    │   │    │    │    └──views
    │   │    │    │    │    └──user_view.dart                             # 用户界面
    │   │    │    │    └──controllers
    │   │    │    │    │    └──user_controller.dart                       # 用户控制层
    │   │    │    │    └──bindings
    │   │    │    │         └──user_binding.dart                          # 用户绑定层
    │   │    └──routes                                                    # 路由配置
    │   │    │    └──app_pages.dart                                       # 注册页面
    │   │    │    └──app_routes.dart                                      # 注册路由
    │   └──config                                                           
    │   │    └──config.dart                                               # 后端接口配置
    │   └──store                                                          # 缓存
    │   │    └──login_store.dart                                          # 登录缓存数据
    │   │    └──user_data.dart                                            # 用户缓存数据
    │   │    └──wares_store.dart                                          # 商品缓存数据
    │   └──util                                                           # 工具
    │   │    └──my_http.dart                                              # http请求工具
    │   │    └──my_message_hint.dart                                      # 消息工具
    │   │    └──my_toast.dart                                             # 弹框工具
    │   └──myunit                                                         # 自封装组件
    │   └──widgets                                                        # 页面样式
    │   │    └──watermark.dart                                            # 页面样式
    │   │    └──setting_item.dart                                         # 页面样式
    │   │    └──message_item.dart                                         # 页面样式
    │   │    └──full_width_button.dart                                    # 页面样式
    │   │    └──app_item.dart                                             # 页面样式
    │   │    └──                                                          # 页面样式
    │   └──main.dart                                                      # 程序入口文件
    ├──pubspec.yaml                                                       # 依赖配置文件
~~~


