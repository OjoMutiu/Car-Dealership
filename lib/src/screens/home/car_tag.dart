import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/size.dart';


class CarTag extends StatelessWidget {
  const CarTag({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
        height: 20,
        padding: EdgeInsets.symmetric(
            horizontal:
            Size().getProportionateScreenWidth(4),
            vertical: Size()
                .getProportionateScreenHeight(3)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: kPrimaryColor.withOpacity(0.15)),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(
              color: kPrimaryColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}