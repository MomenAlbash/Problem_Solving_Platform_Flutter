import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/constants/AppTextStyle.dart';
import 'package:skills_over_flow_app/constants/color_constants.dart';
import 'package:skills_over_flow_app/views/LoginView.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  final String id = 'SplashView';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {



  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(height:220,width:220,child: Image(image: AssetImage('assets/images/Black Modern Software Programmer Logo 2.png'),)),
          Text('SkillsOverFlow',textAlign: TextAlign.center,style: AppTextStyles.headline1WithYellow(context).copyWith(fontSize: 35)),
          SizedBox(height: 10,),
          Text('Your Space to Master C++',textAlign: TextAlign.center,style: AppTextStyles.bodyText1(context, yellowColor),),
        ],
      ),

    );
  }
}
