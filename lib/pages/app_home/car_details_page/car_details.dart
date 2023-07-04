import 'package:flutter/material.dart';
import 'package:oloworay_autos_/pages/app_home/car_details_page/widgets/buttom_nav_bar.dart';
import 'package:oloworay_autos_/pages/app_home/car_details_page/widgets/car_details_body.dart';

import '../../../models/car_model.dart';

class CarDetails extends StatefulWidget {
  const CarDetails({Key? key, required this.carList, required this.cIndex })
      : super(key: key);
  final List<Car> carList;
  final int cIndex;

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: CarDetailsBody(carList: widget.carList, cIndex: widget.cIndex,),
          bottomNavigationBar: const CustomBottomNavigationBar()
      ),
    );
  }
}
