import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_dimensions.dart';



class FilterField extends StatelessWidget {
  const FilterField({
    super.key, required this.title, required this.text, required this.onPressed,
  });
  final String title, text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppDimension.getProportionateScreenHeight(7),
          horizontal: AppDimension.width12),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.primary200,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textBody
              ),),
              Text(text, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.primary600
              ),),
            ],
          ),
          const Spacer(),
          IconButton(onPressed: onPressed, icon: Icon(Icons.keyboard_arrow_down,
            size: AppDimension.getProportionateScreenHeight(18),
            color: AppColors.primary500,
          ))
        ],
      ),
    );
  }
}