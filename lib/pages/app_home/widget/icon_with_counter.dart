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
      borderRadius: BorderRadius.circular(AppDimension.height8),
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
            right: -3,
            top: -5,
            child: numberOfItems! > 0
                ? Container(
                  padding:
                  EdgeInsets.symmetric(horizontal: AppDimension.getProportionateScreenWidth(4)),
                  decoration: const BoxDecoration(
                    color: AppColors.counterBgColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      numberOfItems.toString(),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: AppDimension.font10,
                      )
                ),
              ),
            )
                : Container(
              padding:
              EdgeInsets.all(AppDimension.getProportionateScreenWidth(4)),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
