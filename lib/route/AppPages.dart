import 'package:fab_nhl/module/register/RegisterMobile.dart';
import 'package:fab_nhl/module/register/RegisterMobileBinder.dart';
import 'package:fab_nhl/module/setuppin/SetupConfirmPinBinder.dart';
import 'package:fab_nhl/module/setuppin/SetupConfirmPinPage.dart';
import 'package:fab_nhl/module/welcome/Welcome.dart';
import 'package:fab_nhl/module/welcome/WelcomeBinder.dart';
import 'package:fab_nhl/route/RoutePaths.dart' as path;
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = path.setupPin;

  static final routes = [
    GetPage(
        name: path.welcome, page: () => Welcome(), binding: WelcomeBinder()),
    GetPage(
        name: path.registerMobile,
        page: () => RegisterMobile(),
        binding: RegisterMobileBinder()),
    GetPage(
        name: path.setupPin,
        page: () => const SetupConfirmPinPage(),
        binding: SetupConfirmPinBinder())
  ];
}
