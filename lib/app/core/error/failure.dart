import 'package:soul_doctor/app/core/error/error_type.dart';

class Failure {
  final ErrorType? errorType;

  final String message;
  Failure(this.message, {this.errorType});
}
