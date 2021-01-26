import 'package:flutter/cupertino.dart';

class UserModel {
  final String username;
  final UserInfo userInfo;
  final String accessToken;
  final String accessTokenType;
  final String accessTokenExpiryTime;
  final String idToken;
  final String idTokenExpiryTime;
  final String idTokenIssuedTime;
  final String refreshToken;

  const UserModel({
    @required this.username,
    @required this.userInfo,
    @required this.accessToken,
    @required this.accessTokenType,
    @required this.accessTokenExpiryTime,
    @required this.idToken,
    @required this.idTokenExpiryTime,
    @required this.idTokenIssuedTime,
    @required this.refreshToken,
  });
}

class UserInfo {
  String email;
  String picture;
  String preferredUsername;

  UserInfo.fromJSON(Map<String, dynamic> json) {
    this.email = json["email"] ?? "N/A";
    this.picture = json["picture"] ?? "N/A";
    this.preferredUsername = json["preferred_username"] ?? "N/A";
  }
}
