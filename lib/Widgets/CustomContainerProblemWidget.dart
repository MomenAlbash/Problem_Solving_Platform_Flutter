import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/Widgets/CustomContainerDiffecultyProblemWidget.dart';
import 'package:skills_over_flow_app/Widgets/CustomContainerTagProblemWidget.dart';
import 'package:skills_over_flow_app/Widgets/DashedLineWidget.dart';
import 'package:skills_over_flow_app/models/probems_model.dart';
import 'package:skills_over_flow_app/utils/AppTextStyle.dart';
import 'package:skills_over_flow_app/utils/color_constants.dart';

class CustomContainerProblemWigets extends StatelessWidget {
  const CustomContainerProblemWigets({required this.problemsmodel, super.key});
  final problemsModel problemsmodel;
  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery
          .of(context)
          .size
          .width,
      decoration: BoxDecoration(
        color: fieldColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(problemsmodel.title,
            style: AppTextStyles.bodyText1(context, yellowColor),),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(text: TextSpan(
                  children: [
                    TextSpan(text: 'Created By:',
                        style: AppTextStyles.bodyText1(context, greyColor)
                            .copyWith(fontSize: 12)),
                    TextSpan(text: ' User',
                        style: AppTextStyles.bodyText1(context, blueColor)
                            .copyWith(fontSize: 12)),
                  ]
              )),
              RichText(text: TextSpan(
                  children: [
                    TextSpan(text: '${problemsmodel.solutionsCount.toString()}',
                        style: AppTextStyles.bodyText1(context, yellowColor)
                            .copyWith(fontSize: 12)),
                    TextSpan(text: ' Solved',
                        style: AppTextStyles.bodyText1(context, greyColor)
                            .copyWith(fontSize: 12)),
                  ]
              )),
               CustomContainerDiffecultyProblemWidget(
                color: Colors.green, text: problemsmodel.diffculty,)
            ],
          ),
          const SizedBox(height: 15,),
          DashedLine(),
          const SizedBox(height: 15,),
           Text(problemsmodel.generalDescription,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:AppTextStyles.bodyText1(context, greyColor).copyWith(fontSize: 12)),
           const SizedBox(height: 20,),
           Wrap(
             spacing: 10.0,
        runSpacing: 10.0,
        children: List.generate(problemsmodel.tags.length, (index) => CustomContainerTagProblemWidget(tagmodel: problemsmodel.tags[index],)),
      ),
        ],
      ),
    );
  }
}
