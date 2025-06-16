import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/utils/AppTextStyle.dart';

import '../utils/color_constants.dart';
import 'CustomTextFormFieldWidget.dart';

class TutorialAddProblemBody extends StatefulWidget {
  final Function(String)? onDataChanged;
  const TutorialAddProblemBody({required this.onDataChanged,super.key});
  @override
  State<TutorialAddProblemBody> createState() => _TutorialAddProblemBodyState();
}

class _TutorialAddProblemBodyState extends State<TutorialAddProblemBody> {
  final TextEditingController _tutorialController = TextEditingController();
  void dispose() {
    _tutorialController.dispose();
    super.dispose();
  }

  void _saveData(){
    widget.onDataChanged?.call(
        _tutorialController.text
    );
  }
  @override
  Widget build(BuildContext context) {


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Tutorial',
          style: AppTextStyles.bodyText1(context, yellowColor),),
        const SizedBox(height: 5,),
        Expanded(
          child: CustomTextFormFieldWidget(
            controller: _tutorialController,
            onChanged: (index){
              _saveData();
            },
            hintText: 'Type here',),
        ),
      ],
    );
  }
}
