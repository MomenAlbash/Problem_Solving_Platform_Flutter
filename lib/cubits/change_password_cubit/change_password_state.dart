part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState {}

class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessfulState extends ChangePasswordState {
  final String message;

  ChangePasswordSuccessfulState(this.message);

}

class ChangePasswordFailureState extends ChangePasswordState {
  final String errorMessage;

  ChangePasswordFailureState(this.errorMessage);

}
