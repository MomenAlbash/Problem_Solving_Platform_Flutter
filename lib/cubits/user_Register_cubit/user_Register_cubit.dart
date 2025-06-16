import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:skills_over_flow_app/Services/auth_services/RegisterService.dart';
import 'package:skills_over_flow_app/Services/auth_services/loginServices.dart';

part 'user_Register_state.dart';

class userRegisterCubit extends Cubit<userRegisterState> {
  userRegisterCubit() : super(UserLoginInitial());
    static userRegisterCubit get(context)=>BlocProvider.of(context);
  Future<void> userRegister({
    required String userName,
    required String password,
    String? image,
  }) async {
    emit(UserLoginLoadingState());
    final result=(image ==null)?
    await RegisterServices.userRegister(userName: userName, password: password):
    await RegisterServices.userRegister(userName: userName, password: password,image: image);

    result.fold(
          (failure) => emit(UserLoginFailureState(failure.errorMessage)),
          (message) => emit(UserLoginSuccessState(message)), // استخدام الرسالة المستلمة
    );
  }

  // //  Future<void> userLogin({required String userName , required String password })async{
  //     emit(UserLoginLoadingState());
  //     try{
  //       LoginServices.userLogin(userName: userName, password: password);
  //       emit(UserLoginSuccessState(message));
  //     }catch(e){
  //       emit(UserLoginFailureState(e.toString()));
  //     }
  //   }
  bool isVisiblePassword=false;
  changeVisiblePassword(){
    isVisiblePassword=!isVisiblePassword;
    emit(PasswordVisibleOrNotVisibleState());
  }
  bool isVisibleConfirmPassword=false;
  changeVisibleConfirmPassword(){
    isVisibleConfirmPassword=!isVisibleConfirmPassword;
    emit(PasswordVisibleOrNotVisibleState());
  }
  XFile? imageFile;
  final ImagePicker _picker = ImagePicker();
  ChangeImage()async{
    emit(ImageChangeLoadingState());
    try{
      imageFile=await _picker.pickImage(source: ImageSource.gallery);
      log(File(imageFile!.path).toString());
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
