import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/constants/app_routes.dart';

import '../constants/app_strings.dart';
import '../models/onboarding_content_model.dart';

class OnBoardingPageController extends GetxController {
  RxInt currentPage = 0.obs;
  late PageController controller;
  var onBoardingContent = <Content>[].obs;

  @override
  void onInit() {
    super.onInit();
    controller = PageController(initialPage: 0);
    fetchContents();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  void nextPage() {
    if (currentPage.value == onBoardingContent.length - 1) {
      Get.toNamed(Routes.signUpPage);
    }
    controller.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceIn,
    );
  }

  void fetchContents() async {
    var result = [
      Content(headText: explore, text: bodyTextPage1, image: onBoarding1),
      Content(headText: explore, text: bodyTextPage2, image: onBoarding2),
      Content(headText: explore, text: bodyTextPage3, image: onBoarding3),
    ];

    onBoardingContent.value = result;
  }
}
