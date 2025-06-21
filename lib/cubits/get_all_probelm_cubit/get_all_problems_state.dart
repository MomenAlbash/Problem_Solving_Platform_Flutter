part of 'get_all_problems_cubit.dart';

@immutable
abstract class GetAllProblemsState {}

class GetAllProblemsInitial extends GetAllProblemsState {}
class GetAllProblemsLoadingState extends GetAllProblemsState {}
class GetAllProblemsFailureState extends GetAllProblemsState {
  final String errorMessage;

  GetAllProblemsFailureState(this.errorMessage);
}
class GetAllProblemsSuccessfullyState extends GetAllProblemsState {
  final List<problemsModel> problemList;

  GetAllProblemsSuccessfullyState(this.problemList);

}

