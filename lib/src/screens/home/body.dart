import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/screens/home/model/car_model.dart';
import 'package:oloworay_autos/src/screens/home/page_banner.dart';
import 'package:oloworay_autos/src/screens/home/search_filter.dart';
import 'package:oloworay_autos/src/screens/home/section_header.dart';
import 'package:oloworay_autos/src/screens/home/switch_button.dart';

import '../../constant/size.dart';
import 'car_card.dart';
import 'car_filter_card.dart';
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
    Random random = Random();
    int index1 = random.nextInt(demoTopChoiceCars.length);
    int index2 = random.nextInt(demoTopChoiceCars.length);
    int index3 = random.nextInt(demoOloworayAutosCars.length);
    int index4 = random.nextInt(demoExploreCars.length);
    return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Size().getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  SizedBox(height: Size().getProportionateScreenHeight(50)),
                  UserHomePageProfile(userName: widget.userName, numberOfItems: _numberOfItems),
                  SizedBox(height: Size().getProportionateScreenHeight(20)),
                  const PageBanner(),
                  SizedBox(height: Size().getProportionateScreenHeight(20)),
                  const SearchFilter(),
                  SizedBox(height: Size().getProportionateScreenHeight(24)),
                  const CarFilter(),
                  SizedBox(height: Size().getProportionateScreenHeight(24)),
                  const ButtonSwitcher(),
                  SizedBox(height: Size().getProportionateScreenHeight(32)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: Size().getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  const SectionHeader(sectionText: 'Top choice'),
                  SizedBox(height: Size().getProportionateScreenHeight(12)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          2,
                          (index) {
                            int randomCarIndex = index == 0? index1: index2;
                            return CarCad(
                                width: 216,
                                year: demoTopChoiceCars[randomCarIndex].yearOfManufacture,
                            price: demoTopChoiceCars[randomCarIndex].priceOfCar,
                            make: demoTopChoiceCars[randomCarIndex].make,
                            model: demoTopChoiceCars[randomCarIndex].model,
                            location: demoTopChoiceCars[randomCarIndex].region,
                            transmission: demoTopChoiceCars[randomCarIndex].transmission,
                            fuel: demoTopChoiceCars[randomCarIndex].fuel,
                            condition: demoTopChoiceCars[randomCarIndex].condition,
                            image: demoTopChoiceCars[randomCarIndex].images[0],
                            onTapCar: () {},
                            onTapFav: () {},
                          );
                            },
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: Size().getProportionateScreenHeight(24)),
                  SectionHeader(
                    sectionText: 'Oloworay autos',
                    btnText: 'View all',
                    onPressed: () {},
                  ),
                  SizedBox(height: Size().getProportionateScreenHeight(12)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          demoOloworayAutosCars.length,
                          (index) => CarCad(
                            width: 144,
                            year: demoOloworayAutosCars[index].yearOfManufacture,
                            price: demoOloworayAutosCars[index].priceOfCar,
                            make: demoOloworayAutosCars[index].make,
                            model: demoOloworayAutosCars[index].model,
                            location: demoOloworayAutosCars[index].region,
                            transmission: demoOloworayAutosCars[index].transmission,
                            fuel: demoOloworayAutosCars[index].fuel,
                            condition: demoOloworayAutosCars[index].condition,
                            image: demoOloworayAutosCars[index].images[0],
                            onTapCar: () {},
                            onTapFav: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: Size().getProportionateScreenHeight(24)),
                  const SectionHeader(sectionText: 'Explore Cars'),
                  SizedBox(height: Size().getProportionateScreenHeight(12)),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: demoExploreCars.length,
                    itemBuilder: (context, index) {
                      return CarCad(
                          width: 157,
                          year: demoExploreCars[index].yearOfManufacture,
                          price: demoExploreCars[index].priceOfCar,
                          make: demoExploreCars[index].make,
                          model: demoExploreCars[index].model,
                          location: demoExploreCars[index].region,
                          transmission: demoExploreCars[index].transmission,
                          fuel: demoExploreCars[index].fuel,
                          condition: demoExploreCars[index].condition,
                          image: demoExploreCars[index].images[0],
                          onTapCar: () {},
                          onTapFav: () {},
                      );
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      );
  }
}
