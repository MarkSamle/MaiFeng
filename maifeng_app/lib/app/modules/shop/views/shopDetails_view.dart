import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../api/shop/shop_api.dart';
import '../../../../api/shop/shop_api.dart';
import '../../../../myunit/my_button.dart';
import '../../../../myunit/my_carousel.dart';
import '../../../../widgets/photo.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/shopDetails_controller.dart';
import '../controllers/shopDetails_controller.dart';
import '../controllers/shop_controller.dart';


class ShopDetailsView extends GetView<ShopDetailsController> {

  void checkDel(int id) async {
    bool isBack = false;
    Get.defaultDialog(
      title: '确认删除',
      titleStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.redAccent),
      radius: 0.0,
      barrierDismissible: false,
      content: Container(
          child: Text('删除后将不可恢复',style: TextStyle(color: Colors.redAccent),)
      ),
      cancel: TextButton(
        onPressed: () {
          Get.back();
          isBack = true;
          print('删除'+id.toString());
          ShopApi.delShopID(id);
          Get.back(result: true);
        },
        child: Text(
          '确认',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Color.fromARGB(255, 50, 50, 50),),
          onPressed: Get.back,//controller.turnBack,//
        ),

        title: Text('门店详情',
          style: TextStyle(
            color: Color.fromARGB(255, 50, 50, 50),
            fontWeight: FontWeight.w600,
          ),),
        backgroundColor: Color.fromARGB(255, 255, 255,255),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          decoration: BoxDecoration(
            color: Colors.grey[200],// 传入背景色
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          child: ListView(
            // padding: EdgeInsets.all(8.0),
            children: [
              MyCarousel(
                images: ShopDetailsController.shopData['results']['data'][0]['images'],
              ),
              SizedBox(height: 10,),
              Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: '  ${ShopDetailsController.shopData['results']['data'][0]['shoptype_name']} ',
                                    style: TextStyle(fontSize:10,color: Colors.white,
                                        backgroundColor: ShopDetailsController.shopData['results']['data'][0]['shoptype_name']=='新店'?Colors.redAccent:Colors.amber),
                                  ),
                                  TextSpan( text: '   ${ShopDetailsController.shopData['results']['data'][0]['code']} ',style: TextStyle(fontSize:13,color: Colors.black87),),
                                  TextSpan(
                                    text: ' ${ShopDetailsController.shopData['results']['data'][0]['name']}',
                                    style: TextStyle(fontSize:13,color: Colors.black87),
                                  ),
                                ]
                            )
                        ),
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(flex: 1,child:Text.rich(
                                TextSpan(
                                    children: [
                                      TextSpan( text: ' 负责人 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                      TextSpan( text: '  ${ShopDetailsController.shopData['results']['data'][0]['manage_name']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                    ]
                                )
                            ),
                            ),
                            Expanded(flex: 1,child:
                            GestureDetector(
                              child: Text.rich(
                                  TextSpan(
                                      children: [
                                        TextSpan( text: ' 联系方式 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                        TextSpan( text: '  ${ShopDetailsController.shopData['results']['data'][0]['manage_tel']}',style: TextStyle(fontSize:13,color: Colors.lightBlue),),
                                      ]
                                  )
                              ),
                              onTap: () {
                                launch('tel:'+ ShopDetailsController.shopData['results']['data'][0]['manage_tel'].toString());},
                                 // controller.tel(ShopDetailsController.shopData['results']['data'][0]['manage_tel'].toString());},
                            ),
                            // Text.rich(
                            //     TextSpan(
                            //         children: [
                            //           TextSpan( text: ' 联系方式 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                            //           TextSpan( text: '  ${ShopDetailsController.shopData['results']['data'][0]['manage_tel']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                            //         ]
                            //     )
                            // ),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      ),
                      Container(
                        child: Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan( text: ' 门店地址 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                  TextSpan( text: '  ${ShopDetailsController.shopData['results']['data'][0]['place']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                ]
                            )
                        ),
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      ),
                    ],
                  )
              ),
              Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        child: Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan( text: ' 经营区域 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                  TextSpan( text: '  ${ShopDetailsController.shopData['results']['data'][0]['largeregion_name']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                  TextSpan( text: ' |', style: TextStyle(fontSize:13,color: Colors.black26),),
                                  TextSpan( text: '  ${ShopDetailsController.shopData['results']['data'][0]['region_name']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                ]
                            )
                        ),
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(flex: 1,child:Text.rich(
                                TextSpan(
                                    children: [
                                      TextSpan( text: ' 门店平方 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                      TextSpan( text: '  ${ShopDetailsController.shopData['results']['data'][0]['square']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                    ]
                                )
                            ),
                            ),
                            Expanded(flex: 1,child:Text.rich(
                                TextSpan(
                                    children: [
                                      TextSpan( text: ' 规模等级 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                      TextSpan( text: '  ${ShopDetailsController.shopData['results']['data'][0]['size_name']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                    ]
                                )
                            ),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(flex: 1,child:Text.rich(
                                TextSpan(
                                    children: [
                                      TextSpan( text: ' 店群类型 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                      TextSpan( text: '  ${ShopDetailsController.shopData['results']['data'][0]['settype']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                    ]
                                )
                            ),
                            ),
                            // Expanded(flex: 1,child:Text.rich(
                            //     TextSpan(
                            //         children: [
                            //           TextSpan( text: ' 规模等级 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                            //           TextSpan( text: '  ${ShopDetailsController.shopData['results']['data'][0]['size_name']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                            //         ]
                            //     )
                            // ),
                            // ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      ),
                    ],
                  )
              ),
              Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan( text: ' 门店说明 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                  // TextSpan( text: '  ${ShopDetailsController.shopData['results']['data'][0]['desc']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                ]
                            )
                        ),
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                      ),
                      Container(
                        child: Text.rich(
                            TextSpan(
                                children: [
                                  // TextSpan( text: ' 门店说明 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                  TextSpan( text: '${ShopDetailsController.shopData['results']['data'][0]['desc']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                ]
                            )
                        ),
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      ),
                    ],
                  )
              ),
              Container(
                padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                alignment: Alignment.bottomRight,
                child:Text.rich(
                    TextSpan(
                        children: [
                          TextSpan( text: '${ShopDetailsController.shopData['results']['data'][0]['created_date']}', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                          TextSpan( text: ' - ', style: TextStyle(fontSize:13,color: Colors.black26),),
                          TextSpan( text: '${ShopDetailsController.shopData['results']['data'][0]['created_by_name']} 建档', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                          // TextSpan( text: '  ${ShopDetailsController.shopData['results']['data'][0]['desc']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                        ]
                    )
                ),
              ),
            ],
          )
      ),
      bottomNavigationBar: HomeController.isSuperUser || HomeController.permsItem.contains("shop.change_shop") ? new BottomAppBar(
        // notchMargin: 10.0,
        elevation: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 1,
                child: MyButton(
                    onTap: () {print('编辑ID为 ${ShopDetailsController.shopData['results']['data'][0]['id']} 的商品数据');},
                    text: '编辑',fontColor:Colors.white,
                    icon:Icons.edit_note,
                    backgroundColor:Colors.orangeAccent,
                    radius:0
                )
            ),
            Expanded(
                flex: 1,
                child: MyButton(
                    onTap: () {checkDel(ShopDetailsController.shopData['results']['data'][0]['id']);},
                    text: '删除',fontColor:Colors.white,
                    icon:Icons.delete_forever_outlined,
                    backgroundColor:Colors.redAccent,
                    radius:0
                )
            ),
          ],
        ),
      ):null,
    );
  }

}