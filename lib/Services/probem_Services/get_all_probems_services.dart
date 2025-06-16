

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skills_over_flow_app/models/probems_model.dart';

import '../../helper/network/Failure.dart';
import '../../helper/network/api.dart';
import '../../helper/network/end_points/poblem_end_point.dart';
import '../../models/compiler_model.dart';

class getAllProblemsservice{

  Future<Either<Failure,List<problemsModel>>> getAllProblems()async {
    try {
      var data = await Api().get(Url: allProblem);
      List<problemsModel> problemsList = [];
      for (var problem in data) {
        problemsList.add(
            problemsModel.fromjson(problem)
        );
      }
      return right(problemsList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioExecption(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
