import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skills_over_flow_app/helper/network/Failure.dart';
import 'package:skills_over_flow_app/helper/network/api.dart';
import 'package:skills_over_flow_app/helper/network/end_points/user_end_points.dart';
import 'package:skills_over_flow_app/models/user_model.dart';
class getAllUserService{

  Future<Either<Failure,List<userModel>>> getAllUsers({required int page,required int limit,String username=''})async{
    try{

      var data =await Api().get(Url: '$allUsers?page=$page&limit=$limit&username=$username');
      List<userModel> users =[];
      for(var user in data){
        users.add(
            userModel.fromjson(user)
        );
      }
      return right(users);
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.FromDioExecption(e));
      }else{
        return left(ServerFailure(e.toString()));
      }
    }
  }
}