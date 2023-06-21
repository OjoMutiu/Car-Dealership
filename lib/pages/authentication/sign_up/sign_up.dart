import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';
import 'package:oloworay_autos_/pages/authentication/sign_up/sign_up_body.dart';

import '../../../constants/app_strings.dart';
import '../../../controllers/sign_up_controller.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<UserSignUpFormController>(() => UserSignUpFormController());
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: IconButton(
                    onPressed: () {
                     Get.back();
                    },
                    icon: SvgPicture.asset(backArrow, width: AppDimension.height20,
                      height: AppDimension.height20,
                    ))),
            body: const Body()));
  }
}
