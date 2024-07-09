import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Reuse2Listtile extends StatelessWidget {
  final String titleText;
  final String subtext;
  final String iconPath;
  const Reuse2Listtile(
      {super.key,
      required this.iconPath,
      required this.titleText,
      required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
            title: ReuseText(
              text: titleText,
              size: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            subtitle: ReuseText(
              text: subtext,
              size: 11,
              color: const Color(0xff757575),
            ),
            leading:
                Image(height: 30.h, width: 30.w, image: AssetImage(iconPath))),
        SizedBox(
          height: 6.h,
        )
      ],
    );
  }
}
