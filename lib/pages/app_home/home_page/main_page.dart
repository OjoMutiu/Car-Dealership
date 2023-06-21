import 'dart:math';

import 'package:flutter/material.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';
import 'package:oloworay_autos_/pages/app_home/home_page/widgets/avatar_and_username.dart';
import 'package:oloworay_autos_/pages/app_home/home_page/widgets/car_brands.dart';
import 'package:oloworay_autos_/pages/app_home/home_page/widgets/page_banner.dart';
import 'package:oloworay_autos_/pages/app_home/home_page/widgets/serach_box_and_filter.dart';
import 'package:oloworay_autos_/pages/app_home/home_page/widgets/switch_button.dart';

import '../../../models/car_model.dart';
import '../car_details_page/car_details.dart';
import '../widget/car_card.dart';
import '../widget/section_header.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);


  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final int _numberOfItems = 4;

  @override
  Widget build(BuildContext context) {
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
                horizontal: AppDimension.getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(height: AppDimension.getProportionateScreenHeight(50)),
                UserHomePageProfile(numberOfItems: _numberOfItems),
                SizedBox(height: AppDimension.getProportionateScreenHeight(20)),
                const PageBanner(),
                SizedBox(height: AppDimension.height20),
                const SearchFilter(),
                SizedBox(height: AppDimension.height24),
                const CarBrands(),
                SizedBox(height: AppDimension.height24),
                const ButtonSwitcher(),
                SizedBox(height: AppDimension.getProportionateScreenHeight(32)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: AppDimension.getProportionateScreenWidth(20)),
            child: Column(
              children: [
                const SectionHeader(sectionText: 'Top choice'),
                SizedBox(height: AppDimension.getProportionateScreenHeight(12)),
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
                            onTapCar: () {
                              Navigator.push(context, MaterialPageRoute(builder:
                                  (context) => CarDetails(carList: demoTopChoiceCars, cIndex: randomCarIndex )
                              ));
                            },
                            onTapFav: () {

                            },
                          );
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(height: AppDimension.height24),
                SectionHeader(
                  sectionText: 'Oloworay autos',
                  btnText: 'View all',
                  onPressed: () {},
                ),
                SizedBox(height: AppDimension.getProportionateScreenHeight(12)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        demoOloworayAutosCars.length,
                            (index) => CarCad(
                              wrapHeight: 44,
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
                          onTapCar: () {
                            Navigator.push(context, MaterialPageRoute(builder:
                                (context) => CarDetails(carList: demoOloworayAutosCars, cIndex: index )
                            ));
                          },
                          onTapFav: () {},
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: AppDimension.getProportionateScreenHeight(24)),
                const SectionHeader(sectionText: 'Explore Cars'),
                SizedBox(height: AppDimension.getProportionateScreenHeight(12)),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                  ),
                  itemCount: demoExploreCars.length,
                  itemBuilder: (context, index) {
                    return CarCad(
                      wrapHeight: 44,
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
                      onTapCar: () {
                        Navigator.push(context, MaterialPageRoute(builder:
                            (context) => CarDetails(carList: demoExploreCars, cIndex: index )
                        ));
                      },
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
