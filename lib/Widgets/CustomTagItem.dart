import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skills_over_flow_app/cubits/choose_tag_cubit/choose_tag_cubit.dart';
import 'package:skills_over_flow_app/models/tag_model..dart';

import '../utils/AppTextStyle.dart';
import '../utils/color_constants.dart';

class CustomTagItem extends StatelessWidget {
  const CustomTagItem({required this.tagmodel,super.key});
  final tagModel tagmodel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChooseTagCubit(),
      child: BlocBuilder<ChooseTagCubit, ChooseTagState>(
        builder: (context, state) {
          var cubit=ChooseTagCubit.get(context);
          return Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: cubit.activeTag?blueColor:fieldColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(onPressed: () {
                cubit.ChooseTage(tagmodel.tagID);
              },
                  child: Text(tagmodel.tagName,
                    style:cubit.activeTag? AppTextStyles.bodyText1(context,Colors.black).copyWith(
                        fontSize: 12): AppTextStyles.bodyText1(context, greyColor).copyWith(
                        fontSize: 12))));
        },
      ),
    );
  }
}
