import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos/src/screens/filter_page/filter_screen.dart';

import '../../src/constant/size.dart';
import 'color.dart';

class FilterSetting extends StatelessWidget {
  const FilterSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Size().getProportionateScreenWidth(44),
      height: Size().getProportionateScreenHeight(52),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context)=> const FilterPage())
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset('assets/icons/filter.svg'),
        ),
      ),
    );
  }
}