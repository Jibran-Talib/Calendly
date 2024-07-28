import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:calendly_clone/utils/reuseable_textformField.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseRadiobotton extends StatefulWidget {
  const ReuseRadiobotton({super.key});

  @override
  State<ReuseRadiobotton> createState() => _ReuseRadiobottonState();
}

class _ReuseRadiobottonState extends State<ReuseRadiobotton> {
  TextEditingController countryCodeTextEdiditionController =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryCodeTextEdiditionController.text = '+92';
  }

  int _selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  "Calendly will require your invitee's phone number before scheduling. ",
              color: Color(0xff757575),
              size: 12,
            ),
            value: 1,
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
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
                  "Calendly will provide your number after the call has been scheduled ",
              color: Color(0xff757575),
              size: 12,
            ),
            value: 2,
            groupValue: _selectedValue,
            onChanged: (value) {
              setState(() {
                _selectedValue = value!;
              });
            },
          ),
          _selectedValue == 2
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: ReuseTextFormField(
                    textEditingController: countryCodeTextEdiditionController,
                    keyboardType: TextInputType.phone,
                    enabledBorderColor: const Color(0xff757575),
                    prefixIcon: SizedBox(
                      width: 84.w,
                      child: CountryCodePicker(
                        hideMainText: true,
                        alignLeft: true,
                        onChanged: (value) {
                          print('Contry code value $value');
                          setState(() {
                            countryCodeTextEdiditionController.text =
                                value.toString();
                            print(
                                'textediditng value: ${countryCodeTextEdiditionController.text}');
                          });
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
    );
  }
}
