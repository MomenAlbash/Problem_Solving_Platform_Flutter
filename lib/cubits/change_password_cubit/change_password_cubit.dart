import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_over_flow_app/Services/auth_services/ChangePasswordService.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  static ChangePasswordCubit get(context)=>BlocProvider.of(context);

  Future<void> ChangePassword({required String oldPassword,required String newPassword})async{
    emit(ChangePasswordLoadingState());
    var response=await changePasswordServices().changePassword(oldPassword: oldPassword, newPassword: newPassword);

    response.fold((failure) {
      emit(ChangePasswordFailureState(failure.errorMessage));
    } , (message) {
      emit(ChangePasswordSuccessfulState(message));
    });
  }

}
