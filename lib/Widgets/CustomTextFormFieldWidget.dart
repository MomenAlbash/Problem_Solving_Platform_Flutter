import 'package:flutter/material.dart';

import '../constants/color_constants.dart';


class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({ this.suffixIcon,required this.controller,required this.hintText,super.key});
  final String hintText;
  final IconData? suffixIcon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 350,
      child: TextFormField(
        controller: controller,

        decoration: InputDecoration(
          border: BorderBuilder(),
          focusedBorder: BorderBuilder(),
          errorBorder: BorderBuilder(color: Colors.red),
          fillColor: Color(0xFF303D48),
            hintText: hintText,
            hintStyle:const  TextStyle(
              color: greyColor,
            ),
            suffixIcon: IconButton(
              onPressed: (){},
              icon: Icon(suffixIcon,color: greyColor,size: 32,),
            ),
            filled: true,
        ),
      ),
    );
  }

  OutlineInputBorder BorderBuilder({ Color? color}) {
    return OutlineInputBorder(
          borderSide: BorderSide(
            color: (color==null)?greyColor:color,

          ),
      borderRadius: BorderRadius.circular(15),
        );
  }


}
