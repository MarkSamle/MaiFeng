import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  static const HORIZONTAL_PADDING = 20.0;
  static const VERTICAL_PADDING = 13.0;

  const SettingItem({
    required this.title,
    required this.onPressed,
    this.showDivider = false,
    this.centerTitle = false,
  });

  final String title;
  final bool showDivider;
  final bool centerTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final pureButton = centerTitle
        ? Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20.0),
            ],
          );

    final borderButton = Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffd9d9d9),
            width: 0.5,
          ),
        ),
      ),
      padding: EdgeInsets.only(bottom: VERTICAL_PADDING),
      child: pureButton,
    );

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(
            left: HORIZONTAL_PADDING,
            right: HORIZONTAL_PADDING,
            top: VERTICAL_PADDING,
            bottom: showDivider ? 0.0 : VERTICAL_PADDING),
        color: Colors.white,
        child: showDivider ? borderButton : pureButton,
      ),
    );
  }
}
