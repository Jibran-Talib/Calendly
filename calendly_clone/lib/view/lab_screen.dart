import 'package:flutter/material.dart';

class LabScreen extends StatelessWidget {
  const LabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage('assets/images/cross.png'))),
        ),
      ),
    );
  }
}
