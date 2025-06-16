import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_over_flow_app/Widgets/CustomContainerWidget.dart';
import 'package:skills_over_flow_app/Widgets/CustomTextFormFieldWidget.dart';
import 'package:skills_over_flow_app/utils/AppDimensions.dart';
import 'package:skills_over_flow_app/utils/AppSpacing.dart';
import 'package:skills_over_flow_app/cubits/user_login_cubit/user_login_cubit.dart';
import 'package:skills_over_flow_app/utils/AppValdiation.dart';
import 'package:skills_over_flow_app/views/SignUpView.dart';
import 'package:skills_over_flow_app/views/homeView.dart';

import '../Components/Components.dart';
import '../utils//color_constants.dart';
import '../utils//AppTextStyle.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  final String id = 'loginview';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    return BlocProvider(
      create: (context) => UserLoginCubit(),
      child: BlocConsumer<UserLoginCubit, UserLoginState>(
        listener: (context, state) {
          if(state is UserLoginSuccessState){
            ShowToast(message: state.message, state: toastState.success);
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView(),));

          }
          if(state is UserLoginFailureState){
            ShowToast(message: state.errorMessage, state: toastState.error);
          }
        },
        builder: (context, state) {
          var cubit =UserLoginCubit.get(context);

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.horizontalPadding,
                vertical: AppDimensions.verticalPadding
              ),
              child: Form(
                autovalidateMode: autovalidateMode,
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyText1(context,yellowColor),
                      ),
                      SizedBox(height: screenHeight * AppSpacing.small,),
                      Text(
                        'SkillsOverFlow',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headline1WithYellow(context).copyWith(fontSize: 35),
                      ),
                      SizedBox(height: screenHeight *AppSpacing.small,),
                      Text(
                        'Log to your account',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyText1(context, greyColor),
                      ),
                      SizedBox(height: screenHeight *AppSpacing.large,),
                      CustomTextFormFieldWidget(
                        hintText: 'Enter your username',
                        controller: usernameController,
                        validator: AppValidation.passwordValidation,
                      ),
                      const SizedBox(height: 10,),
                      CustomTextFormFieldWidget(
                        hintText: 'Enter your password',
                        suffixIcon:cubit.isVisible ?Icons.visibility: (Icons.visibility_outlined),
                        onPressedICon: (){
                          cubit.changeVisiblePassword();
                        },
                        controller: passwordController,
                        obscureText:cubit.isVisible ?false:true ,
                        validator: AppValidation.passwordValidation,
                      ),
                      SizedBox(height: screenHeight *AppSpacing.large,),
                      if (state is UserLoginLoadingState)
                        Center(child: CircularProgressIndicator()),
                      if (state is! UserLoginLoadingState)
                        CustomContainerWidget(
                            text: 'Log in',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                cubit.userLogin(userName: usernameController.text, password: passwordController.text);

                              } else {
                                autovalidateMode = AutovalidateMode.always;
                              }
                              setState(() {

                              });
                            }),
                      SizedBox(height: screenHeight*AppSpacing.medium,),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                            child: Text(
                              'or',
                              style: AppTextStyles.bodyText1(context, greyColor),
                            ),
                          ),
                          const Expanded(
                              child: Divider(
                                color: Colors.grey,
                              )),
                        ],
                      ),
                      SizedBox(height:screenHeight*AppSpacing.large,),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Continue as a guest',
                          style: AppTextStyles.headline1WithYellow(context),
                        ),
                      ),
                      SizedBox(height: screenHeight*AppSpacing.medium,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont have an account?',
                            style: AppTextStyles.bodyText1(context, greyColor),
                          ),
                          TextButton(
                            onPressed: () {
                              NavigatorWithName(
                                  context, id: const SignUpView().id);
                            },
                            child: Text(
                              'Sign Up',
                              style: AppTextStyles.bodyText1(
                                  context, yellowColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
