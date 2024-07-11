import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 29.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 21.w,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                          color: Color(0xff757575), Icons.arrow_back_ios)),
                  const ReuseText(
                      text: 'Cancel', size: 13, color: Color(0xff757575)),
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 24.w,
                  ),
                  const ReuseText(
                    text: 'New Event Type',
                    size: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                // width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width: 7.w,
                    ),
                    TabBar(
                        dividerHeight: 0,
                        splashBorderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        overlayColor:
                            const MaterialStatePropertyAll(Color(0xffa2cdff)),
                        // labelPadding: EdgeInsets.only(left: 24.w, bottom: 14),

                        tabAlignment: TabAlignment.center,
                        indicatorColor: Colors.blue,
                        labelPadding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 17.w),
                        tabs: const [
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
                        ]),
                  ],
                ),
              ),
              Container(
                height: 1.h,
                width: double.infinity,
                color: const Color(0xffD9D9D9),
              ),
              Expanded(
                child: TabBarView(children: [
                  Expanded(
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
