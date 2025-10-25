// To parse this JSON data, do
//
//     final authStatusResponse = authStatusResponseFromJson(jsonString);

import 'dart:convert';

AuthStatusResponse authStatusResponseFromJson(String str) => AuthStatusResponse.fromJson(json.decode(str));

String authStatusResponseToJson(AuthStatusResponse data) => json.encode(data.toJson());

class AuthStatusResponse {
    String? accessToken;
    String? refreshToken;
    bool? isProfileComplete;

    AuthStatusResponse({
        this.accessToken,
        this.refreshToken,
        this.isProfileComplete,
    });

    factory AuthStatusResponse.fromJson(Map<String, dynamic> json) => AuthStatusResponse(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        isProfileComplete: json["is_profile_complete"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "is_profile_complete": isProfileComplete,
    };
}
