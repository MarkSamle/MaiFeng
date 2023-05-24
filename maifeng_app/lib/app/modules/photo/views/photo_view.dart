import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../controllers/photo_controller.dart';

class PhotoView extends GetView<PhotoController> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
                child: PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(PhotoController.images[index]),
                      heroAttributes: PhotoController.heroTag.isNotEmpty?PhotoViewHeroAttributes(tag: PhotoController.heroTag):null,
                    );
                  },
                  itemCount: PhotoController.images.length,
                  // loadingBuilder: Container(),
                  backgroundDecoration: null,
                  pageController: PhotoController.controller,
                  enableRotation: true,
                  onPageChanged: (index){
                      PhotoController.index = index;
                  },
                )
            ),
          ),
          Positioned(//图片index显示
            top: MediaQuery.of(context).padding.top+15,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("${PhotoController.index + 1}/${PhotoController.images.length}",style: TextStyle(color: Colors.white,fontSize: 16)),
            ),
          ),
          Positioned(//右上角关闭按钮
            right: 10,
            top: MediaQuery.of(context).padding.top,
            child: IconButton(
              icon: Icon(Icons.close,size: 30,color: Colors.white,),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }
}