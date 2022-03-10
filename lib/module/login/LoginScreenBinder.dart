import 'package:fab_nhl/module/login/LoginScreenController.dart';
import 'package:get/get.dart';

class LoginScreenBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
  }
}
