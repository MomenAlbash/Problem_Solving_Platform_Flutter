import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_over_flow_app/Components/Components.dart';
import 'package:skills_over_flow_app/Widgets/CustomAppBar.dart';
import 'package:skills_over_flow_app/Widgets/CustomContainerWidget.dart';
import 'package:skills_over_flow_app/Widgets/CustomTextFormFieldWidget.dart';
import 'package:skills_over_flow_app/cubits/change_password_cubit/change_password_cubit.dart';


import '../utils/AppDimensions.dart';
import '../utils/AppTextStyle.dart';
import '../utils/AppValdiation.dart';
import '../utils/color_constants.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});


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
    return BlocProvider(
  create: (context) => ChangePasswordCubit(),
  child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
  listener: (context, state) {
    if(state is ChangePasswordSuccessfulState){
      ShowToast(message: state.message, state: toastState.success);
    }else if(state is ChangePasswordFailureState){
      ShowToast(message: state.errorMessage, state: toastState.error);
    }
  },
  builder: (context, state) {
    var cubit=ChangePasswordCubit.get(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimensions.verticalPadding,horizontal: AppDimensions.horizontalPadding),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBarUsersView(),
                SizedBox(height: 40,),
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
                  minLines: 1,
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
                  minLines: 1,
                  suffixIcon: Icons.remove_red_eye_outlined,
                  validator: AppValidation.passwordValidation,
                ),
                const SizedBox(height: 10,),
                CustomTextFormFieldWidget(
                  minLines: 1,
                    controller: confirmNewPasswordController,
                    hintText: 'Confirm New Password',
                  suffixIcon: Icons.remove_red_eye_outlined,
                  validator: AppValidation.passwordValidation
                ),
                const SizedBox(height: 50,),
                (state is ChangePasswordLoadingState)?Center(
                  child: CircularProgressIndicator(),
                ):CustomContainerWidget(onTap: (){
                  if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  cubit.ChangePassword(oldPassword: currentlyPasswordController.text, newPassword: newPasswordController.text);
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
      ),
    );
  },
),
);
  }
}
