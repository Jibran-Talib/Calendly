import 'package:flutter/material.dart';

class ReuseTextFormField extends StatelessWidget {
  const ReuseTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff0047ff)),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xff0047ff)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
