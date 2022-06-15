import 'package:flutter/material.dart';
import 'package:moizy_ui/moizy_ui.dart';

class AppBarCustom extends StatelessWidget {
  final String? title;
  const AppBarCustom({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? 'Group'),
      backgroundColor: MoizyColors.primary,
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/add_group');
          },
        ),
      ],
    );
  }
}
