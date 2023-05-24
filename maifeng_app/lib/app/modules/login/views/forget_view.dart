import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/forget_controller.dart';
// ForgetView页面
class ForgetView extends GetView<ForgetController> {
  @override
  Widget build(BuildContext context) {
    // // TODO: implement build
    // throw UnimplementedError();
    // print('***********是否是平板*************');
    bool isPad = context.isTablet;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 50, 50, 50),),
          onPressed: Get.back,//controller.turnLogin,
        ),
        title: Text('密码找回',
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
                        padding: EdgeInsets.all(16.0),
                        child: Form(
                            autovalidateMode: AutovalidateMode.disabled,
                            key: controller.forgetKey,
                            child: Column(
                                children: <Widget>[
                                  // 电话号码输入框
                                  Container(
                                    padding: EdgeInsets.fromLTRB(13, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(15)),
                                      color: Color(0xFFF2F3F7),
                                    ),
                                    child: TextFormField(
                                      autovalidateMode: AutovalidateMode.disabled,
                                      controller: controller.telephone,
                                      style: TextStyle(fontSize: 16.0),
                                      maxLength: 16,
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.phone, color: Color.fromARGB(255, 0, 162, 255)),
                                        hintText: '请输入电话号码',
                                        border: InputBorder.none,
                                        counter: SizedBox(),
                                      ),
                                      validator: (value) {
                                        return value!.trim().isNotEmpty ? null : "电话号码不能为空";
                                      },
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  // 验证码
                                  Container(
                                    height: 60.0,
                                    child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              padding: EdgeInsets.fromLTRB(13, 0, 10, 0),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF2F3F7),
                                                borderRadius: BorderRadius.all(Radius.circular(15),),
                                              ),
                                              child: TextFormField(
                                                autovalidateMode: AutovalidateMode.disabled,
                                                controller: controller.code,
                                                style: TextStyle(fontSize: 16.0),
                                                maxLength: 10,
                                                decoration: InputDecoration(
                                                  icon: Icon(Icons.vpn_key,
                                                      color: Color.fromARGB(255, 0, 162, 255)),
                                                  hintText: '验证码',
                                                  border: InputBorder.none,
                                                  counter: SizedBox(),
                                                ),
                                                validator: (value) {
                                                  return value!.trim().isNotEmpty
                                                      ? null
                                                      : "验证码不能为空";
                                                },
                                                keyboardType: TextInputType.numberWithOptions(
                                                    decimal: true),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5.0),
                                          Expanded(
                                            flex: 1,
                                            child:Container(
                                              height: 55.0,
                                              child: ElevatedButton(
                                                // onPressed: controller.rcodeRequest,// 绑定控制层函数
                                                onPressed: controller.gettext=="获取验证码"?controller.rcodeRequest:null,
                                                child: Text(
                                                  controller.gettext,
                                                  style: TextStyle(
                                                    fontSize: 20.0,
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

                                        ]
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  // 密码输入框
                                  Container(
                                      padding: EdgeInsets.fromLTRB(13, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF2F3F7),
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                      ),
                                      child: GetBuilder<ForgetController>(
                                        id: 'isShowPassWord',
                                        init: controller,
                                        builder: (_) => TextFormField(
                                          autovalidateMode: AutovalidateMode.disabled,
                                          controller: controller.password,
                                          style: TextStyle(fontSize: 16.0),
                                          maxLength: 16,
                                          decoration: InputDecoration(
                                            icon: Icon(Icons.lock, color: Color.fromARGB(255, 0, 162, 255)),
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
                                  SizedBox(height: size.height * 0.01),
                                  // 注册按钮
                                  Container(
                                    height: 45.0,
                                    margin: EdgeInsets.only(top: 20.0),
                                    child: SizedBox.expand(
                                      child: ElevatedButton(
                                        onPressed: controller.forgetRequest,// 绑定控制层函数
                                        child: Text(
                                          '修改密码',
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
                                ]
                            )
                        )
                    )
                  ]
              )
          )
      )
      ),
    );
  }

}