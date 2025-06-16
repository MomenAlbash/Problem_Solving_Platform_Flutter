part of 'get_users_cubit.dart';

@immutable
abstract class GetUsersState {}

class GetUsersInitial extends GetUsersState {}
class GetUsersSuccessState extends GetUsersState {
  final List<userModel> users;

  GetUsersSuccessState(this.users);

}
class GetUsersFailureState extends GetUsersState {
  final String errorMessage;

  GetUsersFailureState(this.errorMessage);

}
class GetUsersLoadingState extends GetUsersState {

}
