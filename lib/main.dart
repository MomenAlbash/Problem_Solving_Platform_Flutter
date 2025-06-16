import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_over_flow_app/Simple_bloc_observer.dart';
import 'package:skills_over_flow_app/helper/CachHelper.dart';
import 'package:skills_over_flow_app/utils/AppRouter.dart';
import 'package:skills_over_flow_app/views/ChangePasswordView.dart';
import 'package:skills_over_flow_app/views/LoginView.dart';
import 'package:skills_over_flow_app/views/SignUpView.dart';
import 'package:skills_over_flow_app/views/SpashView.dart';
import 'package:skills_over_flow_app/views/userInfoView.dart';
import 'package:skills_over_flow_app/views/usersView.dart';

import 'helper/network/api.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=SimpleBlocObserver();
  await CacheHelper.init();
  Api.init();
  runApp(SkillsOverFlowApp());
}
class SkillsOverFlowApp extends StatelessWidget {
  const SkillsOverFlowApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,

      darkTheme: ThemeData(
        drawerTheme: DrawerThemeData(
          backgroundColor: Color(0xFF021526),
        ),
      fontFamily: 'Jannat', // الخط الافتراضي للتطبيق
     textTheme:const TextTheme(
      bodyText1: TextStyle(fontFamily: 'Jannat',fontSize: 16), // للنصوص الأساسية
      headline1: TextStyle(fontFamily: 'AutonomousMono',fontSize: 24),  // للعناوين
    ),
        scaffoldBackgroundColor: Color(0xFF021526),
      ),
      themeMode: ThemeMode.dark,
    );

  }
}
