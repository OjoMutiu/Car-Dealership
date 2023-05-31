import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oloworay_autos/src/constant/color.dart';
import 'package:oloworay_autos/src/constant/form_error.dart';
import 'package:oloworay_autos/src/constant/row_text_button.dart';
import 'package:oloworay_autos/src/constant/strings.dart';
import 'package:oloworay_autos/src/constant/size.dart';
import 'package:oloworay_autos/src/screens/onboarding/single_button_icon.dart';
import 'package:oloworay_autos/src/screens/sign_in/sign_in.dart';
//import 'package:oloworay_autos/src/screens/signup/sign_up_form.dart';
import 'package:oloworay_autos/src/screens/verification/otp.dart';

import '../../constant/text_field.dart';
import 'header.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String userPassword;
  late String cUserPassword;
  bool _showPassword = false;
  bool _showCPassword = false;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool agree = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _cPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size().init(context);
    String userEmail;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Size().getProportionateScreenHeight(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderText(
              hText: sTitle,
              sText: sSubtitle,
            ),
            signUpForm(context),
            //SignUpForm(formKey: _formKey),
            Column(
              children: [
                SizedBox(height: Size().getProportionateScreenHeight(20.0)),
                Row(
                  children: [
                    Checkbox(
                      value: agree,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {setState(() {agree = value!;});},
                      checkColor: Colors.white,
                    ),
                    Text(
                      termsAndService,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: kBodyTextColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        //TODO: Navigate to terms and service page
                      },
                      child: Text(
                        termsAndServiceBtn,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),

                FormError(errors: tError),
                SizedBox(height: Size().getProportionateScreenHeight(25.0)),
                SingleButton(
                    bText: bSignUp,
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        if(agree == true){
                          _formKey.currentState!.save();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OTP(userPhoneNumber: _phoneNumberController.text,
                                    userName: _userNameController.text,)),
                          );
                        }
                      }
                    }),
                SizedBox(height: Size().getProportionateScreenHeight(12.0)),
                Text('or',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: kBodyTextColor)),
                SizedBox(height: Size().getProportionateScreenHeight(12.0)),
                SizedBox(
                  width: double.infinity,
                  height: Size().getProportionateScreenHeight(56),
                  child: OutlinedButton(
                    onPressed: () {
                      //Todo: Setup functionality
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          width: Size().getProportionateScreenWidth(0.5),
                          color: kPrimaryColor.withOpacity(0.4)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(googleIcon),
                        SizedBox(width: Size().getProportionateScreenWidth(14)),
                        Text(
                          tGoogleLogin,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: kBodyTextColor2.withOpacity(0.8),
                                  fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Size().getProportionateScreenHeight(20.0)),
                RowTextButton(
                    tap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()));
                    },
                    rowText: 'Already have an account? ',
                    rowButton: 'Login'),
                SizedBox(height: Size().getProportionateScreenHeight(70.0)),
              ],
            )
          ],
        ),
      ),
    );
  }





//SignUpForm
  Form signUpForm(BuildContext context) {
    return Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: Size().getProportionateScreenHeight(20),
                  ),
                  buildTextFormField(
                    context,
                    controller: _userNameController,
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
                    onSaved: (String? newValue) {}//=>  userEmail = newValue!,
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
                      child: _showCPassword ? Text(
                        'hide',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 12),
                      ): Text(
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
