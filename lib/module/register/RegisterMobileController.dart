import 'package:fab_nhl/route/RoutePaths.dart';
import 'package:get/get.dart';

class RegisterMobileController extends GetxController {
  final isvalidMobile = false.obs;

  validatePhone(String value) {
    isvalidMobile(false);
    if (value.isNotEmpty && value.length >5) {
      isvalidMobile(true);
    }
  }

  void navigateToVerification() {
    Get.toNamed(verification);
  }
}
