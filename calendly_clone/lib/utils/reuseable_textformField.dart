import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final String? hintText;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;

  final double borderRadius;

  const ReuseTextFormField(
      {super.key,
      this.prefixIcon,
      this.hintText,
      this.focusedBorderColor = const Color(0xff0047ff),
      this.enabledBorderColor = const Color(0xff0047ff),
      this.borderRadius = 8,
      this.keyboardType,
      this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: Colors.black.withOpacity(0.7),
      textAlign: TextAlign.start,
      keyboardType: keyboardType,
      // cursorHeight: 16,
      style: TextStyle(
        fontSize: 12.sp,
      ),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10.w,
        ),
        hintStyle: const TextStyle(
            color: Color(0xff757575), fontWeight: FontWeight.normal),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor),
          borderRadius: BorderRadius.circular(borderRadius.r),
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
