import 'package:get/get.dart';

class SetupConfirmController extends GetxController {

  RxString pin = "".obs;

  void onPinTextChanged(String value) {
    pin.value = value;
  }

}