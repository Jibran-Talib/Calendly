import 'dart:convert';

import 'package:calendly_clone/utils/api%20services/api_urls.dart';
import 'package:calendly_clone/view/home_screen.dart';
import 'package:calendly_clone/view/sign_up_screen.dart';
import 'package:calendly_clone/widgets/reuseable_button.dart';
import 'package:calendly_clone/widgets/reuseable_text.dart';
import 'package:calendly_clone/widgets/reuseable_textformField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  bool passwardHide = false;

  final _formkey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwardTextEditingController = TextEditingController();
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
                text: 'Login with Calendly for free',
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
                          text: 'Enter your email for login',
                          size: 13,
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                SizedBox(
                                    height: 35.3.h,
                                    child: ReuseTextFormField(
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
                            if (_formkey.currentState!.validate()) {
                              _postfunc(emailTextEditingController.text,
                                  passwardTextEditingController.text);
                              Get.to(const HomeScreen());
                            }
                          },
                          child: const ReuseButton(
                              buttonheight: 39.29,
                              widget: ReuseText(
                                text: 'Continues',
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
                        SizedBox(
                          height: 20.h,
                        ),
                        ReuseButton(
                            buttonheight: 40,
                            buttoncolor: Colors.white,
                            bordercolor: const Color(0xff757575),
                            widget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/google.png'),
                                SizedBox(
                                  width: 10.w,
                                ),
                                const ReuseText(
                                  text: 'Login with Google',
                                  color: Color(0xff757575),
                                  size: 12,
                                )
                              ],
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        ReuseButton(
                            buttonheight: 40,
                            buttoncolor: Colors.white,
                            bordercolor: const Color(0xff757575),
                            widget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/microsoft.png',
                                  height: 25.h,
                                  width: 25.w,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                const ReuseText(
                                  text: 'Login with Microsoft',
                                  color: Color(0xff757575),
                                  size: 12,
                                )
                              ],
                            )),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            const ReuseText(
                              text: 'Don’t have an account?',
                              color: Color(0xff757575),
                              size: 10,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const SignupScreen());
                              },
                              child: const ReuseText(
                                text: 'Signup',
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

  void _postfunc(String email, passward) async {
    var body = jsonEncode({
      'email': email,
      'password': passward,
    });

    var response = await http.post(Uri.parse(ApiUrls.loginAccountUrl),
        headers: {'Content-Type': 'application/json'}, body: body);

    if (response.statusCode == 200) {
      print('suceffuly login');
      var data = jsonDecode(response.body);
      print('respose data : $data');
    } else {
      print('Error and response statecode : ${response.statusCode}');
    }
  }
}
