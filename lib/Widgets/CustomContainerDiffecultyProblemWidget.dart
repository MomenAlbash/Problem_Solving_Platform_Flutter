import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/utils/AppTextStyle.dart';

import '../utils/color_constants.dart';

class CustomContainerDiffecultyProblemWidget extends StatelessWidget {
  const CustomContainerDiffecultyProblemWidget({required this.text,required this.color, super.key});
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 3),
          child: Text(text,style: AppTextStyles.bodyText1(context, yellowColor).copyWith(fontSize: 12),));
  }
}
