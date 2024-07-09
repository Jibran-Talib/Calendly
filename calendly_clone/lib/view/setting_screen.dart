import 'package:calendly_clone/utils/reuseable_text.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          title: const ReuseText(
            text: 'Setting',
            color: Colors.black,
            size: 20,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xff0047ff)),
          // leading: Icon(Icons.arrow_back, color: ,),
        ),
      ),
    );
  }
}
