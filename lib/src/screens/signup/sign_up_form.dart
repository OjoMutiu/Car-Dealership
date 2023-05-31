import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/constant/size.dart';

import '../../constant/form_error.dart';
import '../../constant/strings.dart';
import '../../constant/text_field.dart';



class SignUpForm extends StatefulWidget {
   const SignUpForm({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late String userPassword;
  late String cUserPassword;
  bool _showPassword = false;
  bool _showCPassword = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();


  @override
  void dispose() {
    _passwordController.dispose();
    _cPasswordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    String userEmail;
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
              hintText: signUpFormUserNameHint,
              svgIcon: contactIcon,
              textInputType: TextInputType.name,
              onSaved: (String? value) {  },
              validator: (String? value) {
                if ((value == null || value.isEmpty)) {
                  //Todo: create a custom error message
                  if (!userNameError.contains(fieldEmpty)) {
                    setState(() {
                      userNameError.add(fieldEmpty);
                    });
                  }
                  return '';
                } else if (value.length < 3) {
                  if (!userNameError
                      .contains(validUserNameError)) {
                    setState(() {
                      userNameError.add(validUserNameError);
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
                  });
                }
                if (value.length > 2) {
                  setState(() {
                    userNameError.remove(validUserNameError);
                  });
                }
              },
            ),
            FormError(errors: userNameError),
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
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            buildTextFormField(
              context,
              controller: _phoneNumberController,
              show: false,
              hintText: 'Enter phone number',
              svgIcon: phoneIcon,
              textInputType: TextInputType.phone,
              validator: (String? value)  {
                if ((value == null || value.isEmpty)) {
                  if (!phoneNumberError.contains(fieldEmpty)) {setState(() {phoneNumberError.add(fieldEmpty);});}
                  return '';
                } else if (!isPhoneNumberValid(value)) {
                  if (!phoneNumberError.contains(validPhoneError)) {setState(() {phoneNumberError.add(validPhoneError);});}
                  return '';
                }
                return null;
              },
              onChanged: (String value)  {
                if (value.isNotEmpty) {setState(() {phoneNumberError.remove(fieldEmpty);});}
                if (isPhoneNumberValid(value)) {setState(() {phoneNumberError.remove(validPhoneError);});}
              },
              onSaved: (String? value) {  },
            ),
            FormError(errors: phoneNumberError),
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            buildTextFormField(
              context,
              controller: _passwordController,
              hintText: signUpFormPasswordHint,
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
              onSaved: (String? newValue) {
                if(newValue != null){
                  userPassword = newValue;
                }
              },
            ),
            FormError(errors: passwordErrors),
            SizedBox(
              height: Size().getProportionateScreenHeight(20),
            ),
            buildTextFormField(
              context,
              controller: _cPasswordController,
              show: !_showCPassword,
              hintText: signUpFormCPasswordHint,
              svgIcon: lockIcon,
              textInputType: TextInputType.visiblePassword,
              suffix: TextButton(
                onPressed: () {
                  setState(() {
                    _showCPassword = !_showCPassword;
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
              onSaved: (String? newValue) => cUserPassword = newValue!,
            ),
            FormError(errors: cPasswordErrors),
          ],
        ));
  }
}