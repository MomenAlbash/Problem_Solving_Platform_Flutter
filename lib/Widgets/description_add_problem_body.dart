import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/utils/AppValdiation.dart';

import '../utils/AppTextStyle.dart';
import '../utils/color_constants.dart';
import 'CustomDropDownButton.dart';
import 'CustomTextFormFieldWidget.dart';

class DescriptionAddProblem extends StatefulWidget {
  final Function(int, String, String,String,String,String?)? onDataChanged;
  const DescriptionAddProblem({required this.onDataChanged,super.key});

  @override
  State<DescriptionAddProblem> createState() => _DescriptionAddProblemState();
}

class _DescriptionAddProblemState extends State<DescriptionAddProblem> {
  TextEditingController problemNameController = TextEditingController();
  TextEditingController generalDescriptionController = TextEditingController();
  TextEditingController inputDescriptionController = TextEditingController();
  TextEditingController outputDescriptionController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  List<String> items = ["Easy", "Medium", "Hard"];
  int selectedDifficultyIndex=0;
  void dispose() {
    problemNameController.dispose();
    generalDescriptionController.dispose();
    inputDescriptionController.dispose();
    outputDescriptionController.dispose();
    noteController.dispose();
    super.dispose();
  }
  void _saveData() {
    widget.onDataChanged?.call(
      selectedDifficultyIndex,
      problemNameController.text,
      generalDescriptionController.text,
      inputDescriptionController.text,
      outputDescriptionController.text,
      noteController.text
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Difficulty',
                style: AppTextStyles.bodyText1(context, yellowColor),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: CustomDropDownButton(
                    items: items,
                    onChanged: (int index) {
                      setState(() {
                        selectedDifficultyIndex =
                            index; // حفظ الـ index عند التغيير
                      });
                      _saveData();
                    }),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text(
                'Problem name',
                style: AppTextStyles.bodyText1(context, yellowColor),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: CustomTextFormFieldWidget(
                controller: problemNameController,
                validator: (value) {
                  AppValidation.passwordValidation(value);
                },
                    onChanged:(_)=>_saveData(),
                hintText: 'Problem Name',
                minLines: 1,
              )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'General Description',
            style: AppTextStyles.bodyText1(context, yellowColor),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFormFieldWidget(
            minLines: 6,
            controller: generalDescriptionController,
            hintText: 'General Description',
            onChanged:(_)=>_saveData(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Input Description',
            style: AppTextStyles.bodyText1(context, yellowColor),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFormFieldWidget(
              minLines: 3,
              controller: inputDescriptionController,
              onChanged:(_)=>_saveData(),
              hintText: 'input Description'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Output Description',
            style: AppTextStyles.bodyText1(context, yellowColor),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFormFieldWidget(
              minLines: 3,
              controller: outputDescriptionController,
              onChanged:(_)=>_saveData(),
              hintText: 'Output Description'),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Note',
            style: AppTextStyles.bodyText1(context, yellowColor),
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFormFieldWidget(
              minLines: 3,
              onChanged:(_)=>_saveData(),
              controller: noteController,
              hintText: 'Note'),
        ],
      ),
    );
  }
}
