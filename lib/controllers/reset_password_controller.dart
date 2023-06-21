import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_routes.dart';
import '../constants/app_strings.dart';

class ResetPasswordController extends GetxController {
  //field text
  var password = ''.obs;
  var cPassword = ''.obs;

  //Validation flags
  final RxBool isPasswordValid = false.obs;
  final RxBool iscPasswordValid = false.obs;
  final RxBool isFormValid = false.obs;

  //Error list
  RxList passwordErrors = [].obs;
  RxList cPasswordErrors = [].obs;

  //Instantiation of TextEditingControllers
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();

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

  //cPassword Validation
  validateCPassword(String? value) {
    cPasswordErrors.clear();
    if (value != null) {
      cPassword.value = value;
      if (cPassword.value != password.value) {
        if (!cPasswordErrors.contains(passwordConfirmMatchError)) {
          cPasswordErrors.add('Passwords does not match');
        }
      }
    }
    iscPasswordValid.value = cPasswordErrors.isEmpty;
  }

  //FormValidation
  void submitResetForm() {
    isFormValid.value = isPasswordValid.value && iscPasswordValid.value;

    if (isFormValid.value) {
      Get.offAllNamed(Routes.resetSuccessful);
    } else {
      if (!isPasswordValid.value) {
        validatePassword(password.value);
      }
      if (!iscPasswordValid.value) {
        validateCPassword(cPassword.value);
      }
    }
  }
}
