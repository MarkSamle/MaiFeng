// import 'dart:async';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
//
//
// class My_Slidable extends StatefulWidget {
//   const My_Slidable({Key? key, required this.id,required this.child}) : super(key: key);
//
//   final int id;
//   // final String title;
//   final Widget child;
//   @override
//   State<StatefulWidget> createState() => My_SlidableState();
// }
//
// class My_SlidableState extends State<My_Slidable> {
//   static int pushid = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     int id = widget.id;
//     // String title = widget.title;
//     My_SlidableState.pushid = id;
//     return Slidable(
//       // Specify a key if the Slidable is dismissible.
//       key: const ValueKey(0),
//
//       // The start action pane is the one at the left or the top side.
//       startActionPane: ActionPane(
//         // A motion is a widget used to control how the pane animates.
//         motion: ScrollMotion(),
//
//         // A pane can dismiss the Slidable.
//         dismissible: DismissiblePane(onDismissed: () {}),
//
//         // All actions are defined in the children parameter.
//         children: [
//           // A SlidableAction can have an icon and/or a label.
//           SlidableAction(
//             onPressed: doNothing,
//             backgroundColor: Color(0xFFFE4A49),
//             foregroundColor: Colors.white,
//             icon: Icons.delete,
//             label: 'Delete',
//           ),
//           SlidableAction(
//             onPressed: doNothing,
//             backgroundColor: Color(0xFF21B7CA),
//             foregroundColor: Colors.white,
//             icon: Icons.share,
//             label: 'Share',
//           ),
//         ],
//       ),
//
//       // The end action pane is the one at the right or the bottom side.
//       endActionPane: ActionPane(
//         motion: ScrollMotion(),
//         children: [
//           SlidableAction(
//             // An action can be bigger than the others.
//             flex: 2,
//             onPressed: doNothing,
//             backgroundColor: Color(0xFF7BC043),
//             foregroundColor: Colors.white,
//             icon: Icons.archive,
//             label: 'Archive',
//           ),
//           SlidableAction(
//             onPressed: doNothing,
//             backgroundColor: Color(0xFF0392CF),
//             foregroundColor: Colors.white,
//             icon: Icons.save,
//             label: 'Save',
//           ),
//         ],
//       ),
//
//       // The child of the Slidable is what the user sees when the
//       // component is not dragged.
//       child: widget.child,
//     );
//   }
// }
//
// void doNothing(BuildContext context) {
//   print(My_SlidableState.pushid);
// }
// 使用
// My_Slidable(
// id:1,
// child: ListTile(title: Text('testsss1'))
// ),