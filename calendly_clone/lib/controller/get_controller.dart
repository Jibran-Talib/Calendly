import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  RxBool createLoading = false.obs;
  RxBool signupLoading = false.obs;
  RxBool pushNotificationSwitch = false.obs;
  RxBool newSwitch = false.obs;
  RxBool reconfirmationsSwitch = false.obs;
  RxBool rescheduledSwitch = false.obs;
  RxBool canceledSwitch = false.obs;
  RxBool dartModeSwitch = false.obs;
  RxInt dropDownButtonIndex = 0.obs;
  RxString seleted_platfrom = ''.obs;
  Rx<IconData> seleted_platfrom_icon = Icons.phone.obs;

  Rx<TextEditingController> textEditingController = TextEditingController().obs;

  List<Color> dropDownButtonColors =
      [Colors.blue, Colors.red, Colors.green, Colors.purple, Colors.yellow].obs;

  Rx<Color> dropDownButtonValue = Colors.purple.obs;

  List<String> dropDownButtonMints = [
    '15 min',
    '30 min',
    '45 min',
    '60 min',
    'Custum',
  ].obs;
  RxString dropDownButtonMintsValue = '30 min'.obs;
  RxString dropDownButtonMintsValueforMeetingdetailScreen = '30 min'.obs;

  List<String> dropDownButtonMintsHour = [
    'min',
    'hrs',
  ].obs;
  RxString dropDownButtonMintsHourValue = 'min'.obs;
  RxString dropDownButtonMintsHourValueForMeetingDetailsScreen = 'min'.obs;
}
