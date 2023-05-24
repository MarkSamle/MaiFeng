import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../../api/wares/wares_api.dart';
import '../../../../myunit/my_button.dart';
import '../../../../myunit/my_carousel.dart';
import '../../../../widgets/photo.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/skuDetails_controller.dart';
import '../controllers/waresDetails_controller.dart';
import '../controllers/wares_controller.dart';


class SkuDetailsView extends GetView<SkuDetailsController> {

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
          WraesApi.delSkuID(id);
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

          title: Text('色码详情',
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
                images: SkuDetailsController.skuData['results']['data'][0]['images'],
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
                                    text: ' 色码名称 ',
                                    style: TextStyle(fontSize:10,color: Colors.white,backgroundColor: Colors.brown),
                                  ),
                                  TextSpan(
                                    text: '  ${SkuDetailsController.skuData['results']['data'][0]['title']}',
                                    style: TextStyle(fontSize:13,color: Colors.black87),
                                  ),
                                ]
                            )
                        ),
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                      ),
                      Container(
                        child: Text.rich(
                            TextSpan(
                                children: [
                                  TextSpan(
                                    text: ' 商品定价 ',
                                    style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),
                                  ),
                                ]
                            )
                        ),
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(flex: 1,child:Text.rich(
                                TextSpan(
                                    children: [
                                      TextSpan( text: ' ￥',style: TextStyle(fontSize:10,color: Colors.black87),),
                                      TextSpan( text: ' ${SkuDetailsController.skuData['results']['data'][0]['fix']}',style: TextStyle(fontSize:26,color: Colors.deepOrange),),
                                      // TextSpan( text: ' 起', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                    ]
                                )
                            ),
                            ),
                            Expanded(flex: 1,child:Text.rich(
                                TextSpan(
                                    children: [
                                      TextSpan( text: ' 商品进价 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                      TextSpan( text: '￥  ${SkuDetailsController.skuData['results']['data'][0]['bid']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                      // TextSpan( text: ' 起', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                    ]
                                )
                            ),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 8),
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
                                TextSpan( text: ' 商品色号 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['code']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                              ]
                          )
                      ),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    ),
                    Container(
                      child: Text.rich(
                          TextSpan(
                              children: [
                                TextSpan( text: ' 商品层级 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['merchset']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                TextSpan( text: ' |', style: TextStyle(fontSize:13,color: Colors.black26),),
                                TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['typeset']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                TextSpan( text: ' |', style: TextStyle(fontSize:13,color: Colors.black26),),
                                TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['merchtype']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                TextSpan( text: ' |', style: TextStyle(fontSize:13,color: Colors.black26),),
                                TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['merchtypechild_name']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                              ]
                          )
                      ),
                      padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                    ),
                  ],
                )
              ),
              // Card(
              //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //     color: Colors.white,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Container(
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text.rich(
              //                   TextSpan(
              //                       children: [
              //                         TextSpan( text: ' 商品色码 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
              //                         TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['sku_num']} 款SKU',style: TextStyle(fontSize:13,color: Colors.black87),),
              //                       ]
              //                   )
              //               ),
              //               GestureDetector(
              //                 child: Text.rich(
              //                     TextSpan(
              //                         children: [
              //                           TextSpan( text: ' 查看明细 ', style: TextStyle(fontSize:10,color: Colors.lightBlue,fontWeight: FontWeight.w500),),
              //                           TextSpan( text: ' >',style: TextStyle(fontSize:13,color: Colors.lightBlue),),
              //                         ]
              //                     )
              //                 ),
              //                 onTap: (){
              //                   SkuDetailsController.toPage(SkuDetailsController.skuData['results']['data'][0]['id'].toString());
              //                   print('跳转ID为 ${SkuDetailsController.skuData['results']['data'][0]['id']} 的色码列表');},
              //               ),
              //             ],
              //           ),
              //           padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              //         ),
              //       ],
              //     )
              // ),
              // Card(
              //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //     color: Colors.white,
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Container(
              //           child: Row(
              //             children: [
              //               Expanded(flex: 1,child:Text.rich(
              //                   TextSpan(
              //                       children: [
              //                         TextSpan( text: ' 商品质地 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
              //                         TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['quality']}',style: TextStyle(fontSize:13,color: Colors.black87),),
              //                       ]
              //                   )
              //               ),
              //               ),
              //               Expanded(flex: 1,child:Text.rich(
              //                   TextSpan(
              //                       children: [
              //                         TextSpan( text: ' 适宜季节 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
              //                         TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['season']}',style: TextStyle(fontSize:13,color: Colors.black87),),
              //                       ]
              //                   )
              //               ),
              //               ),
              //             ],
              //           ),
              //           padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              //         ),
              //         Container(
              //           child: Row(
              //             children: [
              //               Expanded(flex: 1,child:Text.rich(
              //                   TextSpan(
              //                       children: [
              //                         TextSpan( text: ' 商品重量 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
              //                         TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['weight']} g',style: TextStyle(fontSize:13,color: Colors.black87),),
              //                       ]
              //                   )
              //               ),
              //               ),
              //               Expanded(flex: 1,child:Text.rich(
              //                   TextSpan(
              //                       children: [
              //                         TextSpan( text: ' 商品厚度 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
              //                         TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['land']} cm',style: TextStyle(fontSize:13,color: Colors.black87),),
              //                       ]
              //                   )
              //               ),
              //               ),
              //             ],
              //           ),
              //           padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              //         ),
              //         Container(
              //           child: Text.rich(
              //               TextSpan(
              //                   children: [
              //                     TextSpan( text: ' 特征款式 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
              //                     TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['style']}',style: TextStyle(fontSize:13,color: Colors.black87),),
              //                   ]
              //               )
              //           ),
              //           padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
              //         ),
              //       ],
              //     )
              // ),
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
                                  TextSpan( text: ' 色码说明 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                  TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['desc']}',style: TextStyle(fontSize:13,color: Colors.black87),),
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
                                  TextSpan( text: ' 供应厂商 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                  TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['supply_name']}',style: TextStyle(fontSize:13,color: Colors.black87),),
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
                                      TextSpan( text: ' 物流方式 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                      TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['logistics']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                                    ]
                                )
                            ),
                            ),
                            Expanded(flex: 1,child:Text.rich(
                                TextSpan(
                                    children: [
                                      TextSpan( text: ' 交货期限 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                      TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['delivery']}天',style: TextStyle(fontSize:13,color: Colors.black87),),
                                      TextSpan( text: ' 起', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
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
                                      TextSpan( text: ' 订货基数 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                      TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['base']}件',style: TextStyle(fontSize:13,color: Colors.black87),),
                                      // TextSpan( text: ' 起', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                    ]
                                )
                            ),
                            ),
                            Expanded(flex: 1,child:Text.rich(
                                TextSpan(
                                    children: [
                                      TextSpan( text: ' 色起订量 ', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                      TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['startorder']}件',style: TextStyle(fontSize:13,color: Colors.black87),),
                                      // TextSpan( text: ' 起', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                                    ]
                                )
                            ),
                            ),
                          ],
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
                          TextSpan( text: '${SkuDetailsController.skuData['results']['data'][0]['created_date']}', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                          TextSpan( text: ' - ', style: TextStyle(fontSize:13,color: Colors.black26),),
                          TextSpan( text: '${SkuDetailsController.skuData['results']['data'][0]['created_by_name']} 建档', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                          // TextSpan( text: '  ${SkuDetailsController.skuData['results']['data'][0]['desc']}',style: TextStyle(fontSize:13,color: Colors.black87),),
                        ]
                    )
                ),
              ),
            ],
          )
        ),
        bottomNavigationBar: HomeController.isSuperUser || HomeController.permsItem.contains("wares.change_wares") ? new BottomAppBar(
          // notchMargin: 10.0,
          elevation: 10.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 1,
                  child: MyButton(
                    onTap: () {print('编辑ID为 ${SkuDetailsController.skuData['results']['data'][0]['id']} 的商品数据');},
                    text: '编辑',fontColor:Colors.white,
                    icon:Icons.edit_note,
                    backgroundColor:Colors.orangeAccent,
                    radius:0
                  )
              ),
              Expanded(
                flex: 1,
                child: MyButton(
                  onTap: () {checkDel(SkuDetailsController.skuData['results']['data'][0]['id']);},
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