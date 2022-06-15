import 'package:flutter/material.dart';

List<Widget> addSparatedList(List<Widget> list, {Widget? sparated}) {
  var result = <Widget>[];
  for (var i = 0; i < list.length; i++) {
    result.add(list[i]);
    if (i != list.length - 1) {
      result.add(sparated ?? const SizedBox(
        height: 10,
      ));
    }
  }
  return result;
}
