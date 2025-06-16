class compilerModel {
  final String language;
  final String compilerName;
  final String name;

  compilerModel(
      {required this.compilerName, required this.language, required this.name});

  factory compilerModel.fromjson(json) {
    return compilerModel(
      compilerName: json['compilerName'],
      language: json['language'],
      name: json['name'],
    );
  }
}
