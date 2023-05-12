import 'package:flutter/material.dart';

import '../../constant/strings.dart';
import '../../constant/size.dart';
import '../../constant/text_field.dart';
import '../signup/form_error.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  @override
  Widget build(BuildContext context) {
    final List<String> userErrors = ['Demo'];
    return Form(
        key: widget._formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            const TextFieldWidget(
              hintText: 'Error code',
              textInputType: TextInputType.visiblePassword,
              obscure: true,
            ),
            //FormError(errors: userErrors),
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            const TextFieldWidget(
              obscure: true,
              hintText: 'New Password',
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            const TextFieldWidget(
              obscure: true,
              hintText: 'Confirm New Password',
              textInputType: TextInputType.visiblePassword,
            ),
          ],
        ));
  }
}