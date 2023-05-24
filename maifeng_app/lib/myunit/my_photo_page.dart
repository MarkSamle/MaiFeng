import 'package:flutter/material.dart';

class ImageDetail extends StatelessWidget {
  final String imageURL;
  ImageDetail(this.imageURL);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Hero(
              tag: imageURL,
              child: Image.network(
                this.imageURL,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}