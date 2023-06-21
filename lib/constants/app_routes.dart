import 'package:get/get.dart';
import 'package:oloworay_autos_/pages/authentication/forget_password/forget_password.dart';
import 'package:oloworay_autos_/pages/authentication/reset_password/reset_successful.dart';
import 'package:oloworay_autos_/pages/authentication/sign_in/sign_in.dart';
import 'package:oloworay_autos_/pages/authentication/verification/sign_up_otp/otp.dart';
import 'package:oloworay_autos_/pages/splash/splash_screen.dart';

import '../pages/app_home/home.dart';
import '../pages/authentication/reset_password/reset_password.dart';
import '../pages/authentication/sign_up/sign_up.dart';
import '../pages/authentication/verification/forgot_password_otp/forgot_password_otp.dart';
import '../pages/onBoarding/onboarding_page.dart';

class Routes {
  static String onBoardingPage = '/onBoardingPage';
  static String splashScreen = '/';
  static String signUpPage = '/signUpPage';
  static String signInPage = '/signInPage';
  static String otp ='/OTP';
  static String forgetPassword = '/forgetPassword';
  static String forgetPasswordOtp = '/forgetPasswordOtp';
  static String resetPassword = '/resetPassword';
  static String resetSuccessful = '/resetSuccessful';
  static String myHomeScreen = '/MyHomeScreen';

}

final getPages = [
  GetPage(name: Routes.onBoardingPage,
      page: () => OnBoardingPage(),
  ),
  GetPage(name: Routes.splashScreen,
    page: () => MySplashscreen(),
  ),
  GetPage(name: Routes.signUpPage,
    page: () => const SignUpPage(),
  ),
  GetPage(name: Routes.signInPage,
    page: () => const SignInPage(),
  ),
  GetPage(name: Routes.otp,
    page: () => const OTP(),
  ),
  GetPage(name: Routes.forgetPassword,
    page: () => const ForgotPassword(),
  ),
  GetPage(name: Routes.forgetPasswordOtp,
    page: () => const ForgotPasswordOTP(),
  ),
  GetPage(name: Routes.resetPassword,
    page: () => const ResetPassword(),
  ),
  GetPage(name: Routes.resetSuccessful,
    page: () => const PasswordResetSuccessful(),
  ),
  GetPage(name: Routes.myHomeScreen,
    page: () => const MyHomeScreen(),
  ),
];
