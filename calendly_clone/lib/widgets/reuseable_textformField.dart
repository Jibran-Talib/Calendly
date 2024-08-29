import 'package:calendly_clone/widgets/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final String hintText;
  final Color focusedBorderColor;
  final Color enabledBorderColor;
  final TextInputType? keyboardType;
  final double? height;
  final bool passwardVisible;

  final TextEditingController? textEditingController;

  final double borderRadius;

  const ReuseTextFormField({
    super.key,
    this.prefixIcon,
    this.hintText = '',
    this.focusedBorderColor = const Color(0xff0047ff),
    this.enabledBorderColor = const Color(0xff0047ff),
    this.borderRadius = 8,
    this.keyboardType,
    this.textEditingController,
    this.height = 35.3,
    this.suffixIcon,
    this.passwardVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: passwardVisible,

      cursorColor: Colors.black.withOpacity(0.7),
      textAlign: TextAlign.start,
      keyboardType: keyboardType,
      // cursorHeight: 16,
      style: TextStyle(
        fontSize: 12.sp,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: ReuseText(
          color: const Color(0xff757575),
          text: hintText.toString(),
          size: 10,
        ),
        fillColor: Colors.white,
        filled: true,

        prefixIcon: prefixIcon,

        constraints: BoxConstraints.expand(
          height: height!.h,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        hintStyle: const TextStyle(
            color: Color(0xff757575), fontWeight: FontWeight.normal),
        // hintText: hintText,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red), // Error border color
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        errorStyle: const TextStyle(
          height: 0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor),
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red), // Error border color
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
      ),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        }
        return null;
      },
    );
  }
}
