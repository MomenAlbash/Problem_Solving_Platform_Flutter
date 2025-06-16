import 'package:skills_over_flow_app/models/test_case_model.dart';

class problemModel{
   String compilerName ;
   String problemName;
   String generalDescription;
   String inputDescription;
   String outputDescription;
   String solutionCode;
   String? note;
   String tutorial;
   int difficulty;
   int timeLimitMilliseconds;
   List<testCaseModel> testCase;
   List<int> tags;

  problemModel({required this.solutionCode,required this.compilerName,required this.problemName,
  required this.generalDescription,required this.inputDescription,required this.outputDescription,
  this.note,required this.tags,required this.difficulty,required this.testCase,required this.timeLimitMilliseconds,required this.tutorial});
}