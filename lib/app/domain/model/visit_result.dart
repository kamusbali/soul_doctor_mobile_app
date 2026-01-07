import 'package:soul_doctor/app/domain/model/visit_result_status.dart';

class VisitResult {
  String observation;
  bool? sideEffect;
  VisitResultStatus? resultStatus;
  List<String> images;

  VisitResult({
    required this.observation,
    required this.images,
    this.sideEffect,
    this.resultStatus,
  });
}
