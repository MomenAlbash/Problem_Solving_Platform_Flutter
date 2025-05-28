import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/Widgets/CustomTextFormFieldWidget.dart';
import 'package:skills_over_flow_app/constants/AppTextStyle.dart';
import 'package:skills_over_flow_app/constants/color_constants.dart';

import '../Widgets/CustomAppBar.dart';
import '../Widgets/CustomContainerUserInfo.dart';

class
userView extends StatefulWidget {
  const userView({super.key});
  final String id ='usersView';


  @override
  State<userView> createState() => _userViewState();
}

class _userViewState extends State<userView> {
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50),
        child: Column(
          children:  [
            const CustomAppBarUsersView(),
            const SizedBox(height: 40,),
            CustomTextFormFieldWidget(
                 controller: controller,
                hintText: 'Search With User_name',
              suffixIcon: Icons.search_sharp,
            ),
            const SizedBox(height: 40,),
            Expanded(child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>const Padding(
              padding:  EdgeInsets.only(bottom: 20.0),
              child: CustomContainerUserInfo(),
            ),)),
          ],
        ),
      ),
    );
  }
}

