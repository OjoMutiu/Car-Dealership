import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';
import 'package:oloworay_autos_/pages/authentication/sign_in/sign_in_body.dart';

import '../../../constants/app_strings.dart';
import '../../../controllers/sign_in_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
