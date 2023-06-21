import 'package:get/get.dart';

class SplashScreenController extends GetxController{

  @override
  void onInit() {
    _navigateToOnBoardingPage();
    super.onInit();
  }

  _navigateToOnBoardingPage() async{
    await Future.delayed(const Duration(milliseconds: 2000), (){});
    Get.offNamed('/onBoardingPage');
  }

}