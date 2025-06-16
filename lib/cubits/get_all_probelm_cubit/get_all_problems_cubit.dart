import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_problems_state.dart';

class GetAllProblemsCubit extends Cubit<GetAllProblemsState> {
  GetAllProblemsCubit() : super(GetAllProblemsInitial());
  static GetAllProblemsCubit get(context)=>BlocProvider.of(context);

  Future<void> getAllProblems()async{
    emit(GetAllProblemsLoadingState());
  }
}
