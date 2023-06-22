import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';
import 'package:oloworay_autos_/controllers/sign_up_controller.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_strings.dart';
import '../../../../controllers/main_homepage_controller.dart';
import '../../widget/icon_with_counter.dart';



class UserHomePageProfile extends StatelessWidget {
  const UserHomePageProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    UserSignUpFormController userFormController = Get.find();
    HomePageController homePageController = Get.find();


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
                  radius: AppDimension.height24,
                  backgroundImage: AssetImage(userProfilePic),
                ),
              ),
              SizedBox( width: AppDimension.width10 ),
              Text.rich(TextSpan(
                  text: 'Hi ',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.textBody
                  ),
                  children: [
                    TextSpan(
                        text: userFormController.firstName.value,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(
                            color:AppColors.text))
                  ]))
            ]),
            IconButtonWithCounter(numberOfItems: homePageController.numberOfItems,
              iconSrc: 'assets/icons/notification.svg', press: () {
                //TODO: Navigate to notification page
              },),
          ]),
    );
  }
}