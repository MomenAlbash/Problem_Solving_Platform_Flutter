  import 'dart:developer';

  import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skills_over_flow_app/helper/network/Failure.dart';
  import 'package:skills_over_flow_app/helper/network/api.dart';
import 'package:skills_over_flow_app/utils/info_constants.dart';
  import '../../helper/network/end_points/Auth_end_points.dart';

  class RegisterServices {
    static String message="";

    static Future<Either<Failure,String>> userRegister({
      required String userName,
      required String password,
      String? image,
    }) async {
      try {
        final cleanedUsername = userName.trim();
        final cleanedPassword = password.trim();
        Map<dynamic,dynamic> body;
        if (image != null){
           body = {
            'username': cleanedUsername,
            'password': cleanedPassword,
            'profileImage': image
          };
        }else{
           body = {
            'username': cleanedUsername,
            'password': cleanedPassword
          };
        }


        log('Sending register request with: $body');

        final response = await Api().post(
          url: Register,
          body: body,
        );
        token=response.data['token'];
        log('Register response: ${response.data}');
        message=response.data['message'];
        if (response.statusCode == 400) {
          log('Error message: $message');
          return left(ServerFailure(message)); // إرجاع الرسالة كـ Failure
        }

        // في حالة النجاح (مثل statusCode 200 أو 201)
        return right(message);
      }catch(e){
        if(e is DioException){
          return left(ServerFailure.FromDioExecption(e));
        }else{
          return left(ServerFailure(e.toString()));
        }
      }
    }
  }