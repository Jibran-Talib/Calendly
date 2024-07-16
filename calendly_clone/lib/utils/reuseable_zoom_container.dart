import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseZoomCointainer extends StatelessWidget {
  final String imagePath;
  final String text;
  final Color borderColor;
  const ReuseZoomCointainer(
      {super.key,
      required this.text,
      required this.imagePath,
      this.borderColor = const Color(0xffd9d9d9)});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 150.72.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: borderColor)),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(imagePath)),
          SizedBox(
            height: 5.h,
          ),
          ReuseText(
            text: text,
            size: 10,
            color: const Color(0xff757575),
          ),
        ],
      )),
    );
  }
}
