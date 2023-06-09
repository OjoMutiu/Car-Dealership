import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/color.dart';
import '../home/car_card.dart';
import '../home/model/car_model.dart';
import '../../constant/size.dart';
import '../home/section_header.dart';

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
                        left: Size().getProportionateScreenWidth(4.0)),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: Size().getProportionateScreenWidth(20),
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                SizedBox(width: Size().getProportionateScreenWidth(263)),
                Container(
                  padding:
                  EdgeInsets.all(Size().getProportionateScreenHeight(6)),
                  width: Size().getProportionateScreenWidth(32),
                  height: Size().getProportionateScreenHeight(32),
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
              padding: EdgeInsets.symmetric(horizontal: Size().getProportionateScreenWidth(22.0)),
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
                              width: selectedCarIndex == index ? Size().getProportionateScreenWidth(90)
                                  :Size().getProportionateScreenWidth(78),
                              height: selectedCarIndex == index ? Size().getProportionateScreenHeight(90)
                                  :Size().getProportionateScreenHeight(76),
                              decoration: BoxDecoration(
                                  color: kPrimaryColor.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      width: selectedCarIndex == index ? 2: 0,
                                      color: kPrimaryColor.withOpacity(0.2)
                                  )
                              ),
                              child:
                              ClipRRect(
                                borderRadius: BorderRadius.circular(Size().getProportionateScreenWidth(6)),
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
                          SizedBox(height: Size().getProportionateScreenHeight(25)),
                          Text(
                            '${widget.carList[widget.cIndex].yearOfManufacture} ${widget.carList[widget.cIndex].make} ${widget.carList[widget.cIndex].model}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: kHeadLineTextColor),
                          ),
                          SizedBox(height: Size().getProportionateScreenHeight(8)),
                          Text(
                            '\u20A6${widget.carList[widget.cIndex].priceOfCar.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600),
                          ),
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
                  SizedBox(height: Size().getProportionateScreenHeight(30)),
                  const HeaderText(text: 'Description'),
                  SizedBox(height: Size().getProportionateScreenHeight(8)),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: Size().getProportionateScreenWidth(12),
                          vertical: Size().getProportionateScreenHeight(24)),
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
                              color: kPrimaryColor.withOpacity(0.18)
                          ),
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(6)
                      ),
                      child: Text(
                        'A very sound Toyota camry working very perfectly okay. Has brand new tyres. Nothing to fix, just buy and drive.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                  ),
                  SizedBox(height: Size().getProportionateScreenHeight(30)),
                  const HeaderText(text: 'Details'),
                  SizedBox(height: Size().getProportionateScreenHeight(8)),
                  Container(
                    //height: 130,
                    padding: EdgeInsets.symmetric(horizontal: Size().getProportionateScreenWidth(14),
                        vertical: Size().getProportionateScreenHeight(24)),
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
                            color: kPrimaryColor.withOpacity(0.18)
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
                  SizedBox(height: Size().getProportionateScreenHeight(30)),
                  SectionHeader(
                    sectionText: 'Similar Vehicles',
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CarDetailTagRow extends StatelessWidget {
  const CarDetailTagRow({
    super.key,
    required this.details,
    required this.widget, required this.index1, required this.index2, required this.index3,
  });

  final CarDetailsBody widget;
  final List<Map<String, dynamic>> details;
  final int index1, index2, index3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarDetailTag(widget: widget, headerText: details[index1]["headerText"], text:  details[index1]["text"]),
        CarDetailTag(widget: widget, headerText: details[index2]["headerText"], text:  details[index2]["text"]),
        CarDetailTag(widget: widget, headerText: details[index3]["headerText"], text:  details[index3]["text"]),
      ],
    );
  }
}

class CarDetailTag extends StatelessWidget {
  const CarDetailTag({
    super.key,
    required this.widget, required this.headerText, required this.text,
  });
  final String headerText, text;
  final CarDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headerText, style: GoogleFonts.poppins(
          color: const Color(0xFFB5B5B5),
          fontSize: 11,
          fontWeight: FontWeight.normal
        ),),
        Text(text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: const Color(0xFF0B4D51)
        ),),
      ],
    );
  }
}

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: kHeadLineTextColor,
      fontWeight: FontWeight.normal,
    ),);
  }
}