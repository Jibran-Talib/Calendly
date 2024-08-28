import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double size;
  final Color color;
  final TextAlign? textAlign;

  const ReuseText(
      {super.key,
      required this.text,
      this.fontWeight,
      this.size = 15,
      this.color = const Color(0xff0047ff),
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: fontWeight,
        fontSize: size.sp,
        color: color,
      ),
    );
  }
}
