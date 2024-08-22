import 'package:calendly_clone/controller/get_controller.dart';
import 'package:calendly_clone/utils/reuseable_button.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:calendly_clone/view/login_screen.dart';
import 'package:calendly_clone/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    print('Rebuild code jibran');
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Image(
                      width: MediaQuery.of(context).size.width * 0.35,
                      image: const AssetImage('assets/images/longicon.png')),
                ],
              ),
              ReuseText(
                text: 'Connect \nwith Calendly',
                color: Colors.black.withOpacity(0.7),
                size: 36,
                fontWeight: FontWeight.bold,
              ),
              const ReuseText(
                text: 'On the go',
                size: 36,
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  controller.createLoading.value = true;
                  Get.to(const LoginScreen());
                },
                child: Obx(
                  () => ReuseButton(
                    widget: controller.createLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const ReuseText(
                            text: 'Create an account',
                            color: Colors.white,
                            size: 16,
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  controller.signupLoading.value = true;
                  Get.to(const SignupScreen());
                },
                child: Obx(
                  () => ReuseButton(
                    widget: controller.signupLoading.value
                        ? const CircularProgressIndicator(
                            color: Color(0xff0047ff),
                          )
                        : const ReuseText(
                            text: 'Sign in',
                            size: 16,
                          ),
                    buttoncolor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
