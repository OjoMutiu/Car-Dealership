import 'package:flutter/material.dart';
import 'package:oloworay_autos/src/constant/color.dart';

import '../../constant/size.dart';

class FilterPageBody extends StatefulWidget {
  const FilterPageBody({Key? key}) : super(key: key);

  @override
  State<FilterPageBody> createState() => _FilterPageBodyState();
}

class _FilterPageBodyState extends State<FilterPageBody> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: Size().getProportionateScreenHeight(18),
          horizontal: Size().getProportionateScreenWidth(20)),
      child: Column(
        children: [
          FilterField(title: 'Make', text: 'Mercedes-Benz', onPressed: (){},),
          SizedBox(height: Size().getProportionateScreenHeight(16),),
          FilterField(title: 'Model', text: 'CLS', onPressed: (){},),
          SizedBox(height: Size().getProportionateScreenHeight(16),),
          FilterField(title: 'Body', text: 'SUV', onPressed: (){},),
          SizedBox(height: Size().getProportionateScreenHeight(16),),
          FilterField(title: 'Color', text: 'Blue', onPressed: (){},),
          SizedBox(height: Size().getProportionateScreenHeight(16),),
        ],
      ),
    );
  }
}

class FilterField extends StatelessWidget {
  const FilterField({
    super.key, required this.title, required this.text, required this.onPressed,
  });
  final String title, text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: Size().getProportionateScreenHeight(7),
          horizontal: Size().getProportionateScreenWidth(12)),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: kPrimaryColor.withOpacity(0.15),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: kBodyTextColor
              ),),
              Text(text, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: kHeadLineTextColor
              ),),
            ],
          ),
          const Spacer(),
          IconButton(onPressed: onPressed, icon: Icon(Icons.keyboard_arrow_down,
            size: Size().getProportionateScreenHeight(18),
            color: kPrimaryColor,
          ))
        ],
      ),
    );
  }
}
