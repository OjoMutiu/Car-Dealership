import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/controllers/sign_up_controller.dart';
import 'package:oloworay_autos_/pages/authentication/sign_up/phone_number_field.dart';

import '../../../constants/app_dimensions.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/form_error.dart';
import '../../../widgets/password_form_error.dart';
import '../../../widgets/text_form_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  UserSignUpFormController controller = Get.find();
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
              hintText: signUpFirstName,
              svgIcon: contactIcon,
              textInputType: TextInputType.name,
              onSaved: (String? value) {},
              validator: (value) {
                return null;
              },
              onChanged: (value) {
                controller.validateFirstName(
                  value,
                );
              },
              headerText: 'First Name',
              asterisk: '',
            ),
            Obx(() => FormError(
                errors:
                controller.firstNameError.cast<String>().toList())),
            SizedBox(
              height: AppDimension.getProportionateScreenHeight(20),
            ),
            AppTextField(
              show: false,
              hintText: signUpLastName,
              svgIcon: contactIcon,
              textInputType: TextInputType.name,
              onSaved: (String? value) {},
              validator: (value) {
                return null;
              },
              onChanged: (value) {
                controller.validateLastName(value);
              },
              headerText: 'Last Name',
              asterisk: '',
            ),
            Obx(() => FormError(
                errors: controller.lastNameError.cast<String>().toList())),
            SizedBox(
              height: AppDimension.getProportionateScreenHeight(20),
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
            AppPhoneTextField(
              headerText: phoneNumberT,
              asterisk: '',
              validator: (value) {
                return null;
              },
              onChanged: (value) {controller.validatePhoneNumber(value);},
              hintText: phoneNumberT,
              textInputType: TextInputType.phone,
              svgIcon: phoneIcon,
              show: false,
            ),
            Obx(() => FormError(
                errors: controller.phoneNumberError.cast<String>().toList())),
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