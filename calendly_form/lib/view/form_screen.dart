import 'dart:convert';

import 'package:calendly_form/services/api_url.dart';
import 'package:calendly_form/widgets/reuse_snakbar.dart';
import 'package:calendly_form/widgets/reuseable_button.dart';
import 'package:calendly_form/widgets/reuseable_textformField.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var picked = DateTime.now();
  var time = TimeOfDay.now();
  final _formkey = GlobalKey<FormState>();

  TextEditingController fullNameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime _selectedDate = DateTime(picked.year, picked.month, picked.day);
    var _selectedTime = picked.toString().split(' ');

    print("_selectedDate : $_selectedDate");
    print("_selectedTime : $_selectedTime");
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Meeting Details',
            style: TextStyle(color: Color(0xff757575)),
          )),
      body: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    ReuseTextFormField(
                      enabledBorderColor: const Color(0xff757575),
                      focusedBorderColor: const Color(0xff0047ff),
                      hintText: 'full name',
                      textEditingController: fullNameEditingController,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ReuseTextFormField(
                      enabledBorderColor: const Color(0xff757575),
                      focusedBorderColor: const Color(0xff0047ff),
                      hintText: 'email',
                      textEditingController: emailEditingController,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 160.w,
                          child: TextField(
                            onTap: () {
                              setState(() async {
                                await _datepicker();
                                setState(() {});
                              });
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText:
                                    _selectedTime.toString().substring(0, 10),
                                prefixIcon: const Icon(Icons.calendar_today),
                                filled: true,
                                helperStyle:
                                    const TextStyle(color: Color(0xff757575)),
                                helperText: 'Set date',
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                        SizedBox(
                          width: 160.w,
                          child: TextField(
                            onTap: () async {
                              await _timePicker();
                              setState(() {});
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                                hintText: '${time.hour}:${time.minute}',
                                prefixIcon: const Icon(Icons.access_time),
                                filled: true,
                                helperStyle:
                                    const TextStyle(color: Color(0xff757575)),
                                helperText: 'set Time',
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    InkWell(
                      onTap: () async {
                        await postApiFunc();
                      },
                      child: const ReuseButton(
                          widget: Text(
                        'Submit',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Future<void> _datepicker() async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: picked,
        firstDate: DateTime(2020),
        lastDate: DateTime(2050));

    if (selectedDate != null && selectedDate != picked) {
      // Only update if a new date is picked
      setState(() {
        picked = selectedDate; // Update the global picked variable
      });
    }
  }

  Future<void> _timePicker() async {
    var pickedTime = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (pickedTime != null && pickedTime != time) {
      setState(() {
        time =
            pickedTime; // Update the state variable with the newly picked time
      });
      print('${pickedTime.hour}:${pickedTime.minute}'); // Display picked time
    } else {
      print('Time not selected');
    }
  }

  Future<void> postApiFunc() async {
    try {
      var body = jsonEncode({
        'fullname': fullNameEditingController.text,
        'email': emailEditingController.text,
        'schedule_dt': '$picked ${time.hour}:${time.minute}',
        'message': '',
      });
      var response = await http.post(Uri.parse(ApiUrls.scheduleCreate),
          headers: {
            "Access-Control-Allow-Origin: *"
                'Content-Type': 'application/json',
          },
          body: body);

      if (response.statusCode == 200) {
        ReuseSnakbar().snakbar(response.body);
      } else {
        ReuseSnakbar().snakbar(response.body + response.statusCode.toString());
      }
    } catch (e) {
      print('try error : $e');
    }
  }
}
