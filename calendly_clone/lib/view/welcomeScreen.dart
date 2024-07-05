import 'package:calendly_clone/controller/get_controller.dart';
import 'package:calendly_clone/utils/reuseable_button.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:calendly_clone/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    print('Rebuild code jibran');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 45,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Image(
                    width: MediaQuery.of(context).size.width * 0.35,
                    image: const AssetImage('assets/images/longicon.png')),
              ],
            ),
            const ReuseText(
              text: 'Connect \nwith Calendly',
              color: Colors.black87,
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
                Get.to(SignUpScreen());
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
              },
              child: Obx(
                () => ReuseButton(
                  widget: controller.signupLoading.value
                      ? const CircularProgressIndicator(
                          color: Color(0xff0047ff),
                        )
                      : const ReuseText(
                          text: 'Sign up',
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
    );
  }
}
