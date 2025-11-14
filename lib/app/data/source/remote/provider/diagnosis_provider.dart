import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/network/dio_client.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/diagnosis_request.dart';

import '../../../../core/network/api_url.dart';
import '../dto/common/response_wrapper.dart';

class DiagnosisProvider {
  final Dio _dio = DioClient.instance;

  Future<ResponseWrapper> createDiagnosis(
    DiagnosisRequest diagnosisRequest,
  ) async {
    try {
      var response = await _dio.post(
        ApiUrl.diagnosis,
        data: diagnosisRequest.toJson(),
      );
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson({
    //   "status": 201,
    //   "message": "diagnosis created successfully",
    //   "data": null,
    // }, (json) => null);
  }
}
