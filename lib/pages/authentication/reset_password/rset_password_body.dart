import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';
import 'package:oloworay_autos_/controllers/reset_password_controller.dart';
import 'package:oloworay_autos_/pages/authentication/reset_password/reset_password_form.dart';
import 'package:oloworay_autos_/widgets/auth_page_header_section.dart';
import 'package:oloworay_autos_/widgets/default_elevated_button.dart';


import '../../../constants/app_strings.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.find();
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension.width20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeaderSection(hText: siTitle, sText: siSubtitle),
            const ResetPasswordForm(),
            Column(
              children: [
                SizedBox(height: AppDimension.height20),
                SizedBox(height: AppDimension.getProportionateScreenHeight(25.0)),
                DefaultElevatedButton(
                    bText: bReset,
                    press: () {
                      controller.submitResetForm();
                    }),
                SizedBox(height: AppDimension.height12),
              ],
            )
          ])),
    );
  }
}

