
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skills_over_flow_app/utils//color_constants.dart';
import 'package:skills_over_flow_app/utils/AppRouter.dart';

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
            child: IconButton(onPressed: (){
              GoRouter.of(context).push(AppRouter.homeView);
            }, icon:const Icon(Icons.keyboard_return,color: greyColor,))),
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