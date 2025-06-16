import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skills_over_flow_app/Components/Components.dart';
import 'package:skills_over_flow_app/Widgets/CustomContainerWidget.dart';
import 'package:skills_over_flow_app/Widgets/CustomTextFormFieldWidget.dart';
import 'package:skills_over_flow_app/utils/AppDimensions.dart';
import 'package:skills_over_flow_app/utils/AppSpacing.dart';
import 'package:skills_over_flow_app/utils/AppValdiation.dart';
import 'package:skills_over_flow_app/utils/color_constants.dart';
import 'package:skills_over_flow_app/utils/AppTextStyle.dart';
import 'package:skills_over_flow_app/cubits/user_Register_cubit/user_Register_cubit.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  final String id = 'SignUpView';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var formKey = GlobalKey<FormState>();
   AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  final ImagePicker picker = ImagePicker();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConFirmController = TextEditingController();
  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    passwordConFirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    return BlocProvider(
      create: (context) => userRegisterCubit(),
      child: BlocConsumer<userRegisterCubit, userRegisterState>(
        listener: (context, state) {
          if (state is UserLoginSuccessState) {
            ShowToast(message: state.message, state: toastState.success);
          }
          if (state is UserLoginFailureState) {
            ShowToast(message: state.errorMessage, state: toastState.error);
          }
        },
        builder: (context, state) {
          var cubit=userRegisterCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.horizontalPadding,
                  vertical: AppDimensions.verticalPadding
                ),
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    children: [
                      Text('Welcome to',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyText1(context,yellowColor),),
                      SizedBox(height: screenHeight * AppSpacing.small,),
                      Text('SkillsOverFlow',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.headline1WithYellow(context).copyWith(fontSize: 35),),
                       SizedBox(height: screenHeight * AppSpacing.small,),
                      Text('Register for a new account',
                        style: AppTextStyles.bodyText1(context, greyColor),),
                       SizedBox(height: screenHeight *AppSpacing.medium,),
                      (state is ! ImageChangeLoadingState)?Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(

                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(69),
                              image: DecorationImage(
                                image:cubit.imageFile==null ? AssetImage('assets/images/63cc53c23c4c5a9d08843b6e1548bd1b.jpg') : Image.file(File(cubit.imageFile!.path)).image ,
                                fit: BoxFit.cover,

                              ),
                            ),
                            height: 128,
                            width: 138,
                          ),
                          cubit.imageFile !=null ? Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFC4CCDE),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: (){
                                    cubit.deleteImage();
                                  }, icon: Icon(Icons.delete,color: Colors.white,))): Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFC4CCDE),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: IconButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: ()async{
                                    await cubit.ChangeImage();
                                  }, icon: Icon(Icons.add,color: Colors.white,))),
                        ],
                      )  : Center(child: CircularProgressIndicator(),),
                      SizedBox(height: screenHeight *AppSpacing.medium,),
                      CustomTextFormFieldWidget(controller: usernameController,
                        hintText: 'Username*',
                        validator:(value){
                        AppValidation.passwordValidation(value);
                        }
                        ),
                      CustomTextFormFieldWidget(controller: passwordController,
                          hintText: 'Password*',
                        suffixIcon:cubit.isVisiblePassword ? Icons.visibility:Icons.visibility_outlined,
                        obscureText: (cubit.isVisiblePassword)?false:true ,
                        onPressedICon: (){
                        cubit.changeVisiblePassword();
                        },
                        validator: (value) {
                          if(value!.isEmpty||value==null){
                            return 'field is required';
                          }else{
                            return  null;
                          }
                        } ,
                      ),
                      CustomTextFormFieldWidget(
                        controller: passwordConFirmController,

                        obscureText: (cubit.isVisibleConfirmPassword)?false:true ,
                        onPressedICon: (){
                          cubit.changeVisibleConfirmPassword();
                        },
                          hintText: 'Password Confirm',
                        suffixIcon:cubit.isVisibleConfirmPassword ? Icons.visibility:Icons.visibility_outlined,
                            validator: (value) {
                          if(value!.isEmpty||value==null ){
                            return 'field is required';
                          }else if(value !=passwordController.text){
                            return  'should be same password';
                          }else{
                            return null;
                          }
                        } ,
                      ),
                      SizedBox(height: screenHeight * AppSpacing.medium,),
                      if (state is UserLoginLoadingState)
                        Center(child: CircularProgressIndicator()),
                      if (state is UserLoginFailureState ||
                          state is! UserLoginLoadingState)
                        CustomContainerWidget(
                          text: 'Sign Up',
                            onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            cubit.userRegister(
                                userName: usernameController.text,
                                password: passwordController.text);
                          }else{
                            autovalidateMode=AutovalidateMode.always;
                          }
                          setState(() {
                          });
                        }),
                        SizedBox(height: screenHeight * AppSpacing.medium,),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont have an account?',
                            style: AppTextStyles.bodyText1(context, greyColor),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Log in',
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
