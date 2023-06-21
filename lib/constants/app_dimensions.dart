import 'package:get/get.dart';

class AppDimension {

  //screen Height and Width
  static final double screenHeight = Get.context!.height;
  static final double screenWidth = Get.context!.width;

  static double getProportionateScreenHeight(double inputHeight) {
    double screenHeight = AppDimension.screenHeight;
    return (inputHeight / 812.0) * screenHeight;
  }

  static double getProportionateScreenWidth(double inputWidth) {
    double screenWidth = AppDimension.screenWidth;
    return (inputWidth / 375.0) * screenWidth;
  }

  //app height
  static final double height4 = (screenHeight / 812) * 4;
  static final double height6 = (screenHeight / 812) * 6;
  static final double height8 = (screenHeight / 812) * 8;
  static final double height10 = (screenHeight / 812) * 10;
  static final double height12 = (screenHeight / 812) * 12;
  static final double height13 = (screenHeight / 812) * 13;
  static final double height14 = (screenHeight / 812) * 14;
  static final double height16 = (screenHeight / 812) * 16;
  static final double height20 = (screenHeight / 812) * 20;
  static final double height24 = (screenHeight / 812) * 24;
  static final double height28 = (screenHeight / 812) * 28;
  static final double height30 = (screenHeight / 812) * 30;
  static final double height36 = (screenHeight / 812) * 36;
  static final double height52 = (screenHeight / 812) * 52;
  static final double height100 = (screenHeight / 812) * 100;

  //app width
  static final double width4 = (screenWidth / 375) * 4;
  static final double width6 = (screenWidth / 375) * 6;
  static final double width8 = (screenWidth / 375) * 8;
  static final double width10 = (screenWidth / 375) * 10;
  static final double width12 = (screenWidth / 375) * 12;
  static final double width13 = (screenWidth / 375) * 13;
  static final double width14 = (screenWidth / 375) * 14;
  static final double width16 = (screenWidth / 375) * 16;
  static final double width20 = (screenWidth / 375) * 20;
  static final double width24 = (screenWidth / 375) * 24;
  static final double width30 = (screenWidth / 375) * 30;
  static final double width52 = (screenWidth / 375) * 52;


  //app font size
  static final double font32 = (screenHeight / 812) * 32;
  static final double font22 = (screenHeight / 812) * 22;
  static final double font20 = (screenHeight / 812) * 20;
  static final double font18 = (screenHeight / 812) * 18;
  static final double font16 = (screenHeight / 812) * 16;
  static final double font14 = (screenHeight / 812) * 14;
  static final double font12 = (screenHeight / 812) * 12;
  static final double font10 = (screenHeight / 812) * 10;
  static final double font8 = (screenHeight / 812) * 8;
}


