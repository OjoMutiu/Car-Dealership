import 'package:flutter/material.dart';

import '../../constant/form_error.dart';
import '../../constant/strings.dart';
import '../../constant/size.dart';
import '../../constant/text_field.dart';


class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  late String userEmail;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget._formKey,
        child: Column(
          children: [
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            buildTextFormField(
              context,
              show: false,
              hintText: signUpFormEmailHint,
              svgIcon: emailIcon,
              textInputType: TextInputType.emailAddress,
              validator: (String? value) {
                if ((value == null || value.isEmpty)) {
                  if (!emailErrors.contains(fieldEmpty)) {
                    setState(() {
                      emailErrors.add(fieldEmpty);
                    });
                  }
                  return '';
                } else if (!isEmailValid(value)) {
                  if (!emailErrors
                      .contains(validEmailError)) {
                    setState(() {
                      emailErrors.add(validEmailError);
                    });
                  }
                  return '';
                }
                return null;
              },
              onChanged: (String value) {
                if (value.isNotEmpty) {
                  setState(() {
                    emailErrors.remove(fieldEmpty);
                  });
                }
                if (isEmailValid(value)) {
                  setState(() {
                    emailErrors.remove(validEmailError);
                  });
                }
              },
              onSaved: (String? newValue) => userEmail = newValue!,
            ),
            FormError(errors: emailErrors),
          ],
        ));
  }
}
