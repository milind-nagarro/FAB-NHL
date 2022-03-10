import 'package:get/get.dart';
import 'package:fab_nhl/route/RoutePaths.dart' as path;

class SetupConfirmController extends GetxController {

  var pin = "".obs;

  void onPinTextChanged(String value) {
    pin(value);
  }

  void navigateToConfirmPin() {
    Get.toNamed(path.confirmPin);
  }

}