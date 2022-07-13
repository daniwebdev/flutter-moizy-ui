import 'package:flutter/material.dart';

class ColumnListContainer extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsets? margin;

  const ColumnListContainer({Key? key, this.margin, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(10),
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

  final Widget child;
  final EdgeInsets? padding;
  
  const ListItemCustom({Key? key, this.padding, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: child,
    );
  }
}
