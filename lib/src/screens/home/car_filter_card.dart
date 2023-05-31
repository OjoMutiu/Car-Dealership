import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/size.dart';

class CarFilter extends StatelessWidget {
  const CarFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    List<Map<String, String>> cars = [
      {"image": "assets/images/home_screen/Toyota.png", "name": "Toyota"},
      {"image": "assets/images/home_screen/Honda.png", "name": "Honda"},
      {"image": "assets/images/home_screen/lexus.png", "name": "Lexus"},
      {"image": "assets/images/home_screen/Ford.png", "name": "Ford"},
      {"image": "assets/images/home_screen/BMW.png", "name": "BMW"},
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Size().getProportionateScreenWidth(15),
          vertical: Size().getProportionateScreenHeight(20)),
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.03),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(cars.length, (index) => CarFilterCard(
              imgSrc: cars[index]["image"]!, carName: cars[index]["name"]!,
            onTap: () {
                switch(index){
                  case 0:
                    //Todo: filter all toyota car
                    break;
                  case 1:
                    break;
                  case 2:
                    break;
                  case 3:
                    break;
                  case 4:
                    break;
                }
            },))
        ],
      ),
    );
  }
}

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
            width: Size().getProportionateScreenWidth(48),
            height: Size().getProportionateScreenWidth(48),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 0.5,
                ),
                color: Colors.white60, borderRadius: BorderRadius.circular(40)),
            child: Center(
                child: Image.asset(imgSrc)),
          ),
          SizedBox(height: Size().getProportionateScreenHeight(6),),
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