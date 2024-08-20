import 'package:calendly_clone/controller/get_controller.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:calendly_clone/utils/reuseable_textformField.dart';
import 'package:calendly_clone/utils/timezone_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MeetingDetails extends StatefulWidget {
  const MeetingDetails({
    super.key,
  });

  @override
  State<MeetingDetails> createState() => _MeetingDetailsState();
}

class _MeetingDetailsState extends State<MeetingDetails> {
  Controller controller = Get.put(Controller());
  Map<String, dynamic>? _timeZoneValue = TimeZoneListState.timeZones[0];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(22.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ReuseText(
                  text: 'Time zone',
                  size: 10,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 0, 1)),
              Row(
                children: [
                  const Icon(Icons.travel_explore),
                  SizedBox(
                    width: 5.w,
                  ),
                  DropdownButtonHideUnderline(
                    child: Obx(
                      () => DropdownButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.blue,
                        ),
                        value: _timeZoneValue,
                        items: TimeZoneListState.timeZones
                            .map<DropdownMenuItem<Map<String, dynamic>>>((e) {
                          return DropdownMenuItem<Map<String, dynamic>>(
                            value: e,
                            child: SizedBox(
                              width: 175.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ReuseText(
                                    text: e['country'],
                                    size: 10,
                                  ),
                                  ReuseText(
                                    text: e['offset'],
                                    size: 10,
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _timeZoneValue = value!;
                            print('_timeZoneValue : $_timeZoneValue');
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              const Row(
                children: [
                  ReuseText(
                    text: 'Duration *  ',
                    size: 11,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  Icon(
                    Icons.info_outline,
                    size: 16.66,
                    color: Color(0xff757575),
                  )
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              Container(
                height: 30.h,
                width: 138.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: const Color(0xff757575))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11.w),
                  child: DropdownButtonHideUnderline(
                    child: Obx(
                      () => Expanded(
                        child: DropdownButton(
                          isExpanded: true,
                          iconEnabledColor: const Color(0xff356eff),
                          value: controller
                              .dropDownButtonMintsValueforMeetingdetailScreen
                              .value
                              .toString(),
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          items: controller.dropDownButtonMints
                              .map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem<String>(
                                value: e.toString(),
                                child: ReuseText(
                                  text: e.toString(),
                                  size: 10,
                                  color: Colors.black,
                                ));
                          }).toList(),
                          onChanged: (value) {
                            controller
                                .dropDownButtonMintsValueforMeetingdetailScreen
                                .value = value.toString();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => controller.dropDownButtonMintsValueforMeetingdetailScreen
                            .value ==
                        'Custum'
                    ? Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  height: 30.h,
                                  width: 50.w,
                                  child: Obx(
                                    () => ReuseTextFormField(
                                      borderRadius: 5.r,
                                      enabledBorderColor:
                                          const Color(0xff757575),
                                      keyboardType: TextInputType.number,
                                      textEditingController: controller
                                          .textEditingController.value,
                                    ),
                                  )),
                              SizedBox(
                                width: 5.w,
                              ),
                              Container(
                                width: 83.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    border: Border.all(
                                        color: const Color(0xff757575))),
                                child: Expanded(
                                  child: DropdownButtonHideUnderline(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 11.w),
                                      child: DropdownButton(
                                          iconEnabledColor:
                                              const Color(0xff356eff),
                                          icon: const Icon(Icons
                                              .keyboard_arrow_down_outlined),
                                          value: controller
                                              .dropDownButtonMintsHourValueForMeetingDetailsScreen
                                              .value
                                              .toString(),
                                          items: controller
                                              .dropDownButtonMintsHour
                                              .map<DropdownMenuItem<String>>(
                                                  (e) {
                                            return DropdownMenuItem<String>(
                                                value: e.toString(),
                                                child: ReuseText(
                                                  text: e.toString(),
                                                  size: 10,
                                                  color: Colors.black,
                                                ));
                                          }).toList(),
                                          onChanged: (value) {
                                            controller
                                                .dropDownButtonMintsHourValueForMeetingDetailsScreen
                                                .value = value.toString();
                                          }),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    : const SizedBox(),
              ),
              SizedBox(
                height: 24.h,
              ),
              const ReuseText(
                size: 10,
                text: 'Host',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              const ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color(0xffd9d9d9),
                  child: ReuseText(
                    text: 'J',
                    color: Colors.black,
                  ),
                ),
                title: ReuseText(
                  text: 'Jibran Talib (you)',
                  color: Colors.black,
                  size: 10,
                ),
                subtitle: ReuseText(
                  text: 'Weekdays, 9 am - 5 am',
                  color: Color(0xff757575),
                  size: 9,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.all(22.w),
          child: const ReuseText(
              color: Color(0xff757575),
              size: 10,
              text:
                  'You are the only one in your organization. Add users to include them as hosts.'),
        )
      ],
    );
  }
}
