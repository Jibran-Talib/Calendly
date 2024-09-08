import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ReuseProgressIndicater extends StatelessWidget {
  final Color color;
  const ReuseProgressIndicater({super.key, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      size: 30,
      color: color,
    );
  }
}
