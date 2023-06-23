import 'package:flutter/material.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';

class CarTag extends StatelessWidget {
  const CarTag({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimension.width4),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimension.width8,
            vertical: AppDimension.height4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimension.width4),
            color: AppColors.carTagColor
        ),
        child:
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(
            fontSize: AppDimension.font8,
              color: AppColors.primary600
          ),
        ),
      ),
    );
  }
}