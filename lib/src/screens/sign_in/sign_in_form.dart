import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/constant/form_error.dart';

import '../../constant/strings.dart';
import '../../constant/size.dart';
import '../../constant/text_field.dart';


class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late String userPassword;
  late String userEmail;
  bool _showPassword = false;
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size().init(context);
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
                  //Todo: create a custom error message
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
            SizedBox(height: Size().getProportionateScreenHeight(20)),
            buildTextFormField(
              context,
              controller: _passwordController,
              hintText: 'Password',
              svgIcon: lockIcon,
              textInputType: TextInputType.visiblePassword,
              suffix: TextButton(
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
                child: Text(
                  'show',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 12),
                ),
              ),
              show: !_showPassword,
              validator: (String? value) {
                if ((value == null || value.isEmpty)) {
                  if (!passwordErrors.contains(fieldEmpty)) {
                    setState(() {
                      passwordErrors.add(fieldEmpty);
                    });
                  }
                  return '';
                } else if (!isPasswordValid(value)) {
                  if (!passwordErrors
                      .contains(validPasswordError)) {
                    setState(() {
                      passwordErrors.add(validPasswordError);
                    });
                  }
                  return '';
                }
                return null;
              },
              onChanged: (String value) {
                if (value.isNotEmpty) {
                  setState(() {
                    passwordErrors.remove(fieldEmpty);
                  });
                }
                if (isPasswordValid(value)) {
                  if(passwordErrors.contains(validPasswordError)){
                    setState(() {
                      passwordErrors.remove(validPasswordError);
                    });
                  }
                }
              },
              onSaved: (String? newValue) {
                if(newValue != null){
                  userPassword = newValue;
                }
              },
            ),
            FormError(errors: passwordErrors),
          ],
        ));
  }
}
