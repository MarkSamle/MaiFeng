import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  static const HORIZONTAL_PADDING = 20.0;
  static const VERTICAL_PADDING = 13.0;

  const MessageItem({
    required this.title,
    required this.lastMsg,
    required this.time,
    this.avatarPath = 'assets/images/maifeng.png',
    required this.onPressed,
    this.isBadge = false,
  });

  final String title;
  final String lastMsg;
  final String time;
  final String avatarPath;
  final bool isBadge;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: onPressed,
          leading: Container(
            height: 48.0,
            width: 48.0,
            child: Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.asset(avatarPath),
                ),
                // isBadge == true
                //     ? Positioned(
                //         right: 0,
                //         top: 0,
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(4),
                //             border: Border.fromBorderSide(
                //               BorderSide(width: 1, color: Colors.red),
                //             ),
                //           ),
                //           child: Container(
                //             color: Colors.red[600],
                //             height: 6,
                //             width: 6,
                //           ),
                //         ),
                //       )
                //     : SizedBox()
              ],
            ),
          ),
          title: Container(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
              ),
              maxLines: 1,
            ),
          ),
          subtitle: Container(
            child: Text(
              lastMsg,
              style: TextStyle(color: Colors.grey, fontSize: 14.0),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          trailing: Container(
            child: Text(
              time,
              style: TextStyle(color: Colors.grey, fontSize: 13.0),
            ),
          ),
        ),
        Divider(height: 1, color: Colors.grey[300], indent: 80.0),
      ],
    );
  }
}
