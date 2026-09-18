import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/error/error_type.dart';
import 'package:soul_doctor/app/data/source/remote/dto/common/response_wrapper.dart';

class Failure {
  final ErrorType? errorType;

  final String message;
  Failure(this.message, {this.errorType});
}

const _connectionErrorTypes = {
  DioExceptionType.connectionTimeout,
  DioExceptionType.sendTimeout,
  DioExceptionType.receiveTimeout,
  DioExceptionType.connectionError,
};

/// Maps a [DioException] to a [Failure], tagging connection-level failures
/// (timeout / no internet) with [ErrorType.noConnection] so callers can queue
/// the request locally instead of surfacing a generic error.
///
/// `e.response` is null for connection errors/timeouts - calling
/// `ResponseWrapper.fromJson` on that null body used to throw inside the
/// catch block, turning into an unhandled exception that left callers stuck
/// awaiting forever instead of resolving with a Failure.
Failure mapDioExceptionToFailure(DioException e) {
  if (_connectionErrorTypes.contains(e.type) || e.response == null) {
    return Failure(
      "Tidak ada koneksi internet. Data akan disimpan dan dikirim otomatis.",
      errorType: ErrorType.noConnection,
    );
  }

  final responseData = e.response?.data;
  if (responseData is! Map<String, dynamic>) {
    return Failure(e.message ?? "Unexpected Error Occured");
  }

  var networkErrorMessage = ResponseWrapper.fromJson(responseData, (_) {});

  if (networkErrorMessage.status == 401) {
    return Failure(
      networkErrorMessage.message.toString(),
      errorType: ErrorType.sessionExpired,
    );
  }

  return Failure(networkErrorMessage.message ?? "Unexpected Error Occured");
}
