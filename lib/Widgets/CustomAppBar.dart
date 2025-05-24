
import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/constants/color_constants.dart';

class CustomAppBarUsersView extends StatelessWidget {
  const CustomAppBarUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: fieldColor,
            ),
            child: IconButton(onPressed: (){}, icon:const Icon(Icons.filter_list_rounded,color: greyColor,))),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:const Color(0xFF303D48),
            ),
            child: IconButton(onPressed: (){}, icon:const Icon(Icons.filter_list_rounded,color: greyColor,))),
      ],

    );
  }
}