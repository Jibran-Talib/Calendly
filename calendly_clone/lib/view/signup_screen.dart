import 'package:calendly_clone/utils/reuseable_button.dart';
import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:calendly_clone/utils/reuseable_textformField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  image: AssetImage('assets/images/longicon.png')),
            ),
            ReuseText(
              text: 'Sign up with Calendly for free',
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              size: 16,
            ),
            const SizedBox(
              height: 30,
            ),
            Material(
              elevation: 2,
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
                  padding: EdgeInsets.all(26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReuseText(
                        text: 'Enter your email to get started.',
                        size: 13,
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(height: 35.3, child: ReuseTextFormField()),
                      SizedBox(
                        height: 20,
                      ),
                      ReuseButton(
                          buttonheight: 39.29,
                          widget: ReuseText(
                            text: 'Get Started',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 123,
                            child: Divider(),
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
                            child: Divider(),
                          ),
                        ],
                      ),
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
