import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:skills_over_flow_app/Services/auth_services/loginServices.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit() : super(UserLoginInitial());

  static UserLoginCubit get(context)=>BlocProvider.of(context);

  bool isVisible=false;

  Future<void> userLogin({
    required String userName,
    required String password

  }) async {
    emit(UserLoginLoadingState());
    final result=await LoginServices.userLogin(userName: userName, password: password);
    result.fold(
          (failure) => emit(UserLoginFailureState(failure.errorMessage)),
          (message) => emit(UserLoginSuccessState(message)), // استخدام الرسالة المستلمة
    );
  }

  changeVisiblePassword(){
    isVisible=!isVisible;
    emit(UserPasswordIsVisibleState());
  }

}
