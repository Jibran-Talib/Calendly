import 'package:calendly_clone/controller/get_controller.dart';
import 'package:calendly_clone/utils/reuseable_button.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:calendly_clone/utils/reuseable_textformField.dart';
import 'package:calendly_clone/utils/reuseable_zoom_container.dart';
import 'package:calendly_clone/utils/reuseble_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// ignore: must_be_immutable
class CreateEventScreen extends StatefulWidget {
  Map<String, dynamic>? selectedValue;
  String? buttomwidgetValue;
  CreateEventScreen({
    super.key,
    this.selectedValue,
    this.buttomwidgetValue,
  });

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  @override
  Widget build(BuildContext context) {
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
                  ListView(
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
                            if (widget.selectedValue == null)
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const ReuseZoomCointainer(
                                        imagePath: 'assets/images/zoomicon.png',
                                        text: 'Zoom',
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          print(
                                              " Seleted Value: ${widget.selectedValue}");
                                          Get.bottomSheet(
                                              const ReuseBottomSheet());
                                        },
                                        child: const ReuseZoomCointainer(
                                          imagePath:
                                              'assets/images/callicon.png',
                                          text: 'Phone call',
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const ReuseZoomCointainer(
                                          imagePath:
                                              'assets/images/pinicon.png',
                                          text: 'In-person meeting',
                                        ),
                                      ),
                                      const Spacer(),
                                      const ReuseZoomCointainer(
                                        imagePath:
                                            'assets/images/downarrowicon.png',
                                        text: 'In-person meeting',
                                        borderColor: Colors.transparent,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            else
                              InkWell(
                                onTap: () {
                                  Get.bottomSheet(const ReuseBottomSheet());
                                },
                                child: Card(
                                  child: ListTile(
                                    title: Text(widget.selectedValue!['title']
                                        .toString()),
                                    subtitle: widget
                                            .buttomwidgetValue!.isNotEmpty
                                        ? Text(
                                            widget.buttomwidgetValue.toString())
                                        : null,
                                    leading: Image(
                                        width: 20.w,
                                        height: 20.h,
                                        image: AssetImage(
                                            widget.selectedValue!['Icons'])),
                                    trailing: InkWell(
                                      onTap: () {
                                        setState(() {
                                          widget.selectedValue = null;
                                          print(
                                              'check cut seleted value : ${widget.selectedValue} ');
                                        });
                                      },
                                      child: const ImageIcon(
                                          color: Colors.red,
                                          AssetImage(
                                              'assets/images/cross.png')),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        () => controller.dropDownButtonMintsValue.value ==
                                'Custum'
                            ? const SizedBox()
                            : SizedBox(
                                height: 41.h,
                              ),
                      ),
                      // SizedBox(
                      //   height: 17.h,
                      // ),
                      if (widget.selectedValue != null &&
                          widget.buttomwidgetValue != null)
                        SizedBox(
                          height: 75.h,
                        )
                      else if (widget.selectedValue != null)
                        SizedBox(
                          height: 85.h,
                        )
                      else
                        const SizedBox(),

                      const Divider(),
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
                    ],
                  ),
                  Container(
                    color: Colors.grey.shade100,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h),
                      child: Material(
                        elevation: 6,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                height: 45.h,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade800,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 5.w),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ReuseText(
                                            text: 'This is a preview.',
                                            color: Colors.white,
                                            size: 11,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          ReuseText(
                                            text:
                                                ' To book an event, share the link',
                                            color: Colors.white,
                                            size: 11,
                                          ),
                                        ],
                                      ),
                                      ReuseText(
                                        text:
                                            ' To book an event, share the link',
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
                              const ReuseText(
                                text: 'Jibran Talib',
                                color: Color(0xff757575),
                                fontWeight: FontWeight.bold,
                              ),
                              ReuseText(
                                text: 'Event name here',
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold,
                                size: 22,
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
                                    size: 25.h,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Obx(
                                    () => ReuseText(
                                      text: controller
                                          .dropDownButtonMintsValue.value,
                                      color: const Color(0xff757575),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              const Divider()
                            ],
                          ),
                        ),
                      ),
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
