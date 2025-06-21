import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_over_flow_app/Services/tag_serevices/tag_Services.dart';

import '../../models/tag_model..dart';

part 'get_all_tags_state.dart';

class GetAllTagsCubit extends Cubit<GetAllTagsState> {
  GetAllTagsCubit() : super(GetAllTagsInitial());
  static GetAllTagsCubit get(context)=>BlocProvider.of(context);
  Future<void> getAllTags() async {
      emit(GetAllTagsLoadingState());
      var response = await TagServices().getAllTags();
      response.fold((failure) {
        emit(GetAllTagsFailureState(failure.errorMessage));
      }, (tags) {
        emit(GetAllTagsSuccessState(tags));
      });

  }


}
