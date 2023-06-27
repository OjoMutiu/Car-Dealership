import 'package:flutter/material.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';


class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppDimension.width20,
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
            width: AppDimension.screenWidth/2 - 34,
            height: AppDimension.getProportionateScreenHeight(48),
            child: OutlinedButton(
              onPressed: () {
                //todo:
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    width: AppDimension.getProportionateScreenWidth(0.5),
                    color: AppColors.primary500),
              ),
              child: Text(
                'Call dealer',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.primary500,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          SizedBox(width: AppDimension.width20,),
          SizedBox(
            width: AppDimension.screenWidth/2 - 34,
            height: AppDimension.getProportionateScreenHeight(48),
            child: ElevatedButton(
                onPressed: (){
                  //todo:
                },
                child: Text(
                  'Message',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}
