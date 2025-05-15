import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skills_over_flow_app/constants/info_constants.dart';
import 'package:skills_over_flow_app/helper/network/api.dart';
import '../helper/network/Failure.dart';
import '../helper/network/end_points/Auth_end_points.dart';

class LoginServices {
  static Future<Either<Failure,String>> userLogin({
    required String userName,
    required String password,
  }) async {
    try {
      final cleanedUsername = userName.trim();
      final cleanedPassword = password.trim();

      final body = {
        'username': cleanedUsername,
        'password': cleanedPassword
      };

      log('Sending Login request with: $body');

      final response = await Api().post(
        url: Login,
        body: body,
      );
      log('Login response: ${response.data}');
      token=response.data['token'];
      log(token);
      return right(response.data['message']);
    } on DioException catch(e){
      throw left(ServerFailure.FromDioExecption(e));
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }
}