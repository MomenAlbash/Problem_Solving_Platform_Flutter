import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_over_flow_app/Services/probem_Services/get_all_probems_services.dart';
import 'package:skills_over_flow_app/cubits/get_all_comiplers_cubit/get_all_compilers_cubit.dart';
import 'package:skills_over_flow_app/models/probems_model.dart';
import 'package:skills_over_flow_app/models/problem_model.dart';

part 'get_all_problems_state.dart';

class GetAllProblemsCubit extends Cubit<GetAllProblemsState> {
  GetAllProblemsCubit() : super(GetAllProblemsInitial());
  static GetAllProblemsCubit get(context)=>BlocProvider.of(context);
  int page= 1 ;

  Future<void> getAllProblems({String problemName='' ,required bool isIncrease, bool isFirstTime=false,int ? diff})async{
    if(isFirstTime){
      page=1;
    }else{
      if(isIncrease){
        page=++page;
      }else{
        if(page!=1){
          page=--page;
        }
      }
    }
    emit(GetAllProblemsLoadingState());
    var response=await getAllProblemsservice().getAllProblems(Page: page,limit:  2,difficulty:  diff,probelmName: problemName);
    response.fold((errorMessage) {
      log(errorMessage.errorMessage);
      emit(GetAllProblemsFailureState(errorMessage.errorMessage));
    }, (problemsList) {
      emit(GetAllProblemsSuccessfullyState(problemsList));
    })
;  }
}
