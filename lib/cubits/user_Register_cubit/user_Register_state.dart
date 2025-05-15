part of 'user_Register_cubit.dart';

@immutable
abstract class userRegisterState {}

class UserLoginInitial extends userRegisterState {}

class UserLoginSuccessState extends userRegisterState{
  final String message;

  UserLoginSuccessState(this.message);

}

class UserLoginFailureState extends userRegisterState{
  final String errorMessage;

  UserLoginFailureState(this.errorMessage);

}

class UserLoginLoadingState extends userRegisterState{}

class PasswordVisibleOrNotVisibleState extends userRegisterState{}
class ImageChangeSuccessState extends userRegisterState{}

class ImageChangeLoadingState extends userRegisterState{}

class ImageChangeFailureState extends userRegisterState{}