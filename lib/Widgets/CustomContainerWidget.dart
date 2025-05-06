import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class CustomContainerWidget extends StatelessWidget {


  const CustomContainerWidget({required this.onTap}) ;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 350,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [Color(0xFF77B0D8),Color(0xFFA2C4C9), yellowColor], // ألوان متعددة
            stops: [0.0, 0.5,1], // توزيع النسب
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child: const Text('Log in',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
      ),
    );
  }
}