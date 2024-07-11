import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                            color: Color(0xff757575), Icons.arrow_back_ios)),
                    const ReuseText(
                        text: 'Cancel', size: 13, color: Color(0xff757575)),
                  ],
                ),
                SizedBox(
                  height: 22.h,
                ),
                const ReuseText(
                  text: 'New Event Type',
                  size: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 25.h,
                ),
                const TabBar(indicatorColor: Colors.blue, tabs: [
                  ReuseText(
                    text: 'Edit',
                    size: 13,
                    color: Color(0xff757575),
                  ),
                  ReuseText(
                    text: 'Preview',
                    size: 13,
                    color: Color(0xff757575),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
