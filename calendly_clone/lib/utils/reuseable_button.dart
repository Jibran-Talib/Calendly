import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseButton extends StatelessWidget {
  final Color buttoncolor;
  final Color bordercolor;
  final Color textcolor;
  final Widget widget;
  final double buttonheight;

  const ReuseButton(
      {super.key,
      this.buttoncolor = const Color(0xff0047ff),
      this.textcolor = const Color(0xff0047ff),
      required this.widget,
      this.buttonheight = 54,
      this.bordercolor = const Color(0xff0047ff)});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonheight.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: bordercolor),
          color: buttoncolor),
      child: Center(child: widget),
    );
  }
}
