import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:skills_over_flow_app/helper/network/end_points/tags_end_points.dart';
import 'package:skills_over_flow_app/models/compiler_model.dart';
import 'package:skills_over_flow_app/models/tag_model..dart';

import '../../helper/network/Failure.dart';
import '../../helper/network/api.dart';
import '../../models/user_model.dart';

class TagServices {

  Future<Either<Failure, List<tagModel>>> getAllTags() async {
    try {
      var data = await Api().get(Url: Tags);
      List<tagModel> tags = [];
      for (var tag in data) {
        tags.add(
            tagModel.fromjson(tag)

        );
      }
      return right(tags);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioExecption(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}