import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';
import 'package:oloworay_autos_/constants/app_routes.dart';
import 'package:oloworay_autos_/controllers/sign_in_controller.dart';
import 'package:oloworay_autos_/pages/authentication/sign_in/sign_in_form.dart';
import 'package:oloworay_autos_/widgets/auth_page_header_section.dart';
import 'package:oloworay_autos_/widgets/default_elevated_button.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/row_text_textButton.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  UserSignInFormController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimension.width20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeaderSection(hText: siTitle, sText: siSubtitle),
            const SignInForm(),
            Column(
              children: [
                SizedBox(height: AppDimension.height20),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.remember.value,
                        activeColor: AppColors.primary500,
                        onChanged: (value) {
                         controller.remember.value = value! ;
                        },
                        checkColor: Colors.white,
                      ),
                    ),
                    Text('Remember me', style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.textBody)),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                          Get.toNamed(Routes.forgetPassword);
                      },
                      child: Text('Forgot Password?',style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.primary500)),
                    ),
                  ],
                ),
                SizedBox(height: AppDimension.getProportionateScreenHeight(25.0)),
                DefaultElevatedButton(
                    bText: bLogin,
                    press: () {
                      controller.submitSignInForm();
                    }),
                SizedBox(height: AppDimension.height12),
                SizedBox(height: AppDimension.height20),
                RowTextButton(
                    tap: () {
                      Get.toNamed(Routes.signUpPage);
                    },
                    rowText: 'Don\'t have an account? ',
                    rowButton: 'Register'),
              ],
            )
          ])),
    );
  }
}

