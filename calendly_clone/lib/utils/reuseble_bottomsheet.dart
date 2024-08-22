import 'package:calendly_clone/controller/bottom_sheet_controller.dart';
import 'package:calendly_clone/utils/reuseable_button.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:calendly_clone/utils/reuseable_textformField.dart';
import 'package:calendly_clone/view/create_event_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReuseBottomSheet extends StatefulWidget {
  const ReuseBottomSheet({super.key});

  @override
  State<ReuseBottomSheet> createState() => _ReuseBottomSheetState();
}

class _ReuseBottomSheetState extends State<ReuseBottomSheet> {
  TextEditingController countryCodeTextEdiditionController =
      TextEditingController();

  TextEditingController textEditingController = TextEditingController();

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
    countryCodeTextEdiditionController.text = '+92';
    print('init funtion check  ${textEditingController.text}');
  }

  int _radioselectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.97,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: SingleChildScrollView(
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
                            hint: const Text('Select Platform'),
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
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.w),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      RadioListTile(
                        activeColor: const Color(0xff0047ff),
                        title: const ReuseText(
                          text: 'I will call my invite',
                          color: Colors.black,
                        ),
                        subtitle: const ReuseText(
                          text:
                              "Calendly will require your invitee's phone number before scheduling.",
                          color: Color(0xff757575),
                          size: 12,
                        ),
                        value: 1,
                        groupValue: _radioselectedValue,
                        onChanged: (value) {
                          setState(() {
                            _radioselectedValue = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        activeColor: const Color(0xff0047ff),
                        title: const ReuseText(
                          text: 'My invitee should call me',
                          color: Colors.black,
                        ),
                        subtitle: const ReuseText(
                          text:
                              "Calendly will provide your number after the call has been scheduled.",
                          color: Color(0xff757575),
                          size: 12,
                        ),
                        value: 2,
                        groupValue: _radioselectedValue,
                        onChanged: (value) {
                          setState(() {
                            _radioselectedValue = value!;
                          });
                        },
                      ),
                      _radioselectedValue == 2
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: ReuseTextFormField(
                                textEditingController:
                                    countryCodeTextEdiditionController,
                                keyboardType: TextInputType.phone,
                                enabledBorderColor: const Color(0xff757575),
                                prefixIcon: SizedBox(
                                  width: 84.w,
                                  child: CountryCodePicker(
                                    hideMainText: true,
                                    alignLeft: true,
                                    onChanged: (value) {
                                      print('Country code value $value');
                                      setState(() {
                                        countryCodeTextEdiditionController
                                            .text = value.toString();
                                      });
                                      print(
                                          'textEditing value: ${countryCodeTextEdiditionController.text}');
                                    },
                                    initialSelection: 'Pk',
                                    hideSearch: true,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                )
              else if (_selectedValue!['title'] == 'In-person meeting' ||
                  _selectedValue!['title'] == 'Custom')
                Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    ReuseTextFormField(
                      enabledBorderColor: const Color(0xff757575),
                      textEditingController: textEditingController,
                      hintText: _selectedValue!['title'] == 'In-person meeting'
                          ? 'Write address'
                          : 'Write your text here',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                )
              else
                SizedBox(
                  height: 10.h,
                ),
              InkWell(
                  onTap: () {
                    String setButtomwidgetValue;
                    if (_radioselectedValue == 2 &&
                        _selectedValue!['title'] == 'Phone Call') {
                      setButtomwidgetValue =
                          countryCodeTextEdiditionController.text;
                    } else {
                      setButtomwidgetValue = textEditingController.text;
                    }
                    print(
                        'Country code text Controller: ${countryCodeTextEdiditionController.text}');
                    print(
                        'Simple text Controller: ${textEditingController.text}');
                    print('setButtomwidgetValue: $setButtomwidgetValue');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateEventScreen(
                            selectedValue: _selectedValue,
                            buttomwidgetValue: setButtomwidgetValue,
                          ),
                        ));
                  },
                  child: const ReuseButton(
                      widget: ReuseText(
                    text: 'Select',
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
