class tagModel{
  final int tagID;
  final String tagName;

  tagModel({required this.tagID,required this.tagName});

  factory tagModel.fromjson(json){
    return tagModel(tagID: json['tagID'],tagName: json["name"]);
  }
}