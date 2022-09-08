import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int maxLines;
  final IconData? icon;
  final TextInputType? textType;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.labelText,
      this.maxLines = 1,
      this.textType = TextInputType.name,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textType,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon!,
            color: Color(0xfF2D4379),
          ),
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xfF2D4379)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffD9DFEB)))),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $labelText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
