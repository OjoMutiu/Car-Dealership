import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/controllers/on_boarding_page_controller.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_dimensions.dart';

AnimatedContainer buildDot({required int index}) {
  OnBoardingPageController controller = Get.find();
  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    margin: EdgeInsets.only(right: AppDimension.getProportionateScreenWidth(5)),
    height: AppDimension.getProportionateScreenHeight(3),
    width: controller.currentPage.value == index
        ? AppDimension.getProportionateScreenHeight(24)
        : AppDimension.getProportionateScreenHeight(12),
    decoration: BoxDecoration(
      color: controller.currentPage.value == index
          ? AppColors.primary500
          : const Color(0xFF282828).withOpacity(0.28),
      borderRadius: BorderRadius.circular(AppDimension.getProportionateScreenWidth(1.0)),
    ),
  );
}
