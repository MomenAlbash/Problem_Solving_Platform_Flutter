import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'change_image_state.dart';

class ChangeImageCubit extends Cubit<ChangeImageState> {
  ChangeImageCubit() : super(ChangeImageInitial());
  static ChangeImageCubit get(context)=>BlocProvider.of<ChangeImageCubit>(context);
  XFile? imageFile;
  final ImagePicker _picker = ImagePicker();
  ChangeImage()async{
    emit(ImageChangeLoadingState());
    try{
      imageFile=await _picker.pickImage(source: ImageSource.gallery);
      emit(ImageChangeSuccessState());
    }catch(e){
      imageFile=null;
      emit(ImageChangeFailureState());
    }
  }

  deleteImage(){
    imageFile=null;
    emit(ImageChangeSuccessState());
  }

}
