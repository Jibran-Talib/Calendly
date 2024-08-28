import 'package:calendly_clone/controller/get_controller.dart';
import 'package:calendly_clone/widgets/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EventPreviewScreen extends StatelessWidget {
  final Map<String, dynamic> selectedValue;
  final String buttomwidgetValue;
  const EventPreviewScreen(
      {super.key,
      required this.selectedValue,
      required this.buttomwidgetValue});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    return Container(
      color: Colors.grey.shade100,
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h),
        child: Material(
          elevation: 6,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: ListView(
              children: [
                Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade800,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.w),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReuseText(
                              text: 'This is a preview.',
                              color: Colors.white,
                              size: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            ReuseText(
                              text: ' To book an event, share the link',
                              color: Colors.white,
                              size: 11,
                            ),
                          ],
                        ),
                        ReuseText(
                          text: ' To book an event, share the link',
                          color: Colors.white,
                          size: 11,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                const Center(
                  child: ReuseText(
                    text: 'Jibran Talib',
                    color: Color(0xff757575),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: ReuseText(
                    text: 'Event name here',
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold,
                    size: 22,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20.w,
                    ),
                    Icon(
                      Icons.access_time,
                      color: const Color(0xff757575),
                      size: 20.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Obx(
                      () => ReuseText(
                        text: controller.dropDownButtonMintsValue.value ==
                                'Custum'
                            ? '${controller.textEditingController.value.text} ${controller.dropDownButtonMintsHourValue.value}'
                            : controller.dropDownButtonMintsValue.value,
                        color: const Color(0xff757575),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                selectedValue.isNotEmpty
                    ? Row(
                        children: [
                          SizedBox(
                            width: 20.w,
                          ),
                          Image(
                            image: AssetImage(
                              selectedValue['Icons'].toString(),
                            ),
                            height: 20.h,
                            width: 20.h,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          ReuseText(
                            text: selectedValue['title'].toString(),
                            color: const Color(0xff757575),
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      )
                    : const SizedBox(),
                const Divider(),
                SizedBox(
                  height: 300.h,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(12.h),
                      child: const ReuseText(
                        textAlign: TextAlign.center,
                        text:
                            'A preview of your availability will             show on the next step',
                        size: 15,
                        color: Color(0xff757575),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
