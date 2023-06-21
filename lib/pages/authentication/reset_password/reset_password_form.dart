import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/controllers/reset_password_controller.dart';

import '../../../constants/app_dimensions.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/password_form_error.dart';
import '../../../widgets/text_form_field.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  bool _showPassword = false;
  bool _showCPassword = false;
  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.find();
    return Form(
        child: Column(
          children: [
            SizedBox(
              height: AppDimension.getProportionateScreenHeight(28),
            ),
            AppTextField(
              headerText: 'New Password',
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
            SizedBox(
              height: AppDimension.getProportionateScreenHeight(20),
            ),
            AppTextField(
              headerText: 'Confirm Password',
              hintText: '',
              svgIcon: lockIcon,
              textInputType: TextInputType.visiblePassword,
              suffix: TextButton(
                onPressed: () {
                  setState(() {
                    _showCPassword = !_showCPassword;
                  });
                },
                child: _showCPassword ? Text(
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
              show: !_showCPassword,
              validator: (String? value) {
                return null;
              },
              onChanged: (String value) {
                controller.validateCPassword(value);
              },
              onSaved: (String? newValue) {
              },
            ),
            Obx(() => PassWordFormError(
                errors: controller.cPasswordErrors.cast<String>().toList()
            )),
          ],
        ));
  }
}
