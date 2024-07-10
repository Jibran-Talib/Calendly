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
}
