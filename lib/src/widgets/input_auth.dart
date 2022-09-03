import 'package:flutter/material.dart';
import 'package:moizy_ui/moizy_ui.dart';

class InputAuth extends StatelessWidget {
  final String? label;
  final String? hint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const InputAuth({
    Key? key,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.label,
    this.validator,
    this.hint,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obscureText ?? false,
        obscuringCharacter: '*',
        scrollPadding: EdgeInsets.zero,
        keyboardType: keyboardType,
        //type label
        decoration: InputDecoration(

          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black38),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.all(20),
          fillColor: Colors.white,
          focusColor: const Color(0xFFF5F5F5),
          hoverColor: const Color(0xFFF5F5F5),
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      );
  }
}


class DividerAuth extends StatelessWidget {
  const DividerAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}

class AuthActionButton extends StatelessWidget {
  final String? text;
  final void Function() onPressed;

  const AuthActionButton({Key? key, required this.onPressed, this.text}) : super(key: key);

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
