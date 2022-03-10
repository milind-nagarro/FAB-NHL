import 'package:get/get.dart';

import 'register_mobile_controller.dart';

class RegisterMobileBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterMobileController());
  }
}
