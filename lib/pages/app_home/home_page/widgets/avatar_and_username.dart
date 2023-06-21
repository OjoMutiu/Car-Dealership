import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';
import 'package:oloworay_autos_/controllers/sign_up_controller.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_strings.dart';
import '../../widget/icon_with_counter.dart';



class UserHomePageProfile extends StatelessWidget {
  UserHomePageProfile({
    super.key,
    required int numberOfItems,
  }) : _numberOfItems = numberOfItems;
  final int _numberOfItems;

  final UserSignUpFormController userFormController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimension.width4),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              InkWell(
                onTap: (){
                  //todo: add profile pics
                },
                child: CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage(userProfilePic),
                ),
              ),
              SizedBox(
                width: AppDimension.width10,
              ),
              Text.rich(TextSpan(
                  text: 'Hi ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black54),
                  children: [
                    TextSpan(
                        text: userFormController.firstName.value,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                            fontWeight: FontWeight.w600,
                            color:AppColors.primary600))
                  ]))
            ]),
            IconButtonWithCounter(numberOfItems: _numberOfItems,
              iconSrc: 'assets/icons/notification.svg', press: () {
                //TODO: Navigate to notification page
              },),
          ]),
    );
  }
}