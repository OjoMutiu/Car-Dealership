import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/constant/color.dart';
import 'package:oloworay_autos/src/screens/car_details/body.dart';
import 'package:oloworay_autos/src/screens/car_details/cutom_bottom_nav.dart';

import '../home/model/car_model.dart';
import '../../constant/size.dart';

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
    return Scaffold(
        body: CarDetailsBody(carList: widget.carList, cIndex: widget.cIndex,),
      bottomNavigationBar: const CustomBottomNavigationBar()
    );
  }
}
