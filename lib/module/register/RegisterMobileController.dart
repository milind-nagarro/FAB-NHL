import 'package:get/get.dart';

class RegisterMobileController extends GetxController {

  String? validatePhone(String value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return 'empty_mobile_error'.tr;
    }
    return null;
  }
}
