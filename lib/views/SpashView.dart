import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skills_over_flow_app/helper/CachHelper.dart';
import 'package:skills_over_flow_app/utils/AppRouter.dart';
import 'package:skills_over_flow_app/views/LoginView.dart';

import '../utils/AppTextStyle.dart';
import '../utils/color_constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  final String id = 'SplashView';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String? tokesdn=CacheHelper.getData(key: 'isLogin');
    if(tokesdn!=null){
      navigateToHome();
    }else{
      navigateToLogin();
    }

  }

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

  void navigateToLogin() {

    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.loginView);
    });
  }
  void navigateToHome() {

    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(AppRouter.homeView);
    });
  }
}
