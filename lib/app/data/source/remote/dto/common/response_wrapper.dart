import 'package:soul_doctor/app/data/source/remote/dto/common/response_error.dart';

class ResponseWrapper<T> {
  final int? status;
  final String? message;
  final List<ResponseError>? error;
  final T? data;

  ResponseWrapper({this.status, this.message, this.error, this.data});

  factory ResponseWrapper.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return ResponseWrapper(
      status: json["status"],
      message: json["message"],
      error: json["error"] == null
          ? null
          : List<ResponseError>.from(json["error"]),
      data: json.containsKey('data') ? fromJsonT(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson(Object? Function(T? value) toJsonT) => {
    "status": status,
    "message": message,
    "error": error,
    "data": toJsonT(data),
  };
}
