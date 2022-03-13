import 'package:fab_nhl/route/route_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';

class VerificationController extends GetxController {
  TextEditingController textController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final pin = "".obs;
  dynamic argumentData = Get.arguments;
  late String inputToVerify;
  late bool isMobileVerification;
  int otpValidDuration = 30; // in seconds
  final isExpired = false.obs;
  final CountdownController countdownController =
      CountdownController(autoStart: true);

  @override
  void onInit() {
    // TODO: implement onInit
    inputToVerify = argumentData[0];
    isMobileVerification = argumentData[1];
  }

  void onPinTextChanged(String value) {
    pin(value);
  }

  void navigateToEmailRegister() {
    if (isMobileVerification) {
      Get.toNamed(registerEmail);
    } else {
      Get.toNamed(setupPin);
    }
  }

  void resetTimer() {
    textController.clear();
    pin("");
    isExpired(false);
    countdownController.restart();
  }

  String formatedTime(int secTime) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = secTime ~/ 60;
    int sec = (secTime % 60);

    String parsedTime =
        "$min minute " + getParsedTime(sec.toString()) + " seconds";

    return parsedTime;
  }
}
