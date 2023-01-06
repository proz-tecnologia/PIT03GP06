import 'package:uuid/uuid.dart';

class UsersModel {
  String? id;
  String? name;
  String? email;

  UsersModel({
    required this.id,
    required this.name,
    required this.email,
  });

  UsersModel.fromFirestore(Map<String, dynamic> map) {
    id = map["id"] ?? "";
    name = map["name"] ?? "";
    email = map["email"] ?? "";
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
    };
  }
}
