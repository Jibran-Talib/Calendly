import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 45,
            ),
            Center(
              child: Image(
                  width: MediaQuery.of(context).size.width * 0.5,
                  image: AssetImage('assets/images/longicon.png')),
            ),
            const ReuseText(
              text: 'Sign up with Calendly for free',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              size: 16,
            ),
            SizedBox(
              height: 30,
            ),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 404,
                width: 326,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffd9d9d9)),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      // BoxShadow(
                      //     color: Colors.white,
                      //     blurRadius: 5,
                      //     spreadRadius: 1,
                      //     offset: Offset(0, 2))
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
