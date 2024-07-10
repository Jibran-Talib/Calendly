import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 1),
              child: Material(
                elevation: 2,
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.white,
                ),
              )),
          backgroundColor: Colors.white,
          shadowColor: Colors.black,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const ImageIcon(
                  color: Color(0xff0047ff),
                  AssetImage('assets/images/cross.png'))),
          title: const ReuseText(
            text: 'Edit your default message',
            color: Colors.black,
            size: 15,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 29.h, horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ReuseText(
                text:
                    'Customize the text that is included when you share a link',
                size: 11,
                color: Color(0xff757575),
              ),
              SizedBox(height: 25.h),
              const ReuseText(
                text: 'Here’s my Calendly link to make finding a time easy:',
                size: 16,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
