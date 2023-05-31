import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oloworay_autos/src/constant/color.dart';
import 'package:oloworay_autos/src/constant/size.dart';

import 'body.dart';
import 'home_page_user_profile_header.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key, this.userName}) : super(key: key);
  final String? userName;

  @override
  Widget build(BuildContext context) {
    Size().init(context);
    return  SafeArea(
      child: Scaffold(
        body: Body(userName: userName!,),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.red,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(color: kPrimaryColor, size: Size().getProportionateScreenWidth(17)),
          selectedItemColor: kPrimaryColor,
          selectedLabelStyle:  GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 10),
          unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 10),
          unselectedIconTheme: IconThemeData(color: kPrimaryColor, size: Size().getProportionateScreenWidth(16)),
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
