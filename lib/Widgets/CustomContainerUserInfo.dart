
import 'package:flutter/material.dart';

import '../constants/AppTextStyle.dart';
import '../constants/color_constants.dart';

class CustomContainerUserInfo extends StatelessWidget {
  const CustomContainerUserInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 19) ,
      child: Row(
        children: [
          Container(
            decoration:  BoxDecoration(
              color: Colors.deepOrange,
              image: DecorationImage(image: AssetImage('assets/images/63cc53c23c4c5a9d08843b6e1548bd1b.jpg'),fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 40,
            width: 40,
          ),
          const SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('User Name:',style: AppTextStyles.bodyText1(context, yellowColor),),
                  Text(' momen_bash',style: AppTextStyles.bodyText1(context, yellowColor),),
                ],
              ),
              const SizedBox(height: 5,),
              Text('* * * * *',style: AppTextStyles.bodyText1(context, Color(0xFFD2D2D2),),),
            ],
          ),
        ],
      ),
    );

  }
}