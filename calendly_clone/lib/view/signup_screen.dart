import 'package:calendly_clone/utils/reuseable_button.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:calendly_clone/utils/reuseable_textformField.dart';
import 'package:calendly_clone/view/home_screen.dart';
import 'package:calendly_clone/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                text: 'Sign up with Calendly for free',
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
                  height: 396.h,
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
                        SizedBox(
                            height: 35.3.h, child: const ReuseTextFormField()),
                        SizedBox(
                          height: 20.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const HomeScreen());
                          },
                          child: const ReuseButton(
                              buttonheight: 39.29,
                              widget: ReuseText(
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
                                  text: 'Sign up with Google',
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
                                  text: 'Sign up with Microsoft',
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
                              text: 'Already have an account?',
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
                                text: 'Sign up',
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
