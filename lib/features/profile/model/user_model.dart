import 'dart:convert';

class UserModel {
  String id = "";
  String email;
  String? firstName;
  String? phoneNumber;
  String? lastName;
  String? profilePhoto;
  DateTime? dateOfBirth;
  int? gender;
  DateTime? joinDate;

  UserModel({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profilePhoto,
    this.dateOfBirth,
    this.gender,
    this.joinDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'first_name': firstName,
      'phone_number': phoneNumber,
      'last_name': lastName,
      'profile_photo': profilePhoto,
      'date_of_birth': dateOfBirth?.toIso8601String(),
      'gender': gender,
      'join_date': joinDate?.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    UserModel user = UserModel(id: "", email: "");
    for (var value in map["UserAttributes"]) {
      if (value["Name"] == "sub") {
        user.id = value["Value"];
      } else if (value["Name"] == "email") {
        user.email = value["Value"];
      } else if (value["Name"] == "given_name") {
        user.firstName = value["Value"];
      } else if (value["Name"] == "family_name") {
        user.lastName = value["Value"];
      } else if (value["Name"] == "picture") {
        user.profilePhoto = value["Value"];
      } else if (value["Name"] == "birthdate") {
        user.dateOfBirth = DateTime.parse(value["Value"]);
      } else if (value["Name"] == "phone_number") {
        user.phoneNumber = value["Value"];
      }
    }
    return user;
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'profile_photo': profilePhoto,
        'date_of_birth': dateOfBirth?.toIso8601String(),
        'gender': gender,
        'join_date': joinDate?.toIso8601String(),
      };
  //String toJson() => json.encode(toMap());

  factory UserModel.fromJson(Map<String, dynamic> source) =>
      UserModel.fromMap(source);
}

class UserTokensModel {
  String accessToken;
  String refreshToken;
  String idToken;

  UserTokensModel({
    required this.accessToken,
    required this.refreshToken,
    required this.idToken,
  });
  factory UserTokensModel.fromMap(Map<String, dynamic> map) {
    return UserTokensModel(
      accessToken: map['access_token'] as String,
      refreshToken: map['refresh_token'] as String,
      idToken: map['id_token'] as String,
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'id_token': idToken,
    };
  }
}
