import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/controllers/sign_up_controller.dart';
import 'package:oloworay_autos_/pages/authentication/sign_up/sign_up_form.dart';
import 'package:oloworay_autos_/widgets/default_elevated_button.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/auth_page_header_section.dart';
import '../../../widgets/form_error.dart';
import '../../../widgets/row_text_textButton.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  UserSignUpFormController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    //_controller.countries = CountryCode.getAllCountries();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimension.getProportionateScreenHeight(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(
              hText: sTitle,
              sText: sSubtitle,
            ),
            const SignUpForm(),
            //SignUpForm(formKey: _formKey),
            Column(
              children: [
                SizedBox(
                    height: AppDimension.getProportionateScreenHeight(20.0)),
                Row(
                  children: [
                    Obx(() {
                      return Checkbox(
                        value: controller.agree.value,
                        activeColor: AppColors.primary500,
                        onChanged: (value) {
                          controller.agree.value = value!;
                        },
                        checkColor: Colors.white,
                      );
                    }),
                    Text(
                      termsAndService,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.textBody),
                    ),
                    GestureDetector(
                      onTap: () {
                        //TODO: Navigate to terms and service page
                      },
                      child: Text(
                        termsAndServiceBtn,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.primary500),
                      ),
                    ),
                  ],
                ),
                FormError(errors: tError),
                SizedBox(
                    height: AppDimension.getProportionateScreenHeight(25.0)),
                DefaultElevatedButton(
                    bText: bRegister,
                    press: () {
                      controller.submitSignUpForm();
                    }),
                SizedBox(
                    height: AppDimension.getProportionateScreenHeight(12.0)),
                SizedBox(
                    height: AppDimension.getProportionateScreenHeight(20.0)),
                RowTextButton(
                    tap: () {
                      Get.toNamed('/signInPage');
                    },
                    rowText: 'Already have an account? ',
                    rowButton: 'Login'),
                SizedBox(
                    height: AppDimension.getProportionateScreenHeight(70.0)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
