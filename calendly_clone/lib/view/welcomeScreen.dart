import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 45,
            ),
            Container(
              color: Colors.red,
              child: Image(
                  width: Get.width * 0.5,
                  image: const AssetImage('assets/images/longicon.png')),
            ),
            const ReuseText(
              text: 'Connect \nwith Calendly',
              color: Colors.black87,
              size: 36,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}
