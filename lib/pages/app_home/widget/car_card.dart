import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';

import 'car_tags.dart';



class CarCad extends StatefulWidget {
  CarCad({
    super.key,
    this.width,
    required this.year,
    required this.price,
    required this.make,
    required this.model,
    required this.location,
    required this.transmission,
    required this.fuel,
    required this.condition,
    required this.image,
    required this.onTapCar,
    required this.onTapFav, this.wrapHeight, this.isFavTap  = false,
  });
  final int year;

  final double  price;
  final double? width, wrapHeight;
  final String image, make, model, location, transmission, fuel, condition;
  final GestureTapCallback onTapCar, onTapFav;
  bool isFavTap;


  @override
  State<CarCad> createState() => _CarCadState();
}

class _CarCadState extends State<CarCad> {
  //bool isFavTap = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.width != null ? AppDimension.getProportionateScreenWidth(widget.width!): null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: widget.onTapCar,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppDimension.height8),
                      topRight: Radius.circular(AppDimension.height8)),
                  child: SizedBox(
                    height: AppDimension.getProportionateScreenHeight(105),
                    width: widget.width != null ? AppDimension.getProportionateScreenWidth(widget.width!): null,
                    child: Image.asset(widget.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                      padding: EdgeInsets.all(AppDimension.height12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(AppDimension.height8),
                            bottomRight: Radius.circular(AppDimension.height8)),
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
                                height: AppDimension.height10,
                                width: AppDimension.width10,
                              ),
                              SizedBox(
                                  width: AppDimension.width4),
                              Text(
                                widget.location,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                  fontSize: AppDimension.font10,
                                    color: AppColors.black200),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: AppDimension.height12),
                          Text(
                            '${widget.year} ${widget.make} ${widget.model}',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                fontSize: AppDimension.font12,
                                color: AppColors.text),
                          ),
                          SizedBox(
                              height: AppDimension.height8),
                          Text(
                            '\u{20A6} ${widget.price.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                              fontSize: AppDimension.font14,
                                color: AppColors.primary500),
                          ),
                          SizedBox(
                              height: AppDimension.height12),
                          Container(
                            alignment: Alignment.bottomLeft,
                            height:  AppDimension.getProportionateScreenHeight(44),
                            child: Wrap(
                              spacing: AppDimension.width4,
                              children: [
                                CarTag(text: widget.transmission),
                                CarTag(text: widget.condition),
                                CarTag(text: widget.fuel)
                          ],
                        ),
                      ),
                      //SizedBox(height: AppDimension.height12),
                    ],
                  ),
                ),
                  Positioned(
                    top: AppDimension.getProportionateScreenHeight(-14),
                    right: AppDimension.width12,
                    child: Container(
                      padding: EdgeInsets.all(AppDimension.height6),
                      width: AppDimension.getProportionateScreenWidth(28),
                      height: AppDimension.getProportionateScreenHeight(28),
                      decoration: BoxDecoration(
                          color: AppColors.carTagColor,
                          borderRadius: BorderRadius.circular(AppDimension.height6)),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                           widget.isFavTap = !widget.isFavTap;
                          });
                        },
                        child: !widget.isFavTap? SvgPicture.asset('assets/icons/favourite.svg'):
                        SvgPicture.asset('assets/icons/fav_colored.svg'),
                      ),
                    ),
                  ),
                ]
              )
            ],
          ),
        ),
        SizedBox(
          width: AppDimension.width20,
        )
      ],
    );
  }
}
