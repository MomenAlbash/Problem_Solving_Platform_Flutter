import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skills_over_flow_app/helper/network/end_points/compilers_end_points.dart';
import 'package:skills_over_flow_app/models/compiler_model.dart';

import '../../helper/network/Failure.dart';
import '../../helper/network/api.dart';

class getAllCompilersServices{

  Future<Either<Failure,List<String>>> getAllCompilers()async {
    try {


      var data = await Api().get(Url: Compilers);
      List<String> compilersName = [];
      for (var compiler in data) {
        compilersName.add(
            (compilerModel.fromjson(compiler)).compilerName
        );
      }
      return right(compilersName);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioExecption(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
