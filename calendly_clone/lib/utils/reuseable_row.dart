import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseableRow extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Widget? button;
  final double fontSize;

  const ReuseableRow({
    super.key,
    required this.text,
    this.onTap,
    this.button,
    this.fontSize = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 1.h,
          color: const Color(0xff757575),
        ),
        Row(
          children: [
            InkWell(
              onTap: onTap,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
                child: ReuseText(
                  text: text,
                  color: const Color(0xff757575),
                  size: fontSize.sp,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              child: button,
            ),
            SizedBox(
              width: 15.w,
            ),
          ],
        ),
      ],
    );
  }
}
