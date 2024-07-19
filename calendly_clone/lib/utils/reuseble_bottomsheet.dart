import 'package:calendly_clone/controller/bottom_sheet_controller.dart';
import 'package:calendly_clone/utils/reuseable_button.dart';
import 'package:calendly_clone/utils/reuseable_radio_button.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:calendly_clone/view/create_event_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReuseBottomSheet extends StatefulWidget {
  const ReuseBottomSheet({super.key});

  @override
  State<ReuseBottomSheet> createState() => _ReuseBottomSheetState();
}

class _ReuseBottomSheetState extends State<ReuseBottomSheet> {
  BottomSheetController controller = Get.put(BottomSheetController());

  List<Map<String, dynamic>> newEventBottomSheet = [
    {'title': 'Phone Call', 'Icons': 'assets/images/telephone.png'},
    {'title': 'In-person meeting', 'Icons': 'assets/images/pinicon.png'},
    {'title': 'Ask inivite', 'Icons': 'assets/images/map.png'},
    {'title': 'Custom', 'Icons': 'assets/images/custom.png'},
    {'title': 'Zoom', 'Icons': 'assets/images/zoomicon.png'},
    {'title': 'Google Meet', 'Icons': 'assets/images/new.png'},
    {'title': 'Microsoft Teams', 'Icons': 'assets/images/microsoft.png'},
    {'title': 'Webex', 'Icons': 'assets/images/webex.png'},
  ].obs;

  Map<String, dynamic>? _selectedValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedValue = newEventBottomSheet[0];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: Get.width * 0.97,
        height: Get.height * 0.8,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ReuseText(
                text: 'Edit Location',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                size: 20,
              ),
              SizedBox(height: 5.h),
              Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: const Color(0xffD9D9D9)),
                  ),
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: const Color(0xffD9D9D9))),
                        child: Center(
                          child: DropdownButton(
                            hint: const Text('Selet Platfrom'),
                            value: _selectedValue,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            iconEnabledColor: const Color(0xff356eff),
                            alignment: Alignment.topCenter,
                            items: newEventBottomSheet
                                .map<DropdownMenuItem<Map<String, dynamic>>>(
                                    (e) {
                              return DropdownMenuItem<Map<String, dynamic>>(
                                  value: e,
                                  child: SizedBox(
                                    width: Get.width * 0.7,
                                    child: ListTile(
                                      title: Text(e['title'].toString()),
                                      leading: SizedBox(
                                          height: 20.h,
                                          width: 20.w,
                                          child: Image(
                                              image: AssetImage(e['Icons']))),
                                    ),
                                  ));
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value;
                                print('Check Value $_selectedValue');
                              });

                              // controller.seletedValue?.value = value!;
                            },
                          ),
                        ),
                      ),
                    ),
                  )),
              if (_selectedValue!['title'] == 'Phone Call')
                const ReuseRadiobotton()
              else
                const SizedBox(),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateEventScreen(
                            selectedValue: _selectedValue,
                          ),
                        ));
                  },
                  child: const ReuseButton(
                      widget: ReuseText(
                    text: 'select',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    size: 15,
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
