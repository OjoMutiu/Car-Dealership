import 'package:flutter/material.dart';

import '../../../../constants/app_dimensions.dart';


class CarFilterCard extends StatelessWidget {
  const CarFilterCard({
    super.key, required this.imgSrc, required this.carName, required this.onTap,
  });

  final String imgSrc;
  final String carName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: AppDimension.getProportionateScreenWidth(48),
            height: AppDimension.getProportionateScreenWidth(48),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 0.5,
                ),
                color: Colors.white60, borderRadius: BorderRadius.circular(40)),
            child: Center(
                child: Image.asset(imgSrc)),
          ),
          SizedBox(height: AppDimension.height6,),
          Text(carName,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: 10, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }
}