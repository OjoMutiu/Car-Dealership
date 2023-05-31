import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/size.dart';
import '../../constant/strings.dart';
import 'icon_button_with_counter.dart';

class UserHomePageProfile extends StatelessWidget {
  const UserHomePageProfile({
    super.key,
    required this.userName,
    required int numberOfItems,
  }) : _numberOfItems = numberOfItems;

  final String userName;
  final int _numberOfItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Size().getProportionateScreenWidth(4)),
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
                width: Size().getProportionateScreenWidth(10),
              ),
              Text.rich(TextSpan(
                  text: 'Hi ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600, color: Colors.black54),
                  children: [
                    TextSpan(
                        text: userName,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: kHeadLineTextColor))
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