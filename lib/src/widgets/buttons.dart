import 'package:flutter/material.dart';
import 'package:moizy_ui/moizy_ui.dart';

/// Custom Button ButtonPrimary.
///
/// This button is used to display a primary button.
///
class MoizyButton extends StatelessWidget {
  final String? text;

  /// padding of the button default is EdgeInsets.all(10)
  final EdgeInsets? padding;
  final Color? color;

  final void Function()? onPressed;

  const MoizyButton({Key? key, this.text, this.padding, required this.onPressed, this.color}) : super(key: key);

  static const _primary = MoizyColors.primary;

  const MoizyButton.primary({
    this.text,
    this.padding,
    this.onPressed,
    this.color = _primary,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: MoizyColors.primary,
        padding: padding ?? const EdgeInsets.all(10),
      ),
      onPressed: () {
        onPressed?.call();
      },
      child: SizedBox(
        width: double.infinity,
        child: Text(
          text ?? '',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4!.merge(
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
        ),
      ),
    );
  }
}
