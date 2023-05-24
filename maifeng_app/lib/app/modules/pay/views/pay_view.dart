
import 'package:find_dropdown/find_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../myunit/my_img_button.dart';
import '../../../../myunit/my_new_img_button.dart';
import '../../../../store/wares_store.dart';
import '../controllers/pay_controller.dart';

class PayView extends GetView<PayController> {
  const PayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 50, 50, 50),
            ),
            onPressed: Get.back,//controller.turnBack,//
          ),
          title: const Text(
            '收银台',
            style: TextStyle(
              color: Color.fromARGB(255, 50, 50, 50),
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255,255),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: [
              const SizedBox(height: 5,),
              Container(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: FindDropdown(
                  label:' 选择门店',
                  labelStyle: const TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),
                  searchBoxDecoration: const InputDecoration(
                    hintText:'搜索',
                    // icon: Icon(Icons.search_outlined,)
                  ),
                  items: PayController.shopChoicesItems,
                  onChanged: (item) {
                    PayController.shopChoices = item.toString();
                    WaresStore.setShopChoices(item.toString());
                  },
                  selectedItem: PayController.shopChoices,
                ),
              ),
              const SizedBox(height: 5,),
              Container(
                child: const Text.rich(
                    TextSpan(
                        children: [
                          TextSpan( text: ' 扫码买单', style: TextStyle(fontSize:10,color: Colors.black38,fontWeight: FontWeight.w500),),
                        ]
                    )
                ),
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              ),
              Container(
                child:Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5,),
                      Container(
                        child: MyImgButton(
                          backgroundColor: Colors.white,
                          text: '扫描商品',
                          icon: Icons.add_shopping_cart_rounded,
                          fontColor: Colors.blue,
                          imgPath: 'assets/images/saoma.png',
                          fontSize: 13,
                          height: 150,
                          width: 160,
                          onTap: (){controller.goPage('code');}
                        ),
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        child: const Divider(
                          height: 0.8,
                          indent: 0.0,
                          color: Colors.black12,
                        ),
                        padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: MyNewImgButton(
                                  backgroundColor: Colors.white,
                                  text: '购物篮',
                                  icon: Icons.add_shopping_cart_rounded,
                                  fontColor: Colors.blue,
                                  imgPath: 'assets/images/shopping-basket.png',
                                  fontSize: 10,
                                  height: 70,
                                  width: 70,
                                  onTap: (){controller.goPage('basket');}
                              ),
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                            ),
                            Container(
                              child: MyNewImgButton(
                                  backgroundColor: Colors.white,
                                  text: '订单',
                                  icon: Icons.add_shopping_cart_rounded,
                                  fontColor: Colors.blue,
                                  imgPath: 'assets/images/list.png',
                                  fontSize: 10,
                                  height: 70,
                                  width: 70,
                                  onTap: (){print('历史订单');}
                              ),
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                            ),
                            Container(
                              child: MyNewImgButton(
                                  backgroundColor: Colors.white,
                                  text: '优惠券',
                                  icon: Icons.add_shopping_cart_rounded,
                                  fontColor: Colors.blue,
                                  imgPath: 'assets/images/credit-card.png',
                                  fontSize: 10,
                                  height: 70,
                                  width: 70,
                                  onTap: (){print('优惠政策');}
                              ),
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      ),
                    ],
                  )
                ),
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 4),
              ),
            ],
          ),
        )
    );
  }

}