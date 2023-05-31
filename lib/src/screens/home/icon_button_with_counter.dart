import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/size.dart';

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
            width: Size().getProportionateScreenWidth(24),
            height: Size().getProportionateScreenHeight(24),
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
                        EdgeInsets.all(Size().getProportionateScreenWidth(1)),
                    width: Size().getProportionateScreenWidth(14),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF1607),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        numberOfItems.toString(),
                        style: GoogleFonts.openSans(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                : Container(
                    padding:
                        EdgeInsets.all(Size().getProportionateScreenWidth(1)),
                    width: Size().getProportionateScreenWidth(14),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF1607),
                      shape: BoxShape.circle,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
