import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class BottomSheetController extends GetxController {
  List<Map<String, dynamic>> newEventBottomSheet = [
    {'title': 'Phone Call', 'Icons': Icons.call_outlined},
    {'title': 'In-person meeting', 'Icons': Icons.pin_drop_rounded},
    {'title': 'Phone Call', 'Icons': Icons.call_outlined},
    {'title': 'Phone Call', 'Icons': Icons.call_outlined},
    {'title': 'Phone Call', 'Icons': Icons.call_outlined},
  ].obs;

  RxString? seletedValue;
}
