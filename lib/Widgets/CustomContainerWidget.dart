import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CustomContainerWidget extends StatelessWidget {


  const CustomContainerWidget({required this.text,required this.onTap}) ;
  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [blueColor, yellowColor], // ألوان متعددة
            stops: [0.0,0.8], // توزيع النسب
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child:  Text(text,style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
      ),
    );
  }
}