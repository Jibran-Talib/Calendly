import 'package:calendly_clone/utils/reuseable_button.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:calendly_clone/utils/reuseable_textformField.dart';
import 'package:calendly_clone/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScren extends StatelessWidget {
  const LoginScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 45,
            ),
            Center(
              child: Image(
                  width: MediaQuery.of(context).size.width * 0.5,
                  image: const AssetImage('assets/images/longicon.png')),
            ),
            ReuseText(
              text: 'Log into your Calendly for free',
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              size: 16,
            ),
            const SizedBox(
              height: 30,
            ),
            Material(
              elevation: 3,
              shadowColor: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 396,
                width: 326,
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
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(height: 35.3, child: ReuseTextFormField()),
                      const SizedBox(
                        height: 20,
                      ),
                      const ReuseButton(
                          buttonheight: 39.29,
                          widget: ReuseText(
                            text: 'Continue',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 123,
                            child: Divider(
                              color: Color(0xff757575),
                            ),
                          ),
                          Spacer(),
                          ReuseText(
                            text: 'OR',
                            color: Color(0xff757575),
                            size: 10,
                          ),
                          Spacer(),
                          SizedBox(
                            width: 123,
                            child: Divider(
                              color: Color(0xff757575),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ReuseButton(
                          buttonheight: 40,
                          buttoncolor: Colors.white,
                          bordercolor: const Color(0xff757575),
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              const ReuseText(
                                text: 'Log in with Google',
                                color: Color(0xff757575),
                                size: 10,
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      ReuseButton(
                          buttonheight: 40,
                          buttoncolor: Colors.white,
                          bordercolor: const Color(0xff757575),
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/microsoft.png'),
                              const SizedBox(
                                width: 10,
                              ),
                              const ReuseText(
                                text: 'Log in with Microsoft ',
                                color: Color(0xff757575),
                                size: 10,
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const ReuseText(
                            text: 'Don’t have an account?',
                            color: Color(0xff757575),
                            size: 10,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(const SignUpScreen());
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
    );
  }
}
