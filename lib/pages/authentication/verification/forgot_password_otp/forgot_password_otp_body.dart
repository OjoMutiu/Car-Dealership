import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/constants/app_routes.dart';
import 'package:oloworay_autos_/pages/authentication/verification/forgot_password_otp/forgot_password_otp_form.dart';
import 'package:oloworay_autos_/widgets/default_elevated_button.dart';

import '../../../../constants/app_dimensions.dart';
import '../../../../constants/app_strings.dart';
import '../../../../widgets/row_text_textButton.dart';

class ForgotPasswordOtpBody extends StatelessWidget {
  const ForgotPasswordOtpBody({super.key,});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppDimension.height20,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppDimension.getProportionateScreenHeight(25),
              ),
              Text(
                fTitle,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(fontSize: AppDimension.font22),
              ),
              Text(
                'Please enter the 4 digit code sent to your\n email address',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: AppDimension.font14
                ),
              )
            ],
          ),
          SizedBox(height: AppDimension.getProportionateScreenHeight(40.0)),
          const ForgotPasswordOtpForm(),
          const Spacer(flex: 1,),
          // SizedBox(height: AppDimension.getProportionateScreenHeight(250.0)),
          RowTextButton(
            tap: () {
              //Todo: Set the on tap function
            },
            rowText: 'Didn\'t receive any SMS? ',
            rowButton: 'Resend Code',
          ),
          SizedBox(height: AppDimension.getProportionateScreenHeight(28.0)),
          DefaultElevatedButton(
            press: () {
              Get.offNamed(Routes.resetPassword);
            },
            bText: bSubmit,
            bIcon: forwardArrow,
          ),
          const Spacer(flex: 5,),
        ]));
  }
}
