import 'package:flutter/material.dart';

class ReuseTextFormField extends StatelessWidget {
  final Icon? prefixIcon;
  final String? hintText;
  final Color focusedBorderColor;
  final Color enabledBorderColor;

  final double borderRadius;

  const ReuseTextFormField(
      {super.key,
      this.prefixIcon,
      this.hintText,
      this.focusedBorderColor = const Color(0xff0047ff),
      this.enabledBorderColor = const Color(0xff0047ff),
      this.borderRadius = 8});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black.withOpacity(0.7),
      textAlign: TextAlign.start,
      cursorHeight: 12,
      style: const TextStyle(
        fontSize: 12,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        hintStyle: const TextStyle(
            color: Color(0xff757575), fontWeight: FontWeight.normal),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
