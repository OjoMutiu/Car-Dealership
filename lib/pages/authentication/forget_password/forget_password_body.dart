import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';
import 'package:oloworay_autos_/constants/app_routes.dart';
import 'package:oloworay_autos_/pages/authentication/forget_password/forget_password_form.dart';
import 'package:oloworay_autos_/widgets/auth_page_header_section.dart';
import 'package:oloworay_autos_/widgets/default_elevated_button.dart';

import '../../../constants/app_strings.dart';
import '../../../controllers/forget_password_controller.dart';
import '../../../widgets/row_text_textButton.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = Get.find();
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension.width20),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeaderSection(hText: fTitle, sText: fSubtitle),
           const ForgotPasswordForm(),
            Column(
              children: [
                SizedBox(height: AppDimension.height30),
                DefaultElevatedButton(
                    bText: bSubmit,
                    press: () {
                     controller.submitForgotPasswordForm();
                     }
                    ),
                SizedBox(height: AppDimension.height20),
                RowTextButton(
                    tap: () {
                      Get.toNamed(Routes.signInPage);
                    },
                    rowText: 'Back to ',
                    rowButton: 'Login'),
                SizedBox(height: AppDimension.getProportionateScreenHeight(70.0)),
              ],
            )
          ])),
    );
  }
}
