// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.token,
    required this.user,
    required this.tokenType,
    required this.expiresIn,
  });

  String token;
  User user;
  String tokenType;
  int expiresIn;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        user: User.fromJson(json["user"]),
        tokenType: json["tokenType"],
        expiresIn: json["expiresIn"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
        "tokenType": tokenType,
        "expiresIn": expiresIn,
      };
}

class User {
  User({
    required this.id,
    required this.personId,
    required this.profileId,
    required this.username,
    required this.password,
    required this.email,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.fullName,
    required this.birthdate,
    required this.gender,
    required this.avatar,
    required this.profileName,
    required this.token,
    required this.lastRequest,
    required this.numberLogins,
    required this.contextClientId,
  });

  int id;
  int personId;
  int profileId;
  String username;
  String password;
  String email;
  int active;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String fullName;
  DateTime birthdate;
  String gender;
  String avatar;
  String profileName;
  String token;
  DateTime lastRequest;
  int numberLogins;
  int contextClientId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        personId: json["person_id"],
        profileId: json["profile_id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        fullName: json["full_name"],
        birthdate: DateTime.parse(json["birthdate"]),
        gender: json["gender"],
        avatar: json["avatar"],
        profileName: json["profile_name"],
        token: json["token"],
        lastRequest: DateTime.parse(json["last_request"]),
        numberLogins: json["number_logins"],
        contextClientId: json["context_client_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "person_id": personId,
        "profile_id": profileId,
        "username": username,
        "password": password,
        "email": email,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "full_name": fullName,
        "birthdate":
            "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "avatar": avatar,
        "profile_name": profileName,
        "token": token,
        "last_request": lastRequest.toIso8601String(),
        "number_logins": numberLogins,
        "context_client_id": contextClientId,
      };
}
