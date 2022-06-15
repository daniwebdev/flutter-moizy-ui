import 'package:flutter/material.dart';

class ColumnListContainer extends StatelessWidget {
  final List<Widget> children;

  const ColumnListContainer({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

class ListItemCustom extends StatelessWidget {
  final bool? isLast;
  final bool? isFirst;
  final Widget child;
  final EdgeInsets? padding;
  
  const ListItemCustom({Key? key, this.padding, this.isFirst, this.isLast, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isLast != null && isLast == true ? Colors.transparent : Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: child,
    );
  }
}
