import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/constants/app_dimensions.dart';

import '../../../../constants/app_colors.dart';
import 'filter_icon_button.dart';



class SearchFilter extends StatelessWidget {
  const SearchFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimension.height52,
      child: Row(
        children: [
          Expanded(
            child:
            TextFormField(
              onSaved: (value){},
              validator: (value) {
                return null;
              },
              onChanged: (value){},
              keyboardType: TextInputType.text,
              cursorColor: AppColors.black24,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.black80,
                fontSize: AppDimension.font14,
              ),
              decoration: InputDecoration(
                hintText: 'Search by Brand, Model or Keywords',
                hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.fade,
                  fontSize: AppDimension.font12,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset( 'assets/icons/searchLens.svg',
                    width: AppDimension.width10,
                    height: AppDimension.width10,
                    colorFilter: const ColorFilter.mode(
                        AppColors.fade, BlendMode.srcIn),
                  ),
                ),
              ),
            )
          ),
          SizedBox(width: AppDimension.width20),
          const FilterIconButton(),
        ],
      ),
    );
  }
}