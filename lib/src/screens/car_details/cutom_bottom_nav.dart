import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/size.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Size().getProportionateScreenWidth(20),
          vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0,3)
          )
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: Size.screenWidth/2 - 34,
            height: Size().getProportionateScreenHeight(48),
            child: ElevatedButton(
                onPressed: (){
                  //todo:
                },
                child: Text(
                  'Call dealer',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                )
            ),
          ),
          SizedBox(width: Size().getProportionateScreenWidth(20),),
          SizedBox(
            width: Size.screenWidth/2 - 34,
            height: Size().getProportionateScreenHeight(48),
            child: OutlinedButton(
              onPressed: () {
                //todo:
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    width: Size().getProportionateScreenWidth(0.5),
                    color: kPrimaryColor),
              ),
              child: Text(
                'Sign in',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
