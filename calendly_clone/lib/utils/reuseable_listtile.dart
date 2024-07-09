import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseListTile extends StatelessWidget {
  final String text;
  final String iconpath;
  const ReuseListTile({super.key, required this.text, required this.iconpath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: double.infinity,
            height: 21.74.h,
            child: Row(
              children: [
                ImageIcon(color: const Color(0xff356eff), AssetImage(iconpath)),
                SizedBox(
                  width: 18.w,
                ),
                ReuseText(
                  text: text,
                  size: 13,
                  color: Colors.black.withOpacity(0.7),
                ),
              ],
            )),
        SizedBox(
          height: 16.26.h,
        )
      ],
    );
  }
}
