import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  ///Text editing controller
  final TextEditingController? controller;

  ///Icon Data: Example Icons.lock_rounded
  final IconData? icon;

  ///Hide he text: defaults to false
  final bool obobscureText;

  ///Hint Text
  final String hintText;

  ///Label text, shows on the top of the border in the extreame left side
  final String? labelText;

  ///Enable editing: Defaults to true
  final bool enabled;

  ///Padding Top: Default 20px
  final double top;

  ///Keyboard type
  final TextInputType? keyboardType;
  const InputTextField(
      {super.key,
      this.labelText,
      this.controller,
      this.icon,
      this.obobscureText = false,
      required this.hintText,
      this.top = 20,
      this.keyboardType,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20, top: top),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obobscureText,
        enabled: enabled,
        decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: Icon(icon),
            hintText: hintText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
      ),
    );
  }
}
