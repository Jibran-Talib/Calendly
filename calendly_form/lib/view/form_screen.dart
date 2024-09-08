import 'dart:convert';

import 'package:calendly_form/services/api_url.dart';
import 'package:calendly_form/widgets/reuse_progress_indicater.dart';
import 'package:calendly_form/widgets/reuse_snakbar.dart';
import 'package:calendly_form/widgets/reuseable_button.dart';
import 'package:calendly_form/widgets/reuseable_textformField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  bool loading = false;
  var picked = DateTime.now();
  var time = TimeOfDay.now();
  final _formkey = GlobalKey<FormState>();

  TextEditingController fullNameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    DateTime _selectedDate = DateTime(picked.year, picked.month, picked.day);
    var _selectedTime = picked.toString().split(' ');

    print("_selectedDate : $_selectedDate");
    print("_selectedTime : $_selectedTime");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: _size.width >= 700 ? 120.w : 12.w,
              vertical: _size.height >= 700 ? 100.w : 12.h),
          child: Material(
            borderRadius: BorderRadius.circular(5.w),
            color: Colors.white,
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: const Text(
                        'Meeting Details',
                        style:
                            TextStyle(color: Color(0xff757575), fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
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
                          SizedBox(
                            width: 400.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: _size.width >= 700 ? 48.w : 150.w,
                                  child: TextField(
                                    onTap: () {
                                      setState(() async {
                                        await _datepicker();
                                        setState(() {});
                                      });
                                    },
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        hintText: _selectedTime
                                            .toString()
                                            .substring(1, 11),
                                        prefixIcon:
                                            const Icon(Icons.calendar_today),
                                        filled: true,
                                        helperStyle: const TextStyle(
                                            color: Color(0xff757575)),
                                        helperText: 'Set date',
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                                SizedBox(
                                  width: _size.width >= 700 ? 48.w : 150.w,
                                  child: TextField(
                                    onTap: () async {
                                      await _timePicker();
                                      setState(() {});
                                    },
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors
                                                  .red), // Error border color
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: '${time.hour}:${time.minute}',
                                        prefixIcon:
                                            const Icon(Icons.access_time),
                                        filled: true,
                                        helperStyle: const TextStyle(
                                            color: Color(0xff757575)),
                                        helperText: 'set Time',
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide.none),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide.none)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        var body = {
                          'fullname': fullNameEditingController.text,
                          'email': emailEditingController.text,
                          'schedule_dt': '$picked ${time.hour}:${time.minute}',
                        };
                        print('body : $body');
                        if (_formkey.currentState!.validate()) {
                          await postApiFunc(body).then((value) {
                            fullNameEditingController.clear;
                            emailEditingController.clear;
                            setState(() {
                              loading = false;
                            });
                          });
                        }
                      },
                      child: ReuseButton(
                          widget: loading
                              ? const ReuseProgressIndicater()
                              : const Text(
                                  'Submit',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                    )
                  ],
                ),
              ),
            ),
          ),
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

  Future<void> postApiFunc(body) async {
    print('postApiFunc running');
    try {
      var response = await http.post(Uri.parse(await ApiUrls.scheduleCreate),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode(body));

      if (response.statusCode == 200 || response.statusCode == 201) {
        ReuseSnakbar().snakbar(response.body);
        print('postApiFunc ending');
      } else {
        print('postApiFunc ending');
        ReuseSnakbar().snakbar(response.body + response.statusCode.toString());
      }
    } catch (e) {
      print('try error : $e');
    }
  }
}
