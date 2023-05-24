import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginView extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    // print('***********是否是平板*************');
    bool isPad = context.isTablet;
    Size size = MediaQuery.of(context).size;
    const colorizeColors = [
      // Colors.purple,
      Colors.blue,
      Colors.black,
      Colors.white,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 45.0,
      fontFamily: 'Horizon',
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('登录',
          style: TextStyle(
            color: Color.fromARGB(255, 50, 50, 50),
            fontWeight: FontWeight.w600,
          ),),
        backgroundColor: Color.fromARGB(255, 255, 255,255),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: Container(
            width: size.width * (isPad ? 0.7 : 0.93),
            height: size.height * 1,
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: size.height * 0.12, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                           ColorizeAnimatedText(
                             '脉蜂系统',
                              textStyle: colorizeTextStyle,
                              colors: colorizeColors,
                             ),
                        ]
                      )
                      // Text(
                      //   '脉蜂系统',
                      //   style: TextStyle(
                      //     color: Color.fromARGB(255, 0, 162, 255),
                      //     fontSize: 45.0,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Form(
                    autovalidateMode: AutovalidateMode.disabled,
                    key: controller.loginKey,
                    child: Column(
                      children: <Widget>[
                        // 账号输入框
                        Container(
                          padding: EdgeInsets.fromLTRB(13, 0, 10, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color(0xFFF2F3F7),
                          ),
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.disabled,
                            controller: controller.username,
                            style: TextStyle(fontSize: 20.0),
                            maxLength: 16,
                            decoration: InputDecoration(
                              icon: Icon(Icons.person, color: Colors.black),
                              hintText: '请输入账号',
                              border: InputBorder.none,
                              counter: SizedBox(),
                            ),
                            validator: (value) {
                              return value!.trim().isNotEmpty ? null : "账号不能为空";
                            },
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        // 密码输入框
                        Container(
                            padding: EdgeInsets.fromLTRB(13, 0, 10, 0),
                            decoration: BoxDecoration(
                              color: Color(0xFFF2F3F7),
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: GetBuilder<LoginController>(
                              id: 'isShowPassWord',
                              init: controller,
                              builder: (_) => TextFormField(
                                autovalidateMode: AutovalidateMode.disabled,
                                controller: controller.password,
                                style: TextStyle(fontSize: 20.0),
                                maxLength: 16,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.lock, color: Colors.black),
                                  hintText: '请输入密码',
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      controller.isShowPassWord
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black54,
                                    ),
                                    onPressed: controller.showPassWord,
                                  ),
                                  counter: SizedBox(),
                                ),
                                obscureText: !controller.isShowPassWord,
                                validator: (value) {
                                  return value!.trim().isNotEmpty
                                      ? null
                                      : "密码不能为空";
                                },
                              ),
                            )),
                        SizedBox(height: size.height * 0.03),
                        // 验证码
                        // Container(
                        //   height: 60.0,
                        //   child: Row(
                        //     children: [
                        //       Expanded(
                        //         flex: 1,
                        //         child: Container(
                        //           padding: EdgeInsets.fromLTRB(13, 0, 10, 0),
                        //           decoration: BoxDecoration(
                        //             color: Color(0xFFF2F3F7),
                        //             // borderRadius: BorderRadius.all(Radius.circular(10),),
                        //           ),
                        //           child: TextFormField(
                        //             autovalidateMode: AutovalidateMode.disabled,
                        //             controller: controller.code,
                        //             style: TextStyle(fontSize: 16.0),
                        //             maxLength: 10,
                        //             decoration: InputDecoration(
                        //               icon: Icon(Icons.vpn_key,
                        //                   color: Colors.black),
                        //               hintText: '验证码',
                        //               border: InputBorder.none,
                        //               counter: SizedBox(),
                        //             ),
                        //             validator: (value) {
                        //               return value!.trim().isNotEmpty
                        //                   ? null
                        //                   : "验证码不能为空";
                        //             },
                        //             keyboardType: TextInputType.numberWithOptions(
                        //                 decimal: true),
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(width: 5.0),
                        //       Expanded(
                        //         flex: 1,
                        //         child: InkWell(
                        //           onTap: () {
                        //             controller.getCode();
                        //           },
                        //           child: GetBuilder<LoginController>(
                        //             id: 'codeImage',
                        //             init: controller,
                        //             builder: (_) => controller.isShowCode
                        //                 ? Image.memory(
                        //                     controller.bytes,
                        //                     fit: BoxFit.contain,
                        //                   )
                        //                 : SizedBox(
                        //                     child: Center(
                        //                       child: Text(
                        //                         '点击获取验证码',
                        //                         style: TextStyle(
                        //                           color: Colors.blue,
                        //                           fontSize: 18,
                        //                         ),
                        //                       ),
                        //                     ),
                        //                   ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // 登录按钮
                        Container(
                          height: 45.0,
                          margin: EdgeInsets.only(top: 20.0),
                          child: SizedBox.expand(
                            child: ElevatedButton(
                              onPressed: controller.handleLogin,// 绑定控制层函数
                              child: Text(
                                '登录',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // 底部文字按钮
                        Container(
                          margin: EdgeInsets.only(top: 30.0),
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              TextButton(
                                  onPressed: controller.turnRegister,
                                  child: Text(
                                    '注册账号',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Color.fromARGB(255, 53, 53, 53),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                              ),
                              TextButton(
                                onPressed:  controller.turnForget,
                                child: Text(
                                  '忘记密码？',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Color.fromARGB(255, 53, 53, 53),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
