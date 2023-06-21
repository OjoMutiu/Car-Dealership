import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_routes.dart';
import '../constants/app_strings.dart';


class UserSignInFormController extends GetxController{
  //field text
  var email = ''.obs;
  var password = ''.obs;
  var cPassword = ''.obs;


  //Validation flags
  final RxBool isUserEmailValid = false.obs;
  final RxBool isPasswordValid = false.obs;
  final RxBool isFormValid = false.obs;

  //checkBox
  RxBool remember = false.obs;

  //Error list
  RxList emailErrors = [].obs;
  RxList passwordErrors = [].obs;
  RxList cPasswordErrors = [].obs;
  RxList tError = [].obs;


  //Instantiation of TextEditingControllers
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();


  //CheckBox
  void rememberCheckBox() => remember.value = !remember.value;

  //Email Validation
  validateEmail(String? value) {
    emailErrors.clear();
    if (value != null) {
      email.value = value;
      if (email.value.isEmpty) {
        if (!emailErrors.contains(fieldEmpty)) {
          emailErrors.add(fieldEmpty);
        }
      } else if (!GetUtils.isEmail(email.value)) { //GetUtils library has a lot of nice datatype actions
        if (!emailErrors.contains(validEmailError)) {
          emailErrors.add(validEmailError);
        }
      }
    }

    isUserEmailValid.value = emailErrors.isEmpty;
  }

  //Password Validation
  validatePassword(String? value) {
    passwordErrors.clear();
    if (value != null) {
      password.value = value;
      if (!isPasswordValidB(password.value)) {
        if (!passwordErrors.contains(validPasswordError)) {
          passwordErrors.add('8 character');
          //Todo: If you want to change text color,
          // create a reactive color hear and apply in passError class
        }
      }
      if (!GetUtils.hasCapitalletter(password.value)) {
        if (!passwordErrors.contains(validPasswordError)) {
          passwordErrors.add('Uppercase');
        }
      }
      if (!GetUtils.hasMatch(password.value, r'\d')) {
        if (!passwordErrors.contains(validPasswordError)) {
          passwordErrors.add('Numeric');
        }
      }
      if (!GetUtils.hasMatch(password.value, r'[!@#$%^&*(),.?":{}|<>]')) {
        if (!passwordErrors.contains(validPasswordError)) {
          passwordErrors.add('Symbols');
        }
      }
      if (password.value.isNotEmpty) {
        //passwordErrors.remove(fieldEmpty);
      }
      if (isPasswordValidB(password.value)) {
        if (passwordErrors.contains(validPasswordError)) {
          // passwordErrors.remove(validPasswordError);
        }
      }
    }

    isPasswordValid.value = passwordErrors.isEmpty;
  }

  //FormValidation
  void submitSignInForm() {
    isFormValid.value = isUserEmailValid.value &&
        isPasswordValid.value;

    if (isFormValid.value) {
      Get.toNamed(Routes.myHomeScreen);
      if (remember.value) {
        //Todo: what should be done if remember is selected
        print('What to do if remember is checked');
      } else {
        Get.snackbar('.', 'Please agree to terms and conditions',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(milliseconds: 1500));
      }
    } else if (!isFormValid.value) {
      if (!isUserEmailValid.value) {
        validateEmail(email.value);
      }
      if(!isPasswordValid.value){
        validatePassword(password.value);
      }
    } else {
      validateEmail(email.value);
    }
  }
}