import 'package:flutter/material.dart';

import '../../constant/color.dart';
import '../../constant/size.dart';
import 'model/car_model.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      height: Size().getProportionateScreenHeight(34),
      decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(6)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildButton(0, 'All'),
            const SizedBox(width: 10,),
            const Text('|'),
            const SizedBox(width: 10,),
            buildButton(1, 'Used '),
            const SizedBox(width: 10,),
            const Text('|'),
            const SizedBox(width: 10,),
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
                    ?.copyWith(color: Colors.white),
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
                    ?.copyWith(color: kPrimaryColor),
              ),
            ),
          );
  }
}
