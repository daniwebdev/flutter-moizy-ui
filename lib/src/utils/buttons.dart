import 'package:flutter/material.dart';
import 'package:moizy_ui/moizy_ui.dart';

class ButtonPrimary extends StatelessWidget {
  final String? text;
  final void Function() onPressed;

  const ButtonPrimary({Key? key, this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: MoizyColors.primary,
        padding: const EdgeInsets.all(15),
      ),
      onPressed: () {
        onPressed();
      },
      child: SizedBox(
        width: double.infinity,
        child: Text(
          text ?? 'Login',
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
