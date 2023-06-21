import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';

import '../../../constants/app_colors.dart';

class IconButtonWithCounter extends StatelessWidget {
  const IconButtonWithCounter({
    super.key,
    required this.iconSrc,
    this.numberOfItems,
    required this.press,
  });

  final int? numberOfItems;
  final String iconSrc;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            width: AppDimension.height24,
            height: AppDimension.height24,
            child: SvgPicture.asset(
              iconSrc,
            ),
          ),
          Positioned(
            right: -1,
            top: -5,
            child: numberOfItems != null
                ? Container(
              padding:
              EdgeInsets.all(AppDimension.getProportionateScreenWidth(1)),
              width: AppDimension.width14,
              decoration: const BoxDecoration(
                color: AppColors.counterBgColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  numberOfItems.toString(),
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontSize: AppDimension.font10,
                  )
                ),
              ),
            )
                : Container(
              padding:
              EdgeInsets.all(AppDimension.getProportionateScreenWidth(1)),
              width: AppDimension.width14,
              decoration: const BoxDecoration(
                color: AppColors.counterBgColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
