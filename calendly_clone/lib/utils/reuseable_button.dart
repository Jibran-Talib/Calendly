import 'package:flutter/material.dart';

class ReuseButton extends StatelessWidget {
  final Color buttoncolor;
  final Color textcolor;
  final Widget widget;
  final double buttonheight;

  const ReuseButton(
      {super.key,
      this.buttoncolor = const Color(0xff0047ff),
      this.textcolor = const Color(0xff0047ff),
      required this.widget,
      this.buttonheight = 54});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonheight,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: const Color(0xff0047ff)),
          color: buttoncolor),
      child: Center(child: widget),
    );
  }
}
