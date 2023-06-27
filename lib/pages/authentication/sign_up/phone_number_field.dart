import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oloworay_autos_/constants/app_strings.dart';
import 'package:oloworay_autos_/controllers/sign_up_controller.dart';
import 'package:oloworay_autos_/widgets/text_form_field_header.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_dimensions.dart';

class AppPhoneTextField extends StatefulWidget {
  const AppPhoneTextField({
    Key? key,
    required this.headerText,
    this.asterisk,
    required this.validator,
    required this.onChanged,
    required this.hintText,
    this.controller,
    this.svgIcon,
    this.hintTextStyle,
    this.show,
    required this.textInputType,
    this.focusNode,
  }) : super(key: key);
  final String headerText;
  final String? asterisk;
  final String? Function(String? value) validator;
  final void Function(String value) onChanged;
  final String hintText;
  final TextEditingController? controller;
  final String? svgIcon;
  final TextStyle? hintTextStyle;
  final bool? show;
  final FocusNode? focusNode;
  final TextInputType textInputType;

  @override
  State<AppPhoneTextField> createState() => _AppPhoneTextFieldState();
}

class _AppPhoneTextFieldState extends State<AppPhoneTextField> {
  UserSignUpFormController userFormController = Get.find();
  FocusNode focusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {setState(() {});});
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldHeader(headerText: widget.headerText, asterisk: widget.asterisk),
        SizedBox(
          height: AppDimension.height8,
        ),
        SizedBox(
          height: AppDimension.height52,
          child: Row(
            children: [
              Container(
                height: AppDimension.height52,
                decoration: BoxDecoration(
                    color: focusNode.hasFocus? AppColors.primary200
                        :AppColors.fade.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        bottomLeft: Radius.circular(6))),
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppDimension.height10),
                        child: Obx(
                          () => Text(
                            userFormController.selectedCountryCode.value,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: AppColors.black100),
                          ),
                        )),
                    GestureDetector(
                        onTap: () async {
                          userFormController.onTap();
                        },
                        child: Container(
                            padding:
                                EdgeInsets.only(right: AppDimension.height10),
                            child: SvgPicture.asset(dropDownIcon))),
                  ],
                ),
              ),
              Expanded(
                child: TextFormField(
                  focusNode: focusNode,
                  controller: widget.controller,
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                  keyboardType: widget.textInputType,
                  cursorColor: Colors.black87,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.black80,
                        fontSize: AppDimension.font14,
                      ),
                  decoration: InputDecoration(
                    focusedBorder: buildFocusedInputBorder(),
                    enabledBorder: buildOutlineInputBorder(),
                    hintText: widget.hintText,
                    hintStyle: widget.hintTextStyle ??
                        Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.fade,
                              fontSize: AppDimension.font14,
                            ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        widget.svgIcon!,
                        width: AppDimension.width13,
                        height: AppDimension.height13,
                        colorFilter: const ColorFilter.mode(
                            AppColors.fade, BlendMode.srcIn),
                      ),
                    ),
                  ),
                  obscureText: widget.show!,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildFocusedInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(6),
        bottomRight: Radius.circular(6),
      ),
      borderSide: BorderSide(width: 1, color: AppColors.primary200),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(6),
        bottomRight: Radius.circular(6),
      ),
      borderSide: BorderSide(width: 1, color: AppColors.black24),
    );
  }
}
