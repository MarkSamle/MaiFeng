import 'package:flutter/material.dart';
// import 'package:maifeng_app/app/modules/team/views/team_web_view.dart';
// import 'constants.dart' show Constants, AppColors;

class FullWidthButton extends StatelessWidget {
  static const HORIZONTAL_PADDING = 20.0;
  static const VERTICAL_PADDING = 13.0;

  const FullWidthButton({
    required this.title,
    required this.iconPath,
    required this.onPressed,
    this.showDivider = false,
  });

  final String title;
  final String iconPath;
  final bool showDivider;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final pureButton = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(iconPath, width: 24.0, height: 24.0),
        SizedBox(width: HORIZONTAL_PADDING),
        Expanded(child: Text(title)),
        Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18.0),
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
