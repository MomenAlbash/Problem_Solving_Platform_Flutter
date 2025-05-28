import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/Widgets/CustomContainerWidget.dart';
import 'package:skills_over_flow_app/Widgets/CustomTextFormFieldWidget.dart';
import 'package:skills_over_flow_app/constants/AppDimensions.dart';
import 'package:skills_over_flow_app/constants/AppTextStyle.dart';
import 'package:skills_over_flow_app/constants/AppValdiation.dart';
import 'package:skills_over_flow_app/constants/color_constants.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  final String id = 'ChangePasswordView';

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;

  final TextEditingController currentlyPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController =
      TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  var formKey = GlobalKey<FormState>();
  void dispose() {
    newPasswordController.dispose();
    currentlyPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.verticalPadding,horizontal: AppDimensions.horizontalPadding),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              Text(
                'add a new password',
                style: AppTextStyles.headline1WithYellow(context),
              ),
              Text(
                'Type a new strong password',
                style: AppTextStyles.bodyText1(context, greyColor),
              ),
              const SizedBox(height: 50,),
              CustomTextFormFieldWidget(
                  controller: currentlyPasswordController,
                  hintText: 'Currently Password',
                suffixIcon: Icons.remove_red_eye_outlined,
                validator: (value){
                  AppValidation.passwordValidation(value);
                },
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Opacity(
                      opacity: .8,
                      child: Text(
                        'Forget Your password?',
                        style: AppTextStyles.bodyText1(context, yellowColor).copyWith(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextFormFieldWidget(
                  controller: newPasswordController,
                  hintText: 'New Password',
                suffixIcon: Icons.remove_red_eye_outlined,
                validator: AppValidation.passwordValidation, 
              ),
              const SizedBox(height: 10,),
              CustomTextFormFieldWidget(
                  controller: confirmNewPasswordController,
                  hintText: 'Confirm New Password',
                suffixIcon: Icons.remove_red_eye_outlined,
                validator: AppValidation.passwordValidation
              ),
              const SizedBox(height: 50,),
              CustomContainerWidget(onTap: (){
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                }else{
                  autovalidateMode=AutovalidateMode.always;
                }
                setState(() {

                });
              },text: 'Save',),
            ],
          ),
        ),
      ),
    );
  }
}
