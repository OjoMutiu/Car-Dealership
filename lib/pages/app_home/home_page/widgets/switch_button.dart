import 'package:flutter/material.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';

import '../../../../models/car_model.dart';

class ButtonSwitcher extends StatefulWidget {
  const ButtonSwitcher({super.key});

  @override
  State<ButtonSwitcher> createState() => _ButtonSwitcherState();
}

class _ButtonSwitcherState extends State<ButtonSwitcher> {
  int selectedButtonIndex = 0;

  List<Car> filteredCars = [];


  @override
  void initState() {
    super.initState();
    filteredCars = demoOloworayAutosCars;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimension.getProportionateScreenHeight(34),
      decoration: BoxDecoration(
          color: AppColors.primary200.withOpacity(0.4),
          borderRadius: BorderRadius.circular(AppDimension.height6)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildButton(0, 'All'),
            SizedBox(width: AppDimension.width10,),
            selectedButtonIndex ==2 ? const Text('|') : const Text(' '),
            SizedBox(width: AppDimension.width10,),
            buildButton(1, 'Used '),
            SizedBox(width: AppDimension.width10,),
            selectedButtonIndex ==0 ? const Text('|') : const Text(' '),
            SizedBox(width: AppDimension.width10,),
            buildButton(2, 'New'),
          ],
        ),
      ),
    );
  }

  void filterCar(){
    setState(() {
      filteredCars = demoOloworayAutosCars.where((car){
        if(selectedButtonIndex == 0){
          return true;
        }else if(selectedButtonIndex == 1){
          return car.condition == 'Foreign Used' || car.condition == 'Nigerian Used';
        }
        return false;
      }).toList();
    });
  }

  Widget buildButton(int buttonIndex, String text) {
    final bool isSelected = buttonIndex == selectedButtonIndex;

    return isSelected
        ? Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppDimension.width4,
                  vertical: AppDimension.getProportionateScreenHeight(3)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                onPressed: () {
                  setState(() {
                    selectedButtonIndex = buttonIndex;
                  });
                },
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(
                      fontSize: AppDimension.font14,
                      color: Colors.white),
                ),
              ),
            ),
    )
        : Expanded(
            child: TextButton(
              style: TextButton.styleFrom( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
              onPressed: () {
                setState(() {
                  selectedButtonIndex = buttonIndex;
                });
              },
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                    fontSize: AppDimension.font12,
                    color: AppColors.primary500),
              ),
            ),
    );
  }
}
