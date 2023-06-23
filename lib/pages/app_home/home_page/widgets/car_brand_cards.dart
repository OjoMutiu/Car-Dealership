import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_dimensions.dart';


class CarFilterCard extends StatelessWidget {
  const CarFilterCard({
    super.key, required this.imgSrc, required this.carName, required this.onTap,
  });

  final String imgSrc;
  final String carName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: AppDimension.width48,
            height: AppDimension.getProportionateScreenHeight(60),
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.neutral300,
                  width:AppDimension.width1,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppDimension.height40)),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: AppDimension.height8,
                  horizontal: AppDimension.width8
              ),
              child: Image.asset(imgSrc),
            ),
          ),
          SizedBox(height: AppDimension.height6),
          Text(carName,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(
                  color: AppColors.black100,
                  fontSize: AppDimension.font10)),
        ],
      ),
    );
  }
}