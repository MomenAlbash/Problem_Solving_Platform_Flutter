part of 'get_all_compilers_cubit.dart';

@immutable
abstract class GetAllCompilersState {}

class GetAllCompilersInitial extends GetAllCompilersState {}
class GetAllCompilersLoadingState extends GetAllCompilersState {

}
class GetAllCompilersSuccessfullyState extends GetAllCompilersState {
  final List<String> compilersName;
  GetAllCompilersSuccessfullyState(this.compilersName);
}
class GetAllCompilersFailureState extends GetAllCompilersState {
  final String errorMessage;
  GetAllCompilersFailureState(this.errorMessage);
}
