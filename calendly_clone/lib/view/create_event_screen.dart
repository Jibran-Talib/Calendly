import 'package:calendly_clone/controller/get_controller.dart';
import 'package:calendly_clone/utils/api%20services/api_functions.dart';
import 'package:calendly_clone/utils/api%20services/api_urls.dart';
import 'package:calendly_clone/utils/api%20services/generate_auto_token.dart';
import 'package:calendly_clone/view/event_preview_screen.dart';
import 'package:calendly_clone/view/home_screen.dart';
import 'package:calendly_clone/widgets/reuseable_button.dart';
import 'package:calendly_clone/widgets/reuseable_text.dart';
import 'package:calendly_clone/widgets/reuseable_textformField.dart';
import 'package:calendly_clone/widgets/reuseable_zoom_container.dart';
import 'package:calendly_clone/widgets/reuseble_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
  TextEditingController eventNameTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());

    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
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
                          Get.to(() => const HomeScreen());
                        },
                        icon: const Icon(
                            color: Color(0xff757575), Icons.arrow_back_ios)),
                    const ReuseText(
                        text: 'Cancel', size: 13, color: Color(0xff757575)),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 24.w,
                    ),
                    const ReuseText(
                      text: 'New Event Type',
                      size: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
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
                SizedBox(
                  height: Get.height * 0.66,
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
                                  textEditingController:
                                      eventNameTextEditingController,
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
                                    border: Border.all(
                                        color: const Color(0xff757575))),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 11.w),
                                  child: DropdownButtonHideUnderline(
                                    child: Obx(
                                      () => DropdownButton(
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
                              Obx(
                                () => controller
                                            .dropDownButtonMintsValue.value ==
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
                                                          const Color(
                                                              0xff757575),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      textEditingController:
                                                          controller
                                                              .textEditingController
                                                              .value,
                                                    ),
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
                                          imagePath:
                                              'assets/images/zoomicon.png',
                                          text: 'Zoom',
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
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
                                      subtitle:
                                          widget.buttomwidgetValue!.isNotEmpty
                                              ? Text(widget.buttomwidgetValue
                                                  .toString())
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
                              child: InkWell(
                                onTap: () async {
                                  print(
                                      " int condition check${controller.dropDownButtonMintsHourValue.value.toString()}");
                                  int duration = controller
                                                  .dropDownButtonMintsValue
                                                  .value ==
                                              'Custum' &&
                                          controller
                                                  .dropDownButtonMintsHourValue
                                                  .value ==
                                              'hrs'
                                      ? int.parse(controller.textEditingController.value.text.toString()) *
                                          60
                                      : controller.dropDownButtonMintsValue
                                                      .value ==
                                                  'Custum' &&
                                              controller
                                                      .dropDownButtonMintsHourValue
                                                      .value ==
                                                  'min'
                                          ? int.parse(controller
                                              .textEditingController.value.text
                                              .toString())
                                          : int.parse(controller.dropDownButtonMintsValue.value.substring(0, 2));
                                  print("duration Time : $duration");

                                  var body = {
                                    'title':
                                        eventNameTextEditingController.text,
                                    'duration': duration,
                                    'link': 'www.google.com',
                                  };
                                  Apifunctions()
                                      .postApiFunc(ApiUrls.bookingCreate, body)
                                      .then((value) {
                                    eventNameTextEditingController.clear();
                                    Get.to(() => const HomeScreen());
                                  });
                                },
                                child: ReuseButton(
                                    buttonheight: 28.h,
                                    widget: const ReuseText(
                                      text: 'Confirm',
                                      size: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    EventPreviewScreen(
                      buttomwidgetValue: widget.buttomwidgetValue.toString(),
                      selectedValue: widget.selectedValue ?? {},
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
