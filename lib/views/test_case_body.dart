import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_over_flow_app/Widgets/CustomTextFormFieldWidget.dart';
import 'package:skills_over_flow_app/cubits/add_test_case_for_problem/add_test_case_for_problem_cubit.dart';
import 'package:skills_over_flow_app/models/test_case_model.dart';

import '../utils/AppTextStyle.dart';
import '../utils/color_constants.dart';

class CustomTestCaseBody extends StatefulWidget {
  const CustomTestCaseBody({required this.index,super.key});
  final int index;
  @override
  State<CustomTestCaseBody> createState() => _CustomTestCaseBodyState();
}

class _CustomTestCaseBodyState extends State<CustomTestCaseBody> {

  final TextEditingController _testCaseInputController =
      TextEditingController();
  void dispose() {
    _testCaseInputController.dispose();
    super.dispose();
  }

  void _saveData() {
    AddTestCaseForProblemCubit.get(context).AddOrUpdateTestCase(index:widget.index , input: _testCaseInputController.text,
    isPublic: isPublicStatus,isSample: isSampleStatus);
  }

  bool isSampleStatus = false;
  bool isPublicStatus = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'input:',
          style: AppTextStyles.bodyText1(context, blueColor)
              .copyWith(fontSize: 12),
        ),
        const SizedBox(
          height: 5,
        ),
        CustomTextFormFieldWidget(
            controller: _testCaseInputController,
            minLines: 1,
            hintText: 'Type here...',
          onChanged: (_)=>_saveData(),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Text(
              'Is Public ?',
              style: AppTextStyles.bodyText1(context, Colors.white),
            ),
            const SizedBox(
              width: 40,
            ),
            Transform.scale(
              scale: 2,
              child: Switch(
                inactiveTrackColor: greyColor,
                hoverColor: blueColor,
                activeColor: blueColor,
                value: isPublicStatus,
                onChanged: (value) {
                  isPublicStatus = value;

                  setState(() {});
                  _saveData();

                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Text(
              'Is Sample ?',
              style: AppTextStyles.bodyText1(context, Colors.white),
            ),
            const SizedBox(
              width: 30,
            ),
            Transform.scale(
              scale: 2,
              child: Switch(
                inactiveTrackColor: greyColor,
                activeColor: blueColor,
                value: isSampleStatus,

                onChanged: (value) {
                  isSampleStatus = value;
                  setState(() {});
                  _saveData();

                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
