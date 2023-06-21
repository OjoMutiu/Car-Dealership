import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';

import '../../constants/app_dimensions.dart';
import 'home_page/main_page.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key, this.userName}) : super(key: key);
  final String? userName;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:  const HomePageBody(),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.red,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(color: AppColors.primary500, size: AppDimension.getProportionateScreenWidth(17)),
          selectedItemColor: AppColors.primary500,
          selectedLabelStyle:  Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: AppDimension.font10),
          unselectedLabelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: AppDimension.font10),
          unselectedIconTheme: IconThemeData(color: AppColors.primary500, size: AppDimension.height16),
          unselectedItemColor: Colors.black45,
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/home.svg'),
                label: 'Home'),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/message.svg'),label: 'Message',),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/sell.svg'), label: 'Sell'),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/invest.svg'), label: 'Invest'),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/account.svg'), label:'Account')
          ],
        ),
      ),
    );
  }
}
