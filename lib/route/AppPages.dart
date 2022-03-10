import 'package:fab_nhl/module/login/LoginPinScreen.dart';
import 'package:fab_nhl/module/login/login_screen.dart';
import 'package:fab_nhl/module/login/login_screen_binder.dart';
import 'package:fab_nhl/module/register/register_mobile.dart';
import 'package:fab_nhl/module/register/register_mobile_binder.dart';
import 'package:fab_nhl/module/setuppin/SetupConfirmPinBinder.dart';
import 'package:fab_nhl/module/setuppin/SetupConfirmPinPage.dart';
import 'package:fab_nhl/module/verification/Verification.dart';
import 'package:fab_nhl/module/verification/VerificationBinder.dart';
import 'package:fab_nhl/module/welcome/welcome_screen.dart';
import 'package:fab_nhl/module/welcome/welcome_screen_binder.dart';
import 'package:fab_nhl/route/RoutePaths.dart' as path;
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = path.welcome;

  static final routes = [
    GetPage(
        name: path.welcome,
        page: () => const WelcomeScreen(),
        binding: WelcomeBinder()),
    GetPage(
        name: path.registerMobile,
        page: () => const RegisterMobile(true),
        binding: RegisterMobileBinder()),
    GetPage(
        name: path.registerEmail,
        page: () => const RegisterMobile(false),
        binding: RegisterMobileBinder()),
    GetPage(
        name: path.verification,
        page: () => const Verification(),
        binding: VerificationBinder()),
    GetPage(
        name: path.setupPin,
        page: () => const SetupConfirmPinPage(
              isConfirmation: false,
            ),
        binding: SetupConfirmPinBinder()),
    GetPage(
        name: path.login,
        page: () => const LoginScreen(),
        binding: LoginScreenBinder()),
    GetPage(
        name: path.confirmPin,
        page: () => const SetupConfirmPinPage(isConfirmation: true),
        binding: SetupConfirmPinBinder()),
    GetPage(
        name: path.loginPin,
        page: () => const LoginPinScreen(),
        binding: LoginScreenBinder()),
  ];
}
