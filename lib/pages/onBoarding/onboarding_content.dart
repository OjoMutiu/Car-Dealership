import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/controllers/on_boarding_page_controller.dart';

import '../../constants/app_dimensions.dart';

class OnBoardingContent extends StatelessWidget {
  OnBoardingContent({
    super.key,
    required this.headText,
    required this.text,
    required this.image,
  });
  final String headText, text, image;

  final OnBoardingPageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppDimension.getProportionateScreenHeight(20)),
        Obx(() {
          return Container(
            height: controller.currentPage.value ==
                    controller.onBoardingContent.length - 2
                ? AppDimension.getProportionateScreenHeight(300)
                : AppDimension.getProportionateScreenHeight(333),
            color: Colors.white,
            child: Image.asset(image),
          );
        }),
        Obx(() {
          return controller.currentPage.value ==
                  controller.onBoardingContent.length - 2
              ? SizedBox(height: AppDimension.getProportionateScreenHeight(63))
              : SizedBox(height: AppDimension.getProportionateScreenHeight(33));
        }),
        Text(headText,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(fontSize: AppDimension.font20)),
        SizedBox(height: AppDimension.getProportionateScreenHeight(10)),
        Text(text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: AppDimension.font14)),
      ],
    );
  }
}
