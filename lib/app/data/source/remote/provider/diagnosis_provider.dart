import 'package:soul_doctor/app/data/source/remote/dto/request/diagnosis_request.dart';

import '../dto/common/response_wrapper.dart';

class DiagnosisProvider {
  Future<ResponseWrapper> createDiagnosis(
    DiagnosisRequest diagnosisRequest,
  ) async {
    return ResponseWrapper.fromJson({
      "status": 201,
      "message": "diagnosis created successfully",
      "data": null,
    }, (json) => null);
  }
}
