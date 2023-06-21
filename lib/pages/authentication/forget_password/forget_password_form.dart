import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_dimensions.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/forget_password_controller.dart';
import '../../../widgets/form_error.dart';
import '../../../widgets/text_form_field.dart';


class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = Get.find();

    return Form(
        child: Column(
          children: [
            SizedBox(
              height: AppDimension.getProportionateScreenHeight(28),
            ),
            AppTextField(
              show: false,
              hintText: 'email@example.com',
              svgIcon: emailIcon,
              textInputType: TextInputType.emailAddress,
              onSaved: (String? value) {},
              validator: (value) {
                return null;
              },
              onChanged: (value) {
                controller.validateEmail(value);
              },
              headerText: 'Email address',
              asterisk: '',
            ),
            Obx(() => FormError(
                errors: controller.emailErrors.cast<String>().toList())),
            SizedBox(
              height: AppDimension.getProportionateScreenHeight(20),
            ),
          ],
        ));
  }
}
