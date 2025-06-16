import 'package:skills_over_flow_app/models/problem_model.dart';
import 'package:skills_over_flow_app/models/tag_model..dart';

class problemsModel{
  final String problemID;
  final String title;
  final String generalDescription;
  final String diffculty;
  final List<tagModel> tags;
  final int solutionsCount;
  final int attemptsCount;

  problemsModel({required this.title,required this.tags, required this.generalDescription,required this.attemptsCount,
  required this.diffculty,required this.problemID ,required this.solutionsCount});

  factory problemsModel.fromjson(json){
    return problemsModel(
      title: json['title'],
      problemID: json['problemID'],
      generalDescription: json['generalDescription'],
      diffculty: json['difficulty'],
      tags: json['tags'],
      solutionsCount: json['solutionsCount'],
      attemptsCount: json['attemptsCount']
    );
  }
}