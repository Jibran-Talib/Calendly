import 'package:calendly_clone/utils/reuseable_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class MeetingDetails extends StatefulWidget {
  const MeetingDetails({super.key});

  @override
  State<MeetingDetails> createState() => _MeetingDetailsState();
}

class _MeetingDetailsState extends State<MeetingDetails> {
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
              color: Colors.black),
          ReuseText(
              text: 'Time zone',
              size: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          ReuseText(
              text: 'Time zone',
              size: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ],
      ),
    );
  }
}
