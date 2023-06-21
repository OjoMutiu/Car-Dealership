import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';

import '../../../../models/car_model.dart';
import '../../widget/car_card.dart';
import '../../widget/header_text.dart';
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
                top: 15,
                left: 25,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
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
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: AppDimension.getProportionateScreenWidth(263)),
                    Container(
                      padding:
                      EdgeInsets.all(AppDimension.height6),
                      width: AppDimension.getProportionateScreenWidth(32),
                      height: AppDimension.getProportionateScreenHeight(32),
                      decoration: BoxDecoration(
                          color: const Color(0xFFE4F4F4),
                          borderRadius: BorderRadius.circular(6)),
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
                  ],
                ),
              )
            ]),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimension.getProportionateScreenWidth(22.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.carList[widget.cIndex].images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 10, bottom: 0, top: 10.0),
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
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Close'))
                                      ],
                                    );
                                  });
                            },
                            child:
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: selectedCarIndex == index ? AppDimension.getProportionateScreenWidth(90)
                                  :AppDimension.getProportionateScreenWidth(78),
                              height: selectedCarIndex == index ? AppDimension.getProportionateScreenHeight(90)
                                  :AppDimension.getProportionateScreenHeight(76),
                              decoration: BoxDecoration(
                                  color:AppColors.primary200,
                                  borderRadius: BorderRadius.circular(AppDimension.height6),
                                  border: Border.all(
                                      width: selectedCarIndex == index ? 2: 0,
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
                                color: AppColors.primary600),
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
                  SizedBox(height: AppDimension.height30),
                  const HeaderText(text: 'Description'),
                  SizedBox(height: AppDimension.height8),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: AppDimension.width12,
                          vertical: AppDimension.height24),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.transparent,
                                spreadRadius: 0.5,
                                blurRadius: 0.5,
                                offset: Offset(1,1)
                            )
                          ],
                          border: Border.all(
                              width: 1,
                              color: AppColors.primary200
                          ),
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Text(
                        'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                  ),
                  SizedBox(height: AppDimension.height30),
                  const HeaderText(text: 'Details'),
                  SizedBox(height: AppDimension.height8),
                  Container(
                    //height: 130,
                      padding: EdgeInsets.symmetric(horizontal: AppDimension.width14,
                          vertical: AppDimension.height24),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.transparent,
                                spreadRadius: 0.5,
                                blurRadius: 0.5,
                                offset: Offset(1,1)
                            )
                          ],
                          border: Border.all(
                              width: 1,
                              color: AppColors.primary200
                          ),
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CarDetailTagRow(widget: widget, details: details, index1: 0, index2: 3, index3: 6),
                          CarDetailTagRow(widget: widget, details: details, index1: 1, index2: 4, index3: 7),
                          CarDetailTagRow(widget: widget, details: details, index1: 2, index2: 5, index3: 8),
                        ],
                      )
                  ),
                  SizedBox(height: AppDimension.height30),
                  SectionHeader(
                    sectionText: 'Similar Vehicles',
                    btnText: 'View all',
                    onPressed: () {},
                  ),
                  SizedBox(height: AppDimension.height12),
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
}


