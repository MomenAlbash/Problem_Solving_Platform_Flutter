import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/views/LoginView.dart';
import 'package:skills_over_flow_app/views/SignUpView.dart';

void main(){
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
        scaffoldBackgroundColor: Color(0xFF021526),
      ),
      themeMode: ThemeMode.dark,
    );

  }
}
