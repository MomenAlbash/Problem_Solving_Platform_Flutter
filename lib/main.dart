import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_over_flow_app/Simple_bloc_observer.dart';
import 'package:skills_over_flow_app/views/LoginView.dart';
import 'package:skills_over_flow_app/views/SignUpView.dart';

import 'helper/network/api.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=SimpleBlocObserver();
  Api.init();
  runApp(SkillsOverFlowApp());
}
class SkillsOverFlowApp extends StatelessWidget {
  const SkillsOverFlowApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        LoginView().id:(context) =>LoginView(),
        SignUpView().id :(context) => SignUpView(),
      },
      initialRoute: LoginView().id,
      darkTheme: ThemeData(
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
