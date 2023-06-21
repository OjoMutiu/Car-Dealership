import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';

import 'car_tags.dart';



class CarCad extends StatefulWidget {
  const CarCad({
    super.key,
    required this.width,
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
    required this.onTapFav, this.wrapHeight,
  });
  final int year;

  final double width, price;
  final double? wrapHeight;
  final String image, make, model, location, transmission, fuel, condition;
  final GestureTapCallback onTapCar, onTapFav;


  @override
  State<CarCad> createState() => _CarCadState();
}

class _CarCadState extends State<CarCad> {
  bool isFavTap = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppDimension.getProportionateScreenWidth(widget.width),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTapCar,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    child: SizedBox(
                      height: 110,
                      width: AppDimension.getProportionateScreenWidth(widget.width),
                      child: Image.asset(widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      AppDimension.height12,
                      AppDimension.height12,
                      0,
                      AppDimension.height12),
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
                            height: AppDimension.height10,
                            width: AppDimension.width10,
                          ),
                          SizedBox(
                              width: AppDimension.width4),
                          Text(
                            widget.location,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: const Color(0xFF403F3F)),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: AppDimension.height12),
                      Text(
                        '${widget.year} ${widget.make} ${widget.model}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: AppColors.primary600),
                      ),
                      SizedBox(
                          height: AppDimension.height8),
                      Text(
                        '\u20A6${widget.price.toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                            color: AppColors.primary500,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                          height: AppDimension.height12),
                      Container(
                        alignment: Alignment.bottomLeft,
                        height:  widget.wrapHeight != null ? AppDimension.getProportionateScreenHeight(66)
                            : null,
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
                )
              ],
            ),
            Positioned(
              top: AppDimension.getProportionateScreenHeight(97),
              right: AppDimension.getProportionateScreenWidth(10),
              child: Container(
                padding: EdgeInsets.all(AppDimension.height6),
                width: AppDimension.getProportionateScreenWidth(28),
                height: AppDimension.getProportionateScreenHeight(28),
                decoration: BoxDecoration(
                    color: const Color(0xFFE4F4F4),
                    borderRadius: BorderRadius.circular(6)),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      isFavTap = !isFavTap;
                    });
                  },
                  child: !isFavTap? SvgPicture.asset('assets/icons/favourite.svg'):
                  SvgPicture.asset('assets/icons/fav_colored.svg'),
                ),
              ),
            ),
          ]),
        ),
        SizedBox(
          width: AppDimension.width20,
        )
      ],
    );
  }
}
