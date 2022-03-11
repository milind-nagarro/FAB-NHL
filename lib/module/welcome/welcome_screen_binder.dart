import 'package:fab_nhl/module/welcome/welcome_screen_controller.dart';
import 'package:get/get.dart';

class WelcomeBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }
}
