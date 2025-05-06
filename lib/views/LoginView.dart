import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/Widgets/CustomContainerWidget.dart';
import 'package:skills_over_flow_app/Widgets/CustomTextFormFieldWidget.dart';
import 'package:skills_over_flow_app/views/SignUpView.dart';

import '../Components/Components.dart';
import '../constants/color_constants.dart';
import '../constants/texts.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  final String id = 'loginview';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(
              flex: 8,
            ),
            mediumText(text: 'Welcome to SkillsOverFlow', color: yellowColor),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: smallText(text: 'log to your account', color: greyColor),
            ),
            const Spacer(
              flex: 2,
            ),
            CustomTextFormFieldWidget(
              hintText: 'Enter your username',
              controller: usernameController,
            ),
            const Spacer(),
            CustomTextFormFieldWidget(
              hintText: 'Enter your password',
              suffixIcon: (Icons.visibility_outlined),
              controller: passwordController,
            ),
            TextButton(
              onPressed: () {},
              child: smallText(
                  decoration: TextDecoration.underline,
                  text: 'Forget your password',
                  color: yellowColor),
            ),
            const Spacer(
              flex: 3,
            ),
            CustomContainerWidget(onTap: () {}),
            const Spacer(
              flex: 3,
            ),
            Row(
              children: const [
                Expanded(
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                  child: Text(
                    'or',
                    style: TextStyle(color: greyColor),
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: Colors.grey,
                )),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child:
                    mediumText(text: 'Continue as a guest', color: yellowColor),
              ),
            ),
            const Spacer(
              flex: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                smallText(text: 'Dont have an account ?', color: greyColor),
                TextButton(
                  onPressed: () {
                    NavigatorWithName(context, id: const SignUpView().id);
                  },
                  child: smallText(text: 'Sign Up', color: yellowColor),
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
