import 'package:calendly_clone/controller/get_controller.dart';
import 'package:calendly_clone/utils/reuseable_row.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    return Scaffold(
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
          text: 'Notifications',
          color: Colors.black,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 62.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const ReuseText(
              text: 'MESSAGING',
              size: 10,
              color: Color(0xff757575),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          ReuseableRow(
            text: 'Push NotiNotifications',
            fontSize: 13,
            button: Obx(
              () => Switch(
                activeTrackColor: const Color(0xff0047ff),
                value: controller.pushNotificationSwitch.value,
                onChanged: (value) {
                  controller.pushNotificationSwitch.value = value;
                },
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            width: double.infinity,
            height: 1.h,
            color: const Color(0xff757575),
          ),
          SizedBox(
            height: 77.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: const ReuseText(
              text: 'EVENT NOTIFICATIONS',
              size: 10,
              color: Color(0xff757575),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          ReuseableRow(
            text: 'New',
            fontSize: 13,
            button: Obx(
              () => Switch(
                activeTrackColor: const Color(0xff0047ff),
                value: controller.newSwitch.value,
                onChanged: (value) {
                  controller.newSwitch.value = value;
                },
              ),
            ),
          ),
          ReuseableRow(
            text: 'Reconfirmations',
            fontSize: 13,
            button: Obx(
              () => Switch(
                activeTrackColor: const Color(0xff0047ff),
                value: controller.reconfirmationsSwitch.value,
                onChanged: (value) {
                  controller.reconfirmationsSwitch.value = value;
                },
              ),
            ),
          ),
          ReuseableRow(
            text: 'Rescheduled',
            fontSize: 13,
            button: Obx(
              () => Switch(
                activeTrackColor: const Color(0xff0047ff),
                value: controller.rescheduledSwitch.value,
                onChanged: (value) {
                  controller.rescheduledSwitch.value = value;
                },
              ),
            ),
          ),
          ReuseableRow(
            text: 'Canceled',
            fontSize: 13,
            button: Obx(
              () => Switch(
                activeTrackColor: const Color(0xff0047ff),
                value: controller.canceledSwitch.value,
                onChanged: (value) {
                  controller.canceledSwitch.value = value;
                },
              ),
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Container(
            width: double.infinity,
            height: 1.h,
            color: const Color(0xff757575),
          ),
        ],
      ),
    );
  }
}
