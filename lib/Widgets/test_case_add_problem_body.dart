import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_over_flow_app/cubits/add_test_case_for_problem/add_test_case_for_problem_cubit.dart';
import 'package:skills_over_flow_app/models/test_case_model.dart';

import '../utils/AppTextStyle.dart';
import '../utils/color_constants.dart';
import 'CustomTextFormFieldWidget.dart';
import 'Custom_Test_Case_Widget.dart';

class testCaseAddProblemBody extends StatefulWidget {
  final Function(List<testCaseModel> testCases)? onDataChanged;
  const testCaseAddProblemBody({required this.onDataChanged,super.key});

  @override
  State<testCaseAddProblemBody> createState() => _testCaseAddProblemBodyState();
}

class _testCaseAddProblemBodyState extends State<testCaseAddProblemBody> {
  final TextEditingController _testCaseController = TextEditingController();
  bool isSelectedtestCase = true;
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => AddTestCaseForProblemCubit(),
        child: BlocBuilder<AddTestCaseForProblemCubit, AddTestCaseForProblemState>(
          builder: (context, state) {
            var cubit=AddTestCaseForProblemCubit.get(context);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter how many test case you need:',
                  style: AppTextStyles.bodyText1(context, yellowColor),),
                const SizedBox(height: 5,),
                CustomTextFormFieldWidget(controller: _testCaseController,
                  hintText: 'Type here...',
                  textInputType: TextInputType.number,
                  onChanged: (value){
                    int? length = int.tryParse(value!);
                    if (length != null) {
                      cubit.AddLengthOfTestCase(length);
                    }
                  },
                  minLines: 1,),
                const SizedBox(height: 30,),
                Text('Test Cases',
                  style: AppTextStyles.bodyText1(context, yellowColor),),
                const SizedBox(height: 10,),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) =>const SizedBox(height: 30,),
                  itemCount: cubit.lengthOfTestCaseList,
                  itemBuilder: (context, index) {
                    return  CustomTestCaseWidget(index: index,);
                  },),

              ],
            );
          },
        ),
      ),
    );
  }
}
