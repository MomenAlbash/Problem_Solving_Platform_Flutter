part of 'user_login_cubit.dart';

@immutable
abstract class UserLoginState {}

class UserLoginInitial extends UserLoginState {}

class UserLoginSuccessState extends UserLoginState{
  final String message;

  UserLoginSuccessState(this.message);

}

class UserLoginLoadingState extends UserLoginState{}

class UserLoginFailureState extends UserLoginState{
  final String errorMessage;

  UserLoginFailureState(this.errorMessage);
}

class UserPasswordIsVisibleState extends UserLoginState{}