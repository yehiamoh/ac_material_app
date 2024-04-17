class UserModel {
  final String id;
  final String name;


  UserModel({required this.id, required this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['userId'], name: json['name']);
  }

  Map<String, dynamic> tojson() {
    return {
      'userId': id ,
      'name': name,

    };
  }
}
