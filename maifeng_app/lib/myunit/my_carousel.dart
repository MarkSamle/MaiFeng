import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_options.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_carousel_widget/indicators/circular_slide_indicator.dart';
// import 'package:image_downloader/image_downloader.dart';
// import 'package:image_pickers/image_pickers.dart';

import 'my_photo_page.dart';



class MyCarousel extends StatefulWidget {
  // 传入参数
  const MyCarousel({
    Key? key,
    required this.images,
  }) : super(key: key,);
  final List images;
  @override
  State<StatefulWidget> createState() => MyCarouselState();

}

class MyCarouselState extends State<MyCarousel> {
  List<Widget> imagesItems = [];

  @override
  Widget build(BuildContext context) {
    List imgList = [];
    widget.images.forEach((img) {
      if (img != ''){
        imgList.add(img);
      }
    });
    return
      FlutterCarousel(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.width-100,
        showIndicator: true,
        slideIndicator: CircularSlideIndicator(
          itemSpacing:20,
          indicatorRadius:4,
          currentIndicatorColor: Colors.redAccent,
          indicatorBackgroundColor: Colors.black12,

        ),
      ),
      items: imgList.asMap().entries.map((entry) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                // decoration: BoxDecoration(
                //     color: Colors.amber
                // ),
                child:
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (ctx, animation, animation2) {
                        return FadeTransition(
                          opacity: animation,
                          child: ImageDetail(entry.value),
                        );
                      }
                      )
                    );
                  },
                  onLongPress: () {
                    print('长按'+ entry.value);
                    // saveimg(entry.value);
                    },
                  child: Image.network(entry.value,fit:BoxFit.fill), // 布满 // fit: BoxFit.contain,),// 缩小 // fit: BoxFit.cover,),// 展开 //
                ),
                // Image.network(img,fit:BoxFit.fill),
                // Text('text $i', style: TextStyle(fontSize: 16.0),)
            );
          },
        );
      }).toList(),
    );
      // Carousel(items: imagesItems);
  }

}

// saveimg(String image) async {
//   try {
//     // Saved with this method.
//     var imageId = await ImageDownloader.downloadImage(image);
//     if (imageId == null) {
//       return;
//     }
//     // Below is a method of obtaining saved image information.
//     var fileName = await ImageDownloader.findName(imageId);
//     var path = await ImageDownloader.findPath(imageId);
//     var size = await ImageDownloader.findByteSize(imageId);
//     var mimeType = await ImageDownloader.findMimeType(imageId);
//   } on PlatformException catch (error) {
//     print(error);
//   }
// }

