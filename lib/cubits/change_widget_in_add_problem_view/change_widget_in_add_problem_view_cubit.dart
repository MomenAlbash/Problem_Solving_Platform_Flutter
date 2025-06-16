import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_over_flow_app/Services/probem_Services/add_problem_service.dart';
import 'package:skills_over_flow_app/Widgets/Solution_add_problem_body.dart';
import 'package:skills_over_flow_app/Widgets/description_add_problem_body.dart';
import 'package:skills_over_flow_app/Widgets/test_case_add_problem_body.dart';
import 'package:skills_over_flow_app/Widgets/tutorial_add_problem_body.dart';
import 'package:skills_over_flow_app/cubits/add_test_case_for_problem/add_test_case_for_problem_cubit.dart';
import 'package:skills_over_flow_app/cubits/choose_tag_cubit/choose_tag_cubit.dart';
import 'package:skills_over_flow_app/models/problem_model.dart';
import 'package:skills_over_flow_app/views/addProblemView.dart';
import 'package:skills_over_flow_app/views/test_case_body.dart';

import '../../models/test_case_model.dart';

part 'change_widget_in_add_problem_view_state.dart';

class ChangeWidgetInAddProblemViewCubit extends Cubit<ChangeWidgetInAddProblemViewState> {
  ChangeWidgetInAddProblemViewCubit() : super(ChangeWidgetInAddProblemViewInitial());

  static ChangeWidgetInAddProblemViewCubit get(context) => BlocProvider.of(context);
   problemModel _problemData = problemModel(
    problemName: '',
    generalDescription: '',
    inputDescription: '',
    outputDescription: '',
    difficulty: 0, // Default value
    solutionCode: '',
    tutorial: '',
    compilerName: 'chang1810',
    note: '',
    tags: ChooseTagCubit.tags,
    testCase: AddTestCaseForProblemCubit.testCases,
    timeLimitMilliseconds: 0,
  );
  List<Widget> get addProbelmWidget=>[
    DescriptionAddProblem(onDataChanged: _saveDescription),
    SolutionAddProblemBody(onDataChanged: _saveSolution,),
    TutorialAddProblemBody(onDataChanged: _saveTutorial),
    testCaseAddProblemBody(onDataChanged: _saveTestCases,)
  ];
  void _saveDescription( int difficulty,
  String problemName,String generalDescription
  ,String inputDescription, String outputDescription,String? note ) {
    _problemData.problemName = problemName;
    _problemData.generalDescription = generalDescription;
    _problemData.difficulty = difficulty;
    _problemData.inputDescription=inputDescription;
    _problemData.outputDescription=outputDescription;
    _problemData.note=note;
  }

  void _saveSolution(String compilerName , String solutionCode,List<int> tags){
    _problemData.compilerName=compilerName;
    _problemData.solutionCode=solutionCode;
    _problemData.tags=tags;
  }
  void _saveTutorial(String tutorial){
    _problemData.tutorial=tutorial;
  }
  void _saveTestCases(List<testCaseModel> testCases){
    _problemData.testCase=testCases;
  }
  Future<void> AddProblem()async{
    log(_problemData.difficulty.toString());
    log(_problemData.problemName);
    log(_problemData.generalDescription);
    log(_problemData.inputDescription);
    log(_problemData.outputDescription);
    log(_problemData.compilerName);
    log(_problemData.solutionCode);
    log(_problemData.tutorial);
    log(_problemData.tags.toString());
    log(_problemData.testCase.toString());


  }
  int index=0;
  ChangeView({bool isNext=true}){
    if(isNext){
      if(index<3)
      index++;
    }else{
      if(index>0){
        index--;
      }
    }
    emit(ChangeWidgetState());
  }
}
