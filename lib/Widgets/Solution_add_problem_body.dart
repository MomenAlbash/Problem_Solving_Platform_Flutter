import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_over_flow_app/Services/compiler_Services/get_all_compiler_Service.dart';
import 'package:skills_over_flow_app/Widgets/CustomTextFormFieldWidget.dart';
import 'package:skills_over_flow_app/cubits/choose_tag_cubit/choose_tag_cubit.dart';
import 'package:skills_over_flow_app/cubits/get_all_comiplers_cubit/get_all_compilers_cubit.dart';
import 'package:skills_over_flow_app/utils/AppTextStyle.dart';

import '../models/compiler_model.dart';
import '../utils/color_constants.dart';
import 'CustomDropDownButton.dart';
import 'CustomTagsListWidget.dart';

class SolutionAddProblemBody extends StatefulWidget {
  final Function(String, String, List<int> tags)? onDataChanged;

  const SolutionAddProblemBody({required this.onDataChanged, super.key});

  @override
  State<SolutionAddProblemBody> createState() => _SolutionAddProblemBodyState();
}

class _SolutionAddProblemBodyState extends State<SolutionAddProblemBody> {
  final TextEditingController solutionController = TextEditingController();
  int selectedDifficultyIndex=0;
  List<String> CompilersName = [];
  List<int> tags = [];
  void dispose() {
    solutionController.dispose();
    super.dispose();
  }

  void _saveData(List<String>? compilersName) {
    CompilersName=compilersName!;
    if(compilersName!=null){
      widget.onDataChanged?.call(
          CompilersName![selectedDifficultyIndex],
          solutionController.text,
          tags);
    }else{
      widget.onDataChanged?.call(
          'sdmos',
          solutionController.text,
          tags);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => GetAllCompilersCubit()..getAllCompilers(),
        child: BlocBuilder<GetAllCompilersCubit, GetAllCompilersState>(
          builder: (context, state) {
            var cubit = GetAllCompilersCubit.get(context);
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Compiler Name',
                      style: AppTextStyles.bodyText1(context, yellowColor),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    (state is GetAllCompilersSuccessfullyState)
                        ? Expanded(
                            child: CustomDropDownButton(
                            items: state.compilersName,
                            onChanged: (int index) {
                              setState(() {
                                selectedDifficultyIndex =
                                    index; // حفظ الـ index عند التغيير
                              });
                              _saveData(state.compilersName);
                            },
                          ))
                        : Expanded(
                            child: Center(child: CircularProgressIndicator())),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Solution',
                  style: AppTextStyles.bodyText1(context, yellowColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextFormFieldWidget(
                  controller: solutionController,
                  hintText: 'Solution Code',
                  minLines: 4,
                  onChanged:(_)=>_saveData(null),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Tags',
                  style: AppTextStyles.bodyText1(context, yellowColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                const CustomTagsWidget(),
              ],
            );
          },
        ),
      ),
    );
  }

}
