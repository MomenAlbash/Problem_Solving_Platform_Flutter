part of 'change_image_cubit.dart';

@immutable
abstract class ChangeImageState {}

class ChangeImageInitial extends ChangeImageState {}

class ImageChangeSuccessState extends ChangeImageState{}

class ImageChangeLoadingState extends ChangeImageState{}

class ImageChangeFailureState extends ChangeImageState{}