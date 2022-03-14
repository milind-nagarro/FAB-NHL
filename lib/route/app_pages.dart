import 'package:fab_nhl/module/login/login_pin_screen.dart';
import 'package:fab_nhl/module/login/login_screen.dart';
import 'package:fab_nhl/module/login/login_screen_binder.dart';
import 'package:fab_nhl/module/login/unlock_pin_binder.dart';
import 'package:fab_nhl/module/login/unlock_pin_screen.dart';
import 'package:fab_nhl/module/register/register.dart';
import 'package:fab_nhl/module/register/register_mobile_binder.dart';
import 'package:fab_nhl/module/setuppin/setup_confirm_pin_binder.dart';
import 'package:fab_nhl/module/setuppin/setup_confirm_pin_page.dart';
import 'package:fab_nhl/module/verification/verification.dart';
import 'package:fab_nhl/module/verification/verification_binder.dart';
import 'package:fab_nhl/module/welcome/welcome_screen.dart';
import 'package:fab_nhl/module/welcome/welcome_screen_binder.dart';
import 'package:fab_nhl/route/route_paths.dart' as path;
import 'package:get/get.dart';

class AppPages {
  static const initialPath = path.welcome;

  static final routes = [
    GetPage(
        name: path.welcome,
        page: () => const WelcomeScreen(),
        binding: WelcomeBinder()),
    GetPage(
        name: path.registerMobile,
        page: () => const Register(true),
        binding: RegisterMobileBinder()),
    GetPage(
        name: path.registerEmail,
        page: () => const Register(false),
        binding: RegisterMobileBinder()),
    GetPage(
        name: path.verificationMobile,
        page: () => const Verification(true),
        binding: VerificationBinder()),
    GetPage(
        name: path.verificationEmail,
        page: () => const Verification(false),
        binding: VerificationBinder()),
    GetPage(
        name: path.setupPin,
        page: () => SetupConfirmPinPage(
              isConfirmation: false,
            ),
        binding: SetupConfirmPinBinder()),
    GetPage(
        name: path.login,
        page: () => const LoginScreen(),
        binding: LoginScreenBinder()),
    GetPage(
        name: path.confirmPin,
        page: () => SetupConfirmPinPage(isConfirmation: true),
        binding: SetupConfirmPinBinder()),
    GetPage(
        name: path.loginPin,
        page: () => const LoginPinScreen(),
        binding: LoginScreenBinder()),
    GetPage(
        name: path.unlockPinScreen,
        page: () => const UnlockPinScreen(),
        binding: UnlockPinScreenBinder()),
  ];
}
