import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/color.dart';
import '../../constant/size.dart';
import 'car_tag.dart';



class CarCad extends StatelessWidget {
  const CarCad({
    super.key, required this.width,
    required this.year,
    required this.price,
    required this.make,
    required this.model,
    required this.location,
    required this.transmission,
    required this.fuel,
    required this.condition, required this.image, required this.aspectRatio, required this.onTapCar, required this.onTapFav,
  });
  final int year;
  final double width, price, aspectRatio;
  final String image, make, model, location, transmission, fuel, condition;
  final GestureTapCallback onTapCar, onTapFav;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Size().getProportionateScreenWidth(width),
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: Stack(
              children:[ Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: onTapCar,
                    child: SizedBox(
                        width: Size().getProportionateScreenWidth(width),
                        child: Image.asset(
                          image,
                          fit: BoxFit.fitWidth,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        Size().getProportionateScreenWidth(12),
                        Size().getProportionateScreenHeight(12),
                        0,
                        Size().getProportionateScreenHeight(12)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(
                              0, 1), // changes the position of the shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/location.svg',
                              height: Size().getProportionateScreenHeight(10),
                              width: Size().getProportionateScreenWidth(10),
                            ),
                            SizedBox(
                                width: Size().getProportionateScreenWidth(4)),
                            Text(
                              location,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: const Color(0xFF403F3F)),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: Size().getProportionateScreenHeight(12)),
                        Text(
                          '${year} ${make} ${model}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: kHeadLineTextColor),
                        ),
                        SizedBox(height: Size().getProportionateScreenHeight(8)),
                        Text(
                          '\u20A6${price.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: Size().getProportionateScreenHeight(12)),
                        Row(
                          children: [
                            CarTag(text: transmission),
                            CarTag(text: condition),
                            CarTag(text: fuel)
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
                Positioned(
                  top: Size().getProportionateScreenHeight(96),
                  left: Size().getProportionateScreenWidth(176),
                  child: Container(
                    padding: EdgeInsets.all(Size().getProportionateScreenHeight(6)),
                    width: Size().getProportionateScreenWidth(28),
                    height: Size().getProportionateScreenHeight(28),
                    decoration: BoxDecoration(
                        color: const Color(0xFFE4F4F4),
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: GestureDetector(
                      onTap: onTapFav,
                      child: SvgPicture.asset('assets/icons/favourite.svg'),
                    ),
                  ),
                ),
              ]
            ),
          ),
        ),
        SizedBox(width: Size().getProportionateScreenWidth(20),)
      ],
    );
  }
}