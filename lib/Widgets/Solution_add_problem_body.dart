import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_over_flow_app/Widgets/CustomTagsListWidget.dart';

import '../cubits/get_all_comiplers_cubit/get_all_compilers_cubit.dart';
import '../cubits/get_all_tags_cubit/get_all_tags_cubit.dart';
import '../utils/AppTextStyle.dart';
import '../utils/color_constants.dart';
import 'CustomDropDownButton.dart';
import 'CustomTagItem.dart';
import 'CustomTextFormFieldWidget.dart';

class SolutionAddProblemBody extends StatefulWidget {
  final Function(String, String, List<int> tags)? onDataChanged;

  const SolutionAddProblemBody({required this.onDataChanged, super.key});

  @override
  State<SolutionAddProblemBody> createState() => _SolutionAddProblemBodyState();
}

class _SolutionAddProblemBodyState extends State<SolutionAddProblemBody> {
  final TextEditingController solutionController = TextEditingController();
  int selectedDifficultyIndex = 0;
  List<String> CompilersName = [];
  List<int> tags = [];

  @override
  void dispose() {
    solutionController.dispose();
    super.dispose();
  }

  void _saveData(List<String>? compilersName) {
    CompilersName = compilersName ?? [];
    widget.onDataChanged?.call(
      CompilersName.isNotEmpty ? CompilersName[selectedDifficultyIndex] : 'sdmos',
      solutionController.text,
      tags,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetAllCompilersCubit()..getAllCompilers(),
        ),
        BlocProvider(
          create: (context) => GetAllTagsCubit()..getAllTags(),
        ),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            // جزء Compiler Name
            BlocBuilder<GetAllCompilersCubit, GetAllCompilersState>(
              builder: (context, state) {
                var compilersCubit = GetAllCompilersCubit.get(context);
                return Row(
                  children: [
                    Text(
                      'Compiler Name',
                      style: AppTextStyles.bodyText1(context, yellowColor),
                    ),
                    const SizedBox(width: 20),
                    (state is GetAllCompilersSuccessfullyState)
                        ? Expanded(
                      child: CustomDropDownButton(
                        items: state.compilersName,
                        onChanged: (int index) {
                          setState(() {
                            selectedDifficultyIndex = index;
                          });
                          _saveData(state.compilersName);
                        },
                      ),
                    )
                        : const Expanded(
                        child: Center(child: CircularProgressIndicator())),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            // جزء Solution
            Text(
              'Solution',
              style: AppTextStyles.bodyText1(context, yellowColor),
            ),
            const SizedBox(height: 5),
            CustomTextFormFieldWidget(
              controller: solutionController,
              hintText: 'Solution Code',
              minLines: 4,
              onChanged: (_) => _saveData(null),
            ),
            const SizedBox(height: 20),
            // جزء Tags
            Text(
              'Tags',
              style: AppTextStyles.bodyText1(context, yellowColor),
            ),
            const SizedBox(height: 5),
            CustomTagsWidget()
          ],
        ),
      ),
    );
  }
}