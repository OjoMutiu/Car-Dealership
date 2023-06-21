import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/controllers/reset_password_controller.dart';
import 'package:oloworay_autos_/pages/authentication/reset_password/rset_password_body.dart';


import '../../../constants/app_dimensions.dart';
import '../../../constants/app_strings.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ResetPasswordController());
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
            body: const ResetPasswordBody()));
  }
}
