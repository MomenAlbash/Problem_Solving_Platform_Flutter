class userModel{
  final String userName ;
  const userModel({required this.userName});

  factory userModel.fromjson(json){
    return userModel(userName: json['username']);
  }
}