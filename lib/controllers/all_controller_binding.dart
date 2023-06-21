import 'package:get/get.dart';
import 'package:oloworay_autos_/controllers/on_boarding_page_controller.dart';
import 'package:oloworay_autos_/controllers/sign_in_controller.dart';
import 'package:oloworay_autos_/controllers/splash_controller.dart';


class AllControllerBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController());
    Get.lazyPut<OnBoardingPageController>(() => OnBoardingPageController());
    Get.put<UserSignInFormController>(UserSignInFormController());
  }

}