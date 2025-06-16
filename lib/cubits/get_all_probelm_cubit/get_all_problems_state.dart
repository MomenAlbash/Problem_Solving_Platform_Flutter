part of 'get_all_problems_cubit.dart';

@immutable
abstract class GetAllProblemsState {}

class GetAllProblemsInitial extends GetAllProblemsState {}
class GetAllProblemsLoadingState extends GetAllProblemsState {}
class GetAllProblemsFailureState extends GetAllProblemsState {}
class GetAllProblemsSuccessfullyState extends GetAllProblemsState {}

