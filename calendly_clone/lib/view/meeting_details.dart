import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeetingDetails extends StatelessWidget {
  const MeetingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(22.w),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReuseText(
              text: 'Time zone',
              size: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black)
        ],
      ),
    );
  }
}
