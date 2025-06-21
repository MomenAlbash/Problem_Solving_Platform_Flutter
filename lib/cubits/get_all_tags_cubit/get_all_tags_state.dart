part of 'get_all_tags_cubit.dart';

@immutable
abstract class GetAllTagsState {}

class GetAllTagsInitial extends GetAllTagsState {}

class GetAllTagsSuccessState extends GetAllTagsState {
  final List<tagModel> tags;

  GetAllTagsSuccessState(this.tags);
}

class GetAllTagsLoadingState extends GetAllTagsState {}

class GetAllTagsFailureState extends GetAllTagsState {
  final String errorMessage;

  GetAllTagsFailureState(this.errorMessage);
}
