import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_dimensions.dart';
import '../../../constants/app_strings.dart';
import '../../../controllers/sign_in_controller.dart';
import '../../../widgets/form_error.dart';
import '../../../widgets/password_form_error.dart';
import '../../../widgets/text_form_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  UserSignInFormController controller = Get.find();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          children: [
            SizedBox(
              height: AppDimension.getProportionateScreenHeight(28),
            ),
            AppTextField(
              show: false,
              hintText: signUpEmail,
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
            AppTextField(
              headerText: 'Password',
              asterisk: '',
              hintText: '',
              svgIcon: lockIcon,
              textInputType: TextInputType.visiblePassword,
              suffix: TextButton(
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                child: _showPassword ? Text(
                  'hide',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 12),
                ):Text(
                  'show',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 12),
                ),
              ),
              show: !_showPassword,
              validator: (String? value) {
                return null;
              },
              onChanged: (String value) {
                controller.validatePassword(value);
              },
              onSaved: (String? newValue) {
              },
            ),
            Obx(() => PassWordFormError(
                errors: controller.passwordErrors.cast<String>().toList()
            )),
          ],
        ));
  }
}
