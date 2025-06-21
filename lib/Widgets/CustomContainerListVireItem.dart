import 'package:flutter/material.dart';
import 'package:skills_over_flow_app/models/problem_model.dart';

import '../models/probems_model.dart';
import 'CustomContainerProblemWidget.dart';

class CustomProblemListViewItem extends StatelessWidget {
  const CustomProblemListViewItem({required this.problemList,super.key});
  final List<problemsModel> problemList;

  @override
  Widget build(BuildContext context) {
   return (problemList.length==0)?
       const Center(child: Text('There is no Problem Now'),):
     ListView.separated(
        padding: EdgeInsets.zero,

        itemBuilder: (context, index) =>Container(
            height: MediaQuery
                .of(context)
                .size
                .height * .25,
            child: CustomContainerProblemWigets(problemsmodel: problemList[index],)) ,
        separatorBuilder: (context, index) =>
        const SizedBox(height: 20,),
        itemCount:problemList.length
    );
  }
}
