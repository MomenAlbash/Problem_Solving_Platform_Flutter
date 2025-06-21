import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_over_flow_app/Services/get_all_users_service.dart';
import 'package:skills_over_flow_app/models/user_model.dart';

part 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit() : super(GetUsersInitial());

  static GetUsersCubit get(context) => BlocProvider.of(context);
  int page= 1 ;
    Future<void> getAllUsers({ String userName='',required bool isIncrease, bool isFirstTime=false}) async {
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
    emit(GetUsersLoadingState());
      var response = await getAllUserService().getAllUsers(page: page,limit: 5,username: userName);
    response.fold((failure) {
      emit(GetUsersFailureState(failure.errorMessage));
    }, (users) {
      emit(GetUsersSuccessState(users));
        });
  }


}
