import 'dart:convert';

import 'package:calendly_clone/utils/api%20services/api_urls.dart';

import 'package:calendly_clone/view/login_screen.dart';
import 'package:calendly_clone/widgets/reuse_progress_indicater.dart';
import 'package:calendly_clone/widgets/reuse_snakbar.dart';
import 'package:calendly_clone/widgets/reuseable_button.dart';
import 'package:calendly_clone/widgets/reuseable_text.dart';
import 'package:calendly_clone/widgets/reuseable_textformField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool loading = false;
  bool passwardHide = false;

  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwardTextEditingController = TextEditingController();

  Future<void> _signUpfunc(
      String firstName, String lastName, String email, String password) async {
    setState(() {
      loading = true;
    });

    try {
      var body = jsonEncode({
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'password': password,
        'active': 1,
      });

      var response = await http.post(
        Uri.parse(ApiUrls.creteAccountUrl),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ReuseSnakbar().snakbar('Successfully created');
        Get.to(() => const LoginScreen());
      } else {
        ReuseSnakbar().snakbar(response.body);
        print('Sign-up failed. Status code: ${response.statusCode}');
        print('Error: ${response.body}');
      }
    } catch (e) {
      ReuseSnakbar().snakbar(e.toString());
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 45.h,
              ),
              Center(
                child: Image(
                    width: MediaQuery.of(context).size.width * 0.5,
                    image: const AssetImage('assets/images/longicon.png')),
              ),
              ReuseText(
                text: 'Signup with Calendly for free',
                color: Colors.black.withOpacity(0.7),
                fontWeight: FontWeight.bold,
                size: 16,
              ),
              SizedBox(
                height: 30.h,
              ),
              Material(
                elevation: 3,
                shadowColor: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 326.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xffd9d9d9)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        ReuseText(
                          text: 'Enter your email to get started.',
                          size: 13,
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                    // height: 35.3.h,
                                    child: ReuseTextFormField(
                                  textEditingController:
                                      firstNameTextEditingController,
                                  hintText: 'Firstname',
                                )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                    height: 35.3.h,
                                    child: ReuseTextFormField(
                                      textEditingController:
                                          lastNameTextEditingController,
                                      hintText: 'lastname',
                                    )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                    height: 35.3.h,
                                    child: ReuseTextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      textEditingController:
                                          emailTextEditingController,
                                      hintText: 'Email',
                                    )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SizedBox(
                                    height: 35.3.h,
                                    child: ReuseTextFormField(
                                      passwardVisible: !passwardHide,
                                      suffixIcon: passwardHide
                                          ? IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  passwardHide = !passwardHide;
                                                });
                                              },
                                              icon: const Icon(
                                                  Icons.remove_red_eye),
                                            )
                                          : IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  passwardHide = !passwardHide;
                                                });
                                              },
                                              icon: const Icon(
                                                  Icons.visibility_off),
                                            ),
                                      textEditingController:
                                          passwardTextEditingController,
                                      hintText: 'passward',
                                    )),
                              ],
                            )),

                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _signUpfunc(
                                  firstNameTextEditingController.text,
                                  lastNameTextEditingController.text,
                                  emailTextEditingController.text,
                                  passwardTextEditingController.text);
                            }
                          },
                          child: ReuseButton(
                              buttonheight: 39.29,
                              widget: loading
                                  ? const Center(
                                      child: ReuseProgressIndicater())
                                  : const ReuseText(
                                      text: 'Get Started',
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 123.w,
                              child: const Divider(
                                color: Color(0xff757575),
                              ),
                            ),
                            const Spacer(),
                            const ReuseText(
                              text: 'OR',
                              color: Color(0xff757575),
                              size: 10,
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 123.w,
                              child: const Divider(
                                color: Color(0xff757575),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // ReuseButton(
                        //     buttonheight: 40,
                        //     buttoncolor: Colors.white,
                        //     bordercolor: const Color(0xff757575),
                        //     widget: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Image.asset('assets/images/google.png'),
                        //         SizedBox(
                        //           width: 10.w,
                        //         ),
                        //         const ReuseText(
                        //           text: 'Log in with Google',
                        //           color: Color(0xff757575),
                        //           size: 12,
                        //         )
                        //       ],
                        //     )),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // ReuseButton(
                        //     buttonheight: 40,
                        //     buttoncolor: Colors.white,
                        //     bordercolor: const Color(0xff757575),
                        //     widget: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Image.asset('assets/images/microsoft.png'),
                        //         SizedBox(
                        //           width: 10.w,
                        //         ),
                        //         const ReuseText(
                        //           text: 'Log in with Microsoft ',
                        //           color: Color(0xff757575),
                        //           size: 12,
                        //         )
                        //       ],
                        //     )),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            const ReuseText(
                              text: 'Already have an account?',
                              color: Color(0xff757575),
                              size: 10,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const LoginScreen());
                              },
                              child: const ReuseText(
                                text: 'Login',
                                size: 10,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
