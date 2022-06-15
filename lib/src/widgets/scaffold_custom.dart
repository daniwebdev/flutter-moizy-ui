import 'package:flutter/material.dart';
import 'package:moizy_ui/moizy_ui.dart';

class ScaffoldCustom extends StatelessWidget {
  final Widget? body;
  final String? title;
  final List<Widget>? actions;
  final IconData? backButtonIcon;
  final Function? onBack;

  const ScaffoldCustom({
    Key? key,
    this.onBack,
    this.body,
    this.title,
    this.actions,
    this.backButtonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBack?.call();
        return true;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(title ?? ''),
          leading: backButtonIcon != null
              ? IconButton(
                  icon: Icon(backButtonIcon ?? Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    onBack?.call();
                    Navigator.pop(context);
                  },
                )
              : null,
          actions: actions,
        ),
        body: body,
      ),
    );
  }
}

class TextButtonPrimary extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const TextButtonPrimary(this.text, {Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: MoizyColors.primary)),
    );
  }
}
