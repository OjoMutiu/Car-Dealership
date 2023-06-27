import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';
import 'package:oloworay_autos_/pages/app_home/widget/car_tags.dart';

import '../../../../constants/app_strings.dart';
import '../../../../models/car_model.dart';
import '../../widget/car_card.dart';
import '../../widget/section_header.dart';
import 'car_details_placard.dart';

class CarDetailsBody extends StatefulWidget {
  const CarDetailsBody({Key? key, required this.carList, required this.cIndex}) : super(key: key);
  final List<Car> carList;
  final int cIndex;

  @override
  State<CarDetailsBody> createState() => _CarDetailsBodyState();
}

class _CarDetailsBodyState extends State<CarDetailsBody> {
  int? selectedCarIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> details = [
      {"headerText": "Condition", "text": widget.carList[widget.cIndex].condition},
      {"headerText": "Year"  , "text": widget.carList[widget.cIndex].yearOfManufacture.toString()},
      {"headerText": "FuelType"  , "text": widget.carList[widget.cIndex].fuel},
      {"headerText": "Make" , "text": widget.carList[widget.cIndex].make},
      {"headerText": "Color" , "text": widget.carList[widget.cIndex].color[0]},
      {"headerText": "Transmission" , "text": widget.carList[widget.cIndex].transmission},
      {"headerText": "Model" , "text": widget.carList[widget.cIndex].model},
      {"headerText": "Mileage" , "text": widget.carList[widget.cIndex].mileage.toString()},
      {"headerText": "Registered" , "text": widget.carList[widget.cIndex].isRegistered.toString()},


    ];
    return Column(
      children: [
        Stack(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Image.asset(widget.carList[widget.cIndex].images[0],
                    fit: BoxFit.cover),
              ),
              Positioned(
                top: AppDimension.height10,
                left: AppDimension.width20,
                child: CircleAvatar(
                  backgroundColor: AppColors.neutral200,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: AppDimension.width4),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: AppDimension.width20,
                        color: AppColors.primary500,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                top: AppDimension.height14,
                right: AppDimension.width20,
                child: Container(
                  padding:
                  EdgeInsets.all(AppDimension.height4),
                  width: AppDimension.getProportionateScreenWidth(32),
                  height: AppDimension.getProportionateScreenHeight(32),
                  decoration: BoxDecoration(
                      color: AppColors.carTagColor,
                      borderRadius: BorderRadius.circular(AppDimension.height6)),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // isFavTap = !isFavTap;
                      });
                    },
                    child: //!isFavTap? SvgPicture.asset('assets/icons/favourite.svg'):
                    SvgPicture.asset('assets/icons/fav_colored.svg'),
                  ),
                ),
              ),
            ]),
        SizedBox(height: AppDimension.height10),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimension.getProportionateScreenWidth(25.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppDimension.getProportionateScreenHeight(71),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.carList[widget.cIndex].images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(right: AppDimension.width10),
                          child: SizedBox(
                            width: AppDimension.getProportionateScreenWidth(74),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Image.asset(
                                          widget.carList[widget.cIndex].images[index],
                                          fit: BoxFit.cover,
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text('Close', style: TextStyle(
                                                color: AppColors.secondary500
                                              ),))
                                        ],
                                      );
                                    });
                              },
                              child:
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                width: selectedCarIndex == index ? AppDimension.getProportionateScreenWidth(90)
                                    :AppDimension.getProportionateScreenWidth(74),
                                height: selectedCarIndex == index ? AppDimension.getProportionateScreenHeight(90)
                                    :AppDimension.getProportionateScreenHeight(71),
                                decoration: BoxDecoration(
                                    color:AppColors.primary200,
                                    borderRadius: BorderRadius.circular(AppDimension.height6),
                                    border: Border.all(
                                        width: selectedCarIndex == index ? AppDimension.width2: 0,
                                        color: AppColors.primary200
                                    )
                                ),
                                child:
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(AppDimension.height6),
                                  child: Image.asset(
                                    widget.carList[widget.cIndex].images[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),

                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: AppDimension.getProportionateScreenHeight(25)),
                          Text(
                            '${widget.carList[widget.cIndex].yearOfManufacture} ${widget.carList[widget.cIndex].make} ${widget.carList[widget.cIndex].model}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                fontSize: AppDimension.font16,
                                color: AppColors.text
                            ),
                          ),
                          SizedBox(height: AppDimension.height8),
                          Text(
                            '\u20A6${widget.carList[widget.cIndex].priceOfCar.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                              fontSize: AppDimension.font16,
                                color: AppColors.primary500,
                          ),)
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: (){
                            //Todo: add necessary functionality
                          },
                          icon: SvgPicture.asset('assets/icons/upload.svg')),
                    ],
                  ),
                  SizedBox(height: AppDimension.height28),
                  const SectionHeader(sectionText: 'Description'),
                  SizedBox(height: AppDimension.height8),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: AppDimension.width12,
                          vertical: AppDimension.height24),
                      decoration: buildCarDetailBoxDecoration(),
                      child: Text(
                        'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: AppDimension.font14,
                          color: AppColors.black80
                        ),
                      )
                  ),
                  SizedBox(height: AppDimension.height28),
                  const SectionHeader(sectionText: 'Details'),
                  SizedBox(height: AppDimension.height8),
                  Container(
                    //height: 130,
                      padding: EdgeInsets.symmetric(horizontal: AppDimension.width14,
                          vertical: AppDimension.height24),
                      decoration: buildCarDetailBoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CarDetailTagRow(widget: widget, details: details, index1: 0, index2: 3, index3: 6),
                          CarDetailTagRow(widget: widget, details: details, index1: 1, index2: 4, index3: 7),
                          CarDetailTagRow(widget: widget, details: details, index1: 2, index2: 5, index3: 8),
                        ],
                      )
                  ),
                  SizedBox(height: AppDimension.height28),
                  const SectionHeader(sectionText: 'Features'),
                  SizedBox(height: AppDimension.height8),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: AppDimension.width8,
                    runSpacing: AppDimension.height8,
                    children: const [
                      CarTag(text: 'Air condition'),
                      CarTag(text: 'CD player'),
                      CarTag(text: 'Alloy wheels'),
                      CarTag(text: 'Sunroof'),
                      CarTag(text: 'Power steering'),
                      CarTag(text: 'Tinted glass'),
                      CarTag(text: 'Leather seat'),
                      CarTag(text: 'Wooden dashboard'),
                      CarTag(text: 'Red interior'),
                      CarTag(text: 'Xenon light'),
                    ],
                  ),
                  SizedBox(height: AppDimension.height28),
                  const SectionHeader(sectionText: 'Profile'),
                  SizedBox(height: AppDimension.height8),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: AppDimension.width14,
                          vertical: AppDimension.height24),
                      decoration: buildCarDetailBoxDecoration(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.secondary500,
                                child: Text('G', style: TextStyle(
                                  fontSize: AppDimension.font24,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white
                                ),),
                              ),
                              SizedBox(width: AppDimension.width12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text('Oloworay autos', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.text,
                                  fontSize: AppDimension.font16,
                                ),),
                                  SizedBox(height: AppDimension.height8),
                                  Text(widget.carList[widget.cIndex].region,
                                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: AppColors.black100,
                                    fontSize: AppDimension.font12,
                                  ),),
                                  Text('58 active ads',
                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: AppColors.black60,
                                      fontSize: AppDimension.font8,
                                    ),),
                              ],),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: AppDimension.width16,
                                vertical: AppDimension.height12),
                            decoration: BoxDecoration(
                              color: AppColors.ratingColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(AppDimension.getProportionateScreenHeight(52)),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(ratingIcon),
                                SizedBox(width: AppDimension.width12),
                                Text('4(20)', style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  fontSize: AppDimension.font12,
                                  color: AppColors.text,
                                ),),
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                  SizedBox(height: AppDimension.height28),
                  SectionHeader(
                    sectionText: 'Similar Vehicles',
                    btnText: 'View all',
                    onPressed: () {},
                  ),
                  SizedBox(height: AppDimension.height8),
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
                            onTapCar: () {},
                            onTapFav: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  //Container border decoration
  BoxDecoration buildCarDetailBoxDecoration() {
    return BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.transparent,
                              spreadRadius: 0.5,
                              blurRadius: 0.5,
                              offset: Offset(1,1)
                          )
                        ],
                        border: Border.all(
                            width: AppDimension.getProportionateScreenWidth(0.5),
                            color: AppColors.primary200
                        ),
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(AppDimension.height6)
                    );
  }
}


