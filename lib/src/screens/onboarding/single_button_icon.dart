import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos/src/constant/size.dart';

import '../../constant/color.dart';

class SingleButton extends StatelessWidget {
  const SingleButton({
    required this.bText,
    required this.press,
    this.bIcon,
    this.dHeight,
    super.key,
  });
  final String bText;
  final String? bIcon;
  final void Function() press;
  final double? dHeight;

  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return Column(
      children: [
        SizedBox(height: dHeight),
        SizedBox(
          width: double.infinity,
          height: Size().getProportionateScreenHeight(56),
          child: ElevatedButton(
            onPressed: press,
            child: bIcon != null ?
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bText,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      SizedBox(width: Size().getProportionateScreenWidth(10)),
                      SvgPicture.asset(bIcon!)
                      //Icon(bIcon, color: kArrowIconColor,),
                    ],
                  )
                : Text(
                    bText,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
          ),
        ),
      ],
    );
  }
}
