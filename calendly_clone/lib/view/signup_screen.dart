import 'package:calendly_clone/utils/reuseable_button.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: InkWell(
                  onTap: () {}, child: ReuseButton(widget: Text('button'))))
        ],
      ),
    );
  }
}
