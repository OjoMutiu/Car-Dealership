import 'package:flutter/material.dart';

import '../../constant/form_error.dart';
import '../../constant/strings.dart';
import '../../constant/size.dart';
import '../../constant/text_field.dart';


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
  bool _showPassword = false;
  bool _showCPassword = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();


  @override
  void dispose() {
    _passwordController.dispose();
    _cPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // String cUserPassword;
    return Form(
        key: widget._formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            buildTextFormField(
              context,
              hintText: 'Enter code',
              textInputType: TextInputType.visiblePassword,
              show: false,
              validator: (String? value) {if ((value == null || value.isEmpty)) {
                //Todo: create a custom error message
                if (!userNameError.contains(fieldEmpty)) {
                  setState(() {
                    userNameError.add(fieldEmpty);
                  });
                }
                return '';
              }
              return null;
              },
              onChanged: (String value)  {
                if (value.isNotEmpty) {
                  setState(() {
                    userNameError.remove(fieldEmpty);
                  });}},
              onSaved: (String? value) {  },
            ),
            FormError(errors: userNameError),
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            buildTextFormField(
              context,
              controller: _passwordController,
              hintText: 'New Password',
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
                if ((value == null || value.isEmpty)) {
                  //Todo: create a custom error message
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
              onSaved: (String? newValue) {},
            ),
            FormError(errors: passwordErrors),
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            buildTextFormField(
              context,
              controller: _cPasswordController,
              show: !_showCPassword,
              hintText: 'Confirm New Password',
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
              validator: (String? value)  {
                if ((value == null || value.isEmpty)) {
                  //Todo: create a custom error message
                  if (!cPasswordErrors.contains(fieldEmpty)) {
                    setState(() {
                      cPasswordErrors.add(fieldEmpty);
                    });
                  }
                  return '';
                }
                else if (value != _passwordController.text) {
                  if (!cPasswordErrors
                      .contains(passwordConfirmMatchError)) {
                    setState(() {
                      cPasswordErrors.add(passwordConfirmMatchError);
                    });
                  }
                  return '';
                }
                return null;
              },
              onChanged: (String value)  {
                if (value.isNotEmpty) {
                  setState(() {
                    cPasswordErrors.remove(fieldEmpty);
                  });
                }
                if (value == _passwordController.text) {
                  if(cPasswordErrors.contains(passwordConfirmMatchError)){
                    setState(() {
                      cPasswordErrors.remove(passwordConfirmMatchError);
                    });
                  }
                }
              },
              onSaved: (String? newValue) => {}//cUserPassword = newValue!,
            ),
            FormError(errors: cPasswordErrors),
          ],
        ));
  }
}