import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const SizedBox(
            height: 30,
          ),
          Material(
            elevation: 3,
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
                    const ReuseText(
                      text: 'Enter your email to get started.',
                      size: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff0047ff)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
