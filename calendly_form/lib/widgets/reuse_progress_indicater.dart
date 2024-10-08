import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ReuseProgressIndicater extends StatelessWidget {
  const ReuseProgressIndicater({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCircle(
      size: 30,
      color: Colors.white,
    );
  }
}
