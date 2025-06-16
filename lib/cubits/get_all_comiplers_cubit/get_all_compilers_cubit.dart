import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_over_flow_app/Services/compiler_Services/get_all_compiler_Service.dart';

import '../../Services/tag_serevices/tag_Services.dart';
import '../../models/compiler_model.dart';

part 'get_all_compilers_state.dart';

class GetAllCompilersCubit extends Cubit<GetAllCompilersState> {
  GetAllCompilersCubit() : super(GetAllCompilersInitial());

  static GetAllCompilersCubit get(context) => BlocProvider.of(context);

  Future<void> getAllCompilers() async {
    emit(GetAllCompilersLoadingState());
    var response = await getAllCompilersServices().getAllCompilers();
    response.fold((failure) {
      emit(GetAllCompilersFailureState(failure.errorMessage));
    }, (compilersName) {
      emit(GetAllCompilersSuccessfullyState(compilersName));
    });
  }
}
