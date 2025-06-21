import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/models/tag_model..dart';
import 'package:skills_over_flow_app/utils/AppTextStyle.dart';

import '../utils/color_constants.dart';

class CustomContainerTagProblemWidget extends StatelessWidget {
  const CustomContainerTagProblemWidget({required this.tagmodel, super.key});
  final tagModel tagmodel;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: blueColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 3),
          child: Text(tagmodel.tagName,style: AppTextStyles.bodyText1(context, yellowColor).copyWith(fontSize: 12),));
  }
}
