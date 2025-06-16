import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skills_over_flow_app/helper/network/end_points/poblem_end_point.dart';

import '../../helper/network/Failure.dart';
import '../../helper/network/api.dart';
import '../../models/test_case_model.dart';
import '../../utils/info_constants.dart';

class AddProblemService{

  static Future<Either<Failure,String>> AddProblemByUser({
 required String compilerName,
 required String title,
 required String generalDescription,
 required String inputDescription,
 required String outputDescription,
    String? note,
    required String tutorial,
    required int difficulty,
    required int timelimit,
    required List<testCaseModel> testCases,
    required List<int> tags,
    required String solutionCode
 })async{
    try{
      final body={
        "compilerName": compilerName,
        "title": title,
        "generalDescription": generalDescription,
        "inputDescription": inputDescription,
        "outputDescription": outputDescription,
        "note": note,
        "tutorial": tutorial,
        "difficulty": difficulty,
        "solutionCode": solutionCode,
        "timeLimitMilliseconds": timelimit,
        "testCases":testCases,
        "tagIDs": tags
      };
      final response=await Api().get(Url: addProblem, token: token);
      return right(response.data);
    }on DioException catch(e){
      throw left(ServerFailure.FromDioExecption(e));
    }catch(e){
      return left(ServerFailure(e.toString()));
    }

  }

}