import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_over_flow_app/Widgets/CustomAppBar.dart';
import 'package:skills_over_flow_app/Widgets/CustomContainerWidget.dart';
import 'package:skills_over_flow_app/Widgets/CustomDropDownButton.dart';
import 'package:skills_over_flow_app/Widgets/CustomTagItem.dart';
import 'package:skills_over_flow_app/Widgets/CustomTagsListWidget.dart';
import 'package:skills_over_flow_app/Widgets/CustomTextFormFieldWidget.dart';
import 'package:skills_over_flow_app/Widgets/Custom_Test_Case_Widget.dart';
import 'package:skills_over_flow_app/cubits/change_widget_in_add_problem_view/change_widget_in_add_problem_view_cubit.dart';
import 'package:skills_over_flow_app/utils/AppTextStyle.dart';
import 'package:skills_over_flow_app/views/test_case_body.dart';

import '../utils/color_constants.dart';

class AddProblemView extends StatefulWidget {
  const AddProblemView({super.key});

  @override
  State<AddProblemView> createState() => _AddProblemViewState();
}

class _AddProblemViewState extends State<AddProblemView> {
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
     int indexx=0;

    return BlocProvider(
  create: (context) => ChangeWidgetInAddProblemViewCubit(),
  child: BlocBuilder<ChangeWidgetInAddProblemViewCubit, ChangeWidgetInAddProblemViewState>(
  builder: (context, state) {
    var cubit =ChangeWidgetInAddProblemViewCubit.get(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: SafeArea(
          child: Form(
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBarUsersView(),
                const SizedBox(height: 30,),
                Expanded(
              child:cubit.addProbelmWidget[cubit.index],
            ),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    (cubit.index==0)?SizedBox():  GestureDetector(
                      onTap: (){
                        cubit.ChangeView(isNext: false);
                      },
                      child: Container(
                        padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        decoration: BoxDecoration(
                            color: fieldColor,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        height: 50,
                        width: 102,
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back_ios_new_outlined,size: 15,color: Colors.white,),
                            const SizedBox(width: 5,),

                            Text('Prev',style: AppTextStyles.bodyText1(context, yellowColor),),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                          cubit.ChangeView(isNext: true);
                          if(cubit.index==3){
                            cubit.AddProblem();
                          }
                      },
                      child: Container(
                        padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                        decoration: BoxDecoration(
                            color: yellowColor,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        height: 50,
                        width: 102,
                        child: Row(
                          children: [
                            (cubit.index==3)?
                            Text('Sent',style: AppTextStyles.bodyText1(context, Colors.black),):Text('Next',style: AppTextStyles.bodyText1(context, Colors.black),),
                            const SizedBox(width: 5,),
                            Icon(Icons.navigate_next,size: 20,color: Colors.black,),

                          ],
                        ),
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
