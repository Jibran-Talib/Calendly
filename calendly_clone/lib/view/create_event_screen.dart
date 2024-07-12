import 'package:calendly_clone/controller/get_controller.dart';
import 'package:calendly_clone/utils/reuseable_button.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:calendly_clone/utils/reuseable_textformField.dart';
import 'package:calendly_clone/utils/reuseable_zoom_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('Rebuil Jibran Code');
    Controller controller = Get.put(Controller());
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 28.h,
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
                height: 21.h,
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

                        // splashBorderRadius:
                        //     const BorderRadius.all(Radius.circular(20)),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 25.h,
                            ),
                            const Row(
                              children: [
                                ReuseText(
                                  text: 'Event name *  ',
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
                              height: 7.h,
                            ),
                            SizedBox(
                              height: 30.h,
                              child: ReuseTextFormField(
                                hintText: 'Name your event',
                                borderRadius: 5,
                                enabledBorderColor: const Color(0xff757575),
                                prefixIcon: SizedBox(
                                  width: 62.w,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 11.w,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: Obx(
                                          () => DropdownButton(
                                            iconEnabledColor:
                                                const Color(0xff356eff),
                                            value: controller
                                                .dropDownButtonValue.value,
                                            icon: const Icon(Icons
                                                .keyboard_arrow_down_outlined),
                                            items: controller
                                                .dropDownButtonColors
                                                .map<DropdownMenuItem<Color>>(
                                                    (e) {
                                              return DropdownMenuItem<Color>(
                                                value: e,
                                                child: Center(
                                                  child: CircleAvatar(
                                                    radius: 7.5.r,
                                                    backgroundColor: e,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              controller.dropDownButtonValue
                                                  .value = value!;
                                            },
                                          ),
                                        ),
                                      ),
                                      const VerticalDivider()
                                    ],
                                  ),
                                ),
                              ),
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
                                  border: Border.all(color: Color(0xff757575))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 11.w),
                                child: DropdownButtonHideUnderline(
                                  child: Obx(
                                    () => Expanded(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        iconEnabledColor:
                                            const Color(0xff356eff),
                                        value: controller
                                            .dropDownButtonMintsValue.value
                                            .toString(),
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down_outlined),
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
                                          controller.dropDownButtonMintsValue
                                              .value = value.toString();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => controller.dropDownButtonMintsValue.value ==
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
                                                child: ReuseTextFormField(
                                                  borderRadius: 5.r,
                                                  enabledBorderColor:
                                                      const Color(0xff757575),
                                                  keyboardType:
                                                      TextInputType.number,
                                                )),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            Container(
                                              width: 83.w,
                                              height: 30.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xff757575))),
                                              child: Expanded(
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 11.w),
                                                    child: DropdownButton(
                                                        iconEnabledColor:
                                                            const Color(
                                                                0xff356eff),
                                                        icon: const Icon(Icons
                                                            .keyboard_arrow_down_outlined),
                                                        value: controller
                                                            .dropDownButtonMintsHourValue
                                                            .value
                                                            .toString(),
                                                        items: controller
                                                            .dropDownButtonMintsHour
                                                            .map<
                                                                DropdownMenuItem<
                                                                    String>>((e) {
                                                          return DropdownMenuItem<
                                                                  String>(
                                                              value:
                                                                  e.toString(),
                                                              child: ReuseText(
                                                                text: e
                                                                    .toString(),
                                                                size: 10,
                                                                color: Colors
                                                                    .black,
                                                              ));
                                                        }).toList(),
                                                        onChanged: (value) {
                                                          controller
                                                                  .dropDownButtonMintsHourValue
                                                                  .value =
                                                              value.toString();
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
                            const Row(
                              children: [
                                ReuseText(
                                  text: 'Location *  ',
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
                              height: 5.h,
                            ),
                            const Row(
                              children: [
                                ReuseZoomCointainer(
                                  imagePath: 'assets/images/zoomicon.png',
                                  text: 'Zoom',
                                ),
                                Spacer(),
                                ReuseZoomCointainer(
                                  imagePath: 'assets/images/callicon.png',
                                  text: 'Phone call',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            const Row(
                              children: [
                                ReuseZoomCointainer(
                                  imagePath: 'assets/images/pinicon.png',
                                  text: 'In-person meeting',
                                ),
                                Spacer(),
                                ReuseZoomCointainer(
                                  imagePath: 'assets/images/downarrowicon.png',
                                  text: 'In-person meeting',
                                  borderColor: Colors.transparent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Divider(),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 136.w,
                            child: ReuseButton(
                                buttonheight: 28.h,
                                buttoncolor: Colors.white,
                                bordercolor: Colors.white,
                                widget: const ReuseText(
                                  text: 'Cancel',
                                  size: 13,
                                  color: Color(0xff757575),
                                )),
                          ),
                          SizedBox(
                            width: 136.w,
                            child: ReuseButton(
                                buttonheight: 28.h,
                                widget: const ReuseText(
                                  text: 'Confirm',
                                  size: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.blue,
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
