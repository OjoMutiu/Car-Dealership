import 'package:flutter/material.dart';
import 'package:oloworay_autos_/constants/app_colors.dart';

import '../../../../constants/app_dimensions.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField({required String value, required FocusNode pinFocus}){
    if(value.length == 1){
      pinFocus.requestFocus();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: AppDimension.getProportionateScreenHeight(68),
                height: AppDimension.getProportionateScreenHeight(68),
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: true,
                    textAlign: TextAlign.center,
                    obscureText: false, //true,
                    cursorColor: AppColors.black24,
                    style: TextStyle(fontSize: AppDimension.font32, color: AppColors.black100),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: AppDimension.getProportionateScreenHeight(14))
                    ),
                    onChanged: (value){
                      nextField(value: value, pinFocus: pin2FocusNode);
                      //Todo: store pin value
                    }
                )
            ),
            SizedBox(
                width: AppDimension.getProportionateScreenHeight(68),
                height: AppDimension.getProportionateScreenHeight(68),
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    focusNode:pin2FocusNode,
                    textAlign: TextAlign.center,
                    obscureText: false, //true,
                    cursorColor: AppColors.black24,
                    style: TextStyle(fontSize: AppDimension.font32, color: AppColors.black100),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: AppDimension.getProportionateScreenHeight(18))
                    ),
                    onChanged: (value){nextField(value: value, pinFocus: pin3FocusNode);}
                )
            ),
            SizedBox(
                width: AppDimension.getProportionateScreenHeight(68),
                height: AppDimension.getProportionateScreenHeight(68),
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    focusNode:pin3FocusNode,
                    textAlign: TextAlign.center,
                    obscureText: false, //true,
                    cursorColor: AppColors.black24,
                    style:TextStyle(fontSize: AppDimension.font32, color: AppColors.black100),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: AppDimension.getProportionateScreenHeight(18))
                    ),
                    onChanged: (value){nextField(value: value, pinFocus: pin4FocusNode);}
                )
            ),
            SizedBox(
                width: AppDimension.getProportionateScreenHeight(68),
                height: AppDimension.getProportionateScreenHeight(68),
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    focusNode: pin4FocusNode,
                    textAlign: TextAlign.center,
                    obscureText: false,//true,
                    cursorColor: AppColors.black24,
                    style: TextStyle(fontSize: AppDimension.font32, color: AppColors.black100),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: AppDimension.getProportionateScreenHeight(18))
                    ),
                    onChanged: (value){pin4FocusNode.unfocus();}
                )
            ),
          ],
        ),
      ),
    );
  }

}