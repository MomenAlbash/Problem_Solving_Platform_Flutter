import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skills_over_flow_app/helper/CachHelper.dart';
import 'package:skills_over_flow_app/helper/network/Failure.dart';
import 'package:skills_over_flow_app/helper/network/end_points/Auth_end_points.dart';
import 'package:skills_over_flow_app/utils/info_constants.dart';

import '../../helper/network/api.dart';

class changePasswordServices{
  Future<Either<Failure,String>> changePassword({required String oldPassword,required String newPassword})async{
    try{
      String? token= CacheHelper.getData(key: 'isLogin');
      var response =await Api().put(url: ChangePassword, body: {
        "oldPassword": oldPassword,
        "newPassword": newPassword
      }, token: token);
      return right(response.data['message']);
    }on DioException catch(e){
      return left(ServerFailure.FromDioExecption(e));
    }catch(e){
      return left(ServerFailure(e.toString()));
    }
  }

}