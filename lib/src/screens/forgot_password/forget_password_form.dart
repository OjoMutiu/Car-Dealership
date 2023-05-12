import 'package:flutter/material.dart';

import '../../constant/strings.dart';
import '../../constant/size.dart';
import '../../constant/text_field.dart';
import '../signup/form_error.dart';


class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final List<String> userErrors = ['Demo'];
    final List<String> useErrors = ['Demo'];
    return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            TextFieldWidget(
              obscure: false,
              hintText: signUpFormEmailHint,
              svgIcon: 'assets/icons/email.svg',
              textInputType: TextInputType.emailAddress,
            ),
            FormError(errors: userErrors),
          ],
        ));
  }
}
