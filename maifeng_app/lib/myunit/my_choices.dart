import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';

class MyChoices extends StatefulWidget {
  // 传入参数
  const MyChoices({
    Key? key,
    this.title: '选择',
    required this.choices,
    required this.inChoices,
    required this.onChoices,
    required this.onValues,

  }) : super(key: key,);
  final String title;
  final List choices;
  final ValueChanged<List<int>> inChoices;
  final ValueChanged<List> onChoices;
  final List<int> onValues;


  @override
  State<StatefulWidget> createState() => MyChoicesState();

}

class MyChoicesState extends State<MyChoices> {
  List<DropdownMenuItem> items = [];
  List<int> values = [];
  @override
  Widget build(BuildContext context) {
    Map<String,int> theValue = {};
    widget.choices.forEach((item) {
      theValue.addAll({item['label']+'('+item['value'].toString()+')':item['value']});
      // print(item);
      items.add(
        DropdownMenuItem(
          child: Text(item['label']+'('+item['value'].toString()+')'),
          value: item['label']+'('+item['value'].toString()+')',
        )
      );
    });
    if (widget.onValues.length > 0){
      values = widget.onValues;
    }
    return SearchChoices.multiple(
      items: items,
      selectedItems: values,
      hint: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(widget.title),
      ),
      searchHint: widget.title,
      onChanged: (value) {
        List ids = [];
        List<int> inchoices = [];
        values = value;
        values.forEach((index) {
          ids.add(theValue[items[index].value]);
        });
        widget.onChoices(ids);
        widget.inChoices(values);
      },
      closeButton: (selectedItems) {
        return (selectedItems.isNotEmpty
            ? "Save ${'(' + selectedItems.length.toString() + ')'}"
            : "Save without selection");
      },
      isExpanded: true,
      dialogBox: true,
    );
  }




}