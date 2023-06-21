import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/controllers/on_boarding_page_controller.dart';
import 'package:oloworay_autos_/widgets/default_elevated_button.dart';
import 'package:oloworay_autos_/widgets/default_outlined_button.dart';

import '../../constants/app_dimensions.dart';
import '../../constants/app_routes.dart';
import '../../constants/app_strings.dart';
import 'dots.dart';
import 'onboarding_content.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final OnBoardingPageController _controller =
      Get.put(OnBoardingPageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension.getProportionateScreenWidth(24)),
          child: Column(
            children: [
              SizedBox(height: AppDimension.getProportionateScreenHeight(16)),
              Row(
                children: [
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        _controller.nextPage();
                      },
                      child: Text(
                        'Skip',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: AppColors.black100,
                                fontSize: AppDimension.font16),
                      )),
                ],
              ),
              Expanded(
                child: PageView.builder(
                    controller: _controller.controller,
                    itemCount: _controller.onBoardingContent.length,
                    onPageChanged: (int index) {
                      _controller.currentPage.value = index;
                    },
                    itemBuilder: (BuildContext context, int index) {
                      //index = 2;
                      return OnBoardingContent(
                          headText:
                              _controller.onBoardingContent[index].headText,
                          text: _controller.onBoardingContent[index].text,
                          image: _controller.onBoardingContent[index].image);
                    }),
              ),
              SizedBox(height: AppDimension.getProportionateScreenHeight(12)),
              Obx(() {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          _controller.onBoardingContent.length,
                          (index) => buildDot(index: index)),
                    ),
                    SizedBox(
                      height: _controller.currentPage.value ==
                              _controller.onBoardingContent.length - 1
                          ? AppDimension.height36
                          : AppDimension.height100,
                    ),
                    Container(
                      child: _controller.currentPage.value ==
                              _controller.onBoardingContent.length - 1
                          ? Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  DefaultElevatedButton(
                                      bText: bSignUp, press: () {
                                        Get.toNamed(Routes.signUpPage);
                                  }),
                                  SizedBox(
                                    height: AppDimension.height10,
                                  ),
                                  DefaultOutlinedButton(
                                      bText: bSignIn, press: () {
                                        Get.toNamed(Routes.signInPage);
                                  })
                                ],
                              ),
                            )
                          : DefaultElevatedButton(
                              bText: bContinue,
                              bIcon: forwardArrow,
                              press: () {
                                _controller.nextPage();
                              }),
                    ),
                  ],
                );
              }),
              SizedBox(height: AppDimension.getProportionateScreenHeight(38)),
            ],
          ),
        ),
      ),
    );
  }
}
