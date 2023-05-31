import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oloworay_autos/src/constant/color.dart';
import 'package:oloworay_autos/src/screens/home/model/car_model.dart';
import 'package:oloworay_autos/src/screens/home/page_banner.dart';
import 'package:oloworay_autos/src/screens/home/search_filter.dart';
import 'package:oloworay_autos/src/screens/home/section_header.dart';
import 'package:oloworay_autos/src/screens/home/switch_button.dart';

import '../../constant/size.dart';
import 'car_card.dart';
import 'car_filter_card.dart';
import 'car_tag.dart';
import 'home_page_user_profile_header.dart';

class Body extends StatefulWidget {
  const Body({Key? key, required this.userName}) : super(key: key);
  final String userName;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final int _numberOfItems = 4;

  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Size().getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(
              height: Size().getProportionateScreenHeight(50),
            ),
            UserHomePageProfile(
                userName: widget.userName, numberOfItems: _numberOfItems),
            SizedBox(height: Size().getProportionateScreenHeight(20)),
            const PageBanner(),
            SizedBox(height: Size().getProportionateScreenHeight(20)),
            const SearchFilter(),
            SizedBox(height: Size().getProportionateScreenHeight(24)),
            const CarFilter(),
            SizedBox(height: Size().getProportionateScreenHeight(24)),
            const ButtonSwitcher(),
            SizedBox(height: Size().getProportionateScreenHeight(32)),
            const SectionHeader(sectionText: 'Top choice'),
            SizedBox(height: Size().getProportionateScreenHeight(24)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(demoCars.length, (index) => CarCad(width: 216,
                    year: demoCars[index].yearOfManufacture,
                    price:demoCars[index].priceOfCar,
                    make: demoCars[index].make,
                    model: demoCars[index].model,
                    location: demoCars[index].region,
                    transmission: demoCars[index].transmission,
                    fuel: demoCars[index].fuel, condition: demoCars[index].condition, image: demoCars[index].images[0],
                    onTap: (){}, aspectRatio: 0.9,
                  ),)
                ],
              ),
            ),
            SizedBox(
              height: Size().getProportionateScreenHeight(10),
            )
          ],
        ),
      ),
    );
  }
}

