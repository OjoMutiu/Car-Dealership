import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/widgets/default_elevated_button.dart';

import '../../../constants/app_dimensions.dart';
import '../../../constants/app_strings.dart';

class PasswordResetSuccessful extends StatelessWidget {
  const PasswordResetSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: SvgPicture.asset(backArrow, width: AppDimension.height20,
                    height: AppDimension.height20,
                  ))),
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimension.getProportionateScreenWidth(55.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(iconCheck),
                  SizedBox(height: AppDimension.getProportionateScreenHeight(25)),
                  Text(psTitle, style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: AppDimension.font20
                  )),
                  SizedBox(height: AppDimension.height8),
                  Text(
                    psSubtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                      fontSize: AppDimension.font18,
                      color: AppColors.textBody
                    ),
                  ),
                  SizedBox(height: AppDimension.getProportionateScreenHeight(60)),
                  DefaultElevatedButton(
                      bText: bLogin,
                      press: () {
                        Get.offNamed('/signInPage');
                      })
                ],
              ),
            ),
          ),
        ));
  }
}
