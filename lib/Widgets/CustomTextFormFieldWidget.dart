import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/constants/AppTextStyle.dart';

import '../constants/color_constants.dart';


class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({this.onPressedICon,this.obscureText,  this.validator,this.suffixIcon,required this.controller,required this.hintText,super.key});
  final String hintText;
  final IconData? suffixIcon;
  final bool? obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onPressedICon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
     obscureText: obscureText??false,
      validator:validator,
      controller: controller,
      cursorColor: greyColor,
      decoration: InputDecoration(
        border: BorderBuilder(),
        focusedBorder: BorderBuilder(),
        errorBorder: BorderBuilder(color: Colors.red),
        fillColor: fieldColor,
          hintText: hintText,
          hintStyle:AppTextStyles.bodyText1(context,greyColor),
          suffixIcon: IconButton(
            onPressed: onPressedICon,
            icon: Icon(suffixIcon,color: greyColor,size: 32,),
          ),
          filled: true,
      ),
    );
  }

  OutlineInputBorder BorderBuilder({ Color? color}) {
    return OutlineInputBorder(
          borderSide: BorderSide(
            color: (color==null)?greyColor:color,

          ),
      borderRadius: BorderRadius.circular(10),
        );
  }


}
