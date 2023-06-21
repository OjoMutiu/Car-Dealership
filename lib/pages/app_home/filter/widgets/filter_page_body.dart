import 'package:flutter/material.dart';
import 'package:oloworay_autos_/pages/app_home/filter/widgets/filter_form_field.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_dimensions.dart';

class FilterPageBody extends StatefulWidget {
  const FilterPageBody({Key? key}) : super(key: key);

  @override
  State<FilterPageBody> createState() => _FilterPageBodyState();
}

class _FilterPageBodyState extends State<FilterPageBody> {
  @override
  Widget build(BuildContext context) {

    double progressValue = 0.00;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimension.getProportionateScreenHeight(18),
          horizontal: AppDimension.width20),
      child: Column(
        children: [
          FilterField(title: 'Make', text: 'Mercedes-Benz', onPressed: (){},),
          SizedBox(height: AppDimension.height16),
          FilterField(title: 'Model', text: 'CLS', onPressed: (){},),
          SizedBox(height: AppDimension.height16),
          FilterField(title: 'Body', text: 'SUV', onPressed: (){},),
          SizedBox(height: AppDimension.height16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppDimension.width10,
                vertical: AppDimension.height6),
            decoration: BoxDecoration(
              // color: kPrimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    width: 1,
                    color: AppColors.primary200
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Year of Manufacture', style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.text
                ),),
                Slider(value: progressValue,
                    min: 0.00,
                    max: 100000,
                    onChanged: (value){
                      progressValue = value;
                    }),

              ],
            ),
          ),
          SizedBox(height: AppDimension.height16),
          FilterField(title: 'Color', text: 'Blue', onPressed: (){},),
          SizedBox(height: AppDimension.height16),
        ],
      ),
    );
  }
}


