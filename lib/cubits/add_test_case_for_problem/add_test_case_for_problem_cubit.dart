import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_over_flow_app/models/test_case_model.dart';

part 'add_test_case_for_problem_state.dart';

class AddTestCaseForProblemCubit extends Cubit<AddTestCaseForProblemState> {
  AddTestCaseForProblemCubit() : super(AddTestCaseForProblemInitial());

  static AddTestCaseForProblemCubit get(context)=>BlocProvider.of(context);
   int lengthOfTestCaseList=0;

   static List<testCaseModel> testCases=[];
   AddOrUpdateTestCase({
    required int index,
    required String input,
    bool isPublic = false,
     bool isSample=false
  }){
     if(index>=testCases.length){
       testCases.add(
         testCaseModel(index: index, input: input, isPublic: isPublic, isSample: isSample)
       );
     }else{
       testCases[index].input=input;
       testCases[index].isSample=isSample;
       testCases[index].isPublic=isPublic;

     }

   }

  AddLengthOfTestCase(int length){
    lengthOfTestCaseList=length;
    log('admam,d');
    emit(AddTestCaseState());
  }
}
