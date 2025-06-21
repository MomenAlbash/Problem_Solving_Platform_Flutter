import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/utils//AppTextStyle.dart';

import '../utils//color_constants.dart';


class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({this.textInputType,this.minLines,this.onChanged,this.onSaved,this.onPressedICon,this.obscureText,  this.validator,this.suffixIcon,required this.controller,required this.hintText,super.key});
  final String hintText;
  final IconData? suffixIcon;
  final bool? obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onPressedICon;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextInputType? textInputType;
  final int? minLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      style: const TextStyle(
        color: Colors.white,
      ),
     onSaved: onSaved,
     onChanged: onChanged,
     obscureText: obscureText??false,
      validator:validator,
      controller: controller,
      cursorColor: greyColor,
      keyboardType: textInputType,
      minLines:minLines ,
      maxLines: 40,
      decoration: InputDecoration(
        border: BorderBuilder(),

        focusedBorder: BorderBuilder(),
        errorBorder: BorderBuilder(color: Colors.red),
        fillColor: fieldColor,
          hintText: hintText,
          hintMaxLines: 1,

          hintStyle:AppTextStyles.bodyText1(context,greyColor).copyWith(fontSize: 12),
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
