import 'package:flutter/material.dart';

import '../utils/color_constants.dart';

class CustomContainerIconWidget extends StatelessWidget {
  const CustomContainerIconWidget({required this.icon,required this.onPressed,super.key});
  final  void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 55,
        decoration: BoxDecoration(
          color: fieldColor,
          borderRadius:BorderRadius.circular(10),
        ),
          child: IconButton(onPressed: (){},
              icon: Icon(icon,color: yellowColor,)));
  }
}
