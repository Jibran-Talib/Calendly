import 'package:calendly_clone/utils/reuseable_row.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LabScreen extends StatefulWidget {
  const LabScreen({super.key});

  @override
  State<LabScreen> createState() => _LabScreenState();
}

class _LabScreenState extends State<LabScreen> {
  bool switchButtonValue = false;
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
            text: 'Labs',
            color: Colors.black,
            size: 20,
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 21.h),
              child: const ReuseText(
                text:
                    'In the future, we plan to develop advanced analytics to provide comprehensive dashboards and reports for monitoring user engagement and app performance. We will integrate AI-driven features to deliver personalized user experiences and predictive analytics. Enhancing security is a top priority, and we will implement cutting-edge protocols to ensure data privacy and protection.',
                size: 10,
                color: Color(0xff757575),
              ),
            ),
            ReuseableRow(
              text: 'Dark mode',
              fontSize: 13,
              button: Switch(
                activeTrackColor: const Color(0xff0047ff),
                value: switchButtonValue,
                onChanged: (value) {
                  switchButtonValue = value;
                  setState(() {});
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 1.h,
              color: const Color(0xff757575),
            )
          ],
        ),
      ),
    );
  }
}
