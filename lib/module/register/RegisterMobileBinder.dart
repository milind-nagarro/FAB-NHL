import 'package:get/get.dart';

import 'RegisterMobileController.dart';

class RegisterMobileBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterMobileController());
  }
}
