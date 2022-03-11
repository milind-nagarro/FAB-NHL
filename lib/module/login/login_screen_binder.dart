import 'package:fab_nhl/module/login/login_screen_controller.dart';
import 'package:get/get.dart';

class LoginScreenBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginScreenController());
  }
}
