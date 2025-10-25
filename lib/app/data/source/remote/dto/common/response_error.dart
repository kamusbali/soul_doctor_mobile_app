// To parse this JSON data, do
//
//     final responseError = responseErrorFromJson(jsonString);

import 'dart:convert';

ResponseError responseErrorFromJson(String str) => ResponseError.fromJson(json.decode(str));

String responseErrorToJson(ResponseError data) => json.encode(data.toJson());

class ResponseError {
    String? key;
    String? value;

    ResponseError({
        this.key,
        this.value,
    });

    factory ResponseError.fromJson(Map<String, dynamic> json) => ResponseError(
        key: json["key"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
    };
}
