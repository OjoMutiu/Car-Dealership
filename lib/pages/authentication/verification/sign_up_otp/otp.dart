import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_dimensions.dart';
import '../../../../constants/app_strings.dart';
import 'otp_body.dart';


class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: () {
           Get.back();
           },
            icon: SvgPicture.asset(
              backArrow,
              width: AppDimension.height20,
              height: AppDimension.height20,
            ),
          )
      ),
      body: OtpBody(),//const OtpBody(),
    ));
  }
}
