import 'package:fab_nhl/route/RoutePaths.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  TextEditingController textController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final  pin = "".obs ;
  dynamic argumentData = Get.arguments;
  late String mobileNumber;

  @override
  void onInit() {
    // TODO: implement onInit
    mobileNumber = argumentData[0];
  }

  void onPinTextChanged(String value) {
    pin(value);
  }

  void navigateToEmailRegister() {
    Get.toNamed(setupPin);
  }

  String formatedTime(int secTime) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = secTime ~/ 60;
    int sec = (secTime % 60) ;

    String parsedTime =
        min.toString() + " minute " + getParsedTime(sec.toString()+ " seconds");

    return parsedTime;
  }
}
