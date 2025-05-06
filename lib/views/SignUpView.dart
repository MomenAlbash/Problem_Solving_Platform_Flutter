
import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/Widgets/CustomContainerWidget.dart';
import 'package:skills_over_flow_app/Widgets/CustomTextFormFieldWidget.dart';
import 'package:skills_over_flow_app/constants/color_constants.dart';
import 'package:skills_over_flow_app/constants/texts.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  final String id='SignUpView';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController usernameController=TextEditingController();

  final TextEditingController passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
           children: [
             mediumText(text: 'Welcome to SkillsOverFlow', color: yellowColor),
             const SizedBox(height: 10,),
             smallText(text: 'log to your account', color: greyColor),
             const SizedBox(height: 30,),
             CustomTextFormFieldWidget(controller: usernameController, hintText: 'Username*'),
             const SizedBox(height: 10,),
             CustomTextFormFieldWidget(controller: passwordController, hintText: 'Password*'),
             const SizedBox(height: 10,),
             SizedBox(height: 40,),
             CustomContainerWidget(onTap: (){}),
           ],
          ),
        ),
      ),
    );
  }
}
