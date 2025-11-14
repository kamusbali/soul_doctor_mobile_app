import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/network/api_url.dart';
import 'package:soul_doctor/app/core/network/dio_client.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/volunteer_response_dto.dart';

import '../dto/common/response_wrapper.dart';

class VolunteerProvider {
  final Dio _dio = DioClient.instance;

  Future<ResponseWrapper<VolunteerResponseDto>> getVolunteer({
    int? pp,
    int? p,
    String? q,
  }) async {
    try {
      var response = await _dio.get(
        ApiUrl.volunteer,
        queryParameters: {"pp": pp, "p": p, "q": q},
      );
      var result = ResponseWrapper<VolunteerResponseDto>.fromJson(
        response.data,
        (json) => VolunteerResponseDto.fromJson(json as Map<String, dynamic>),
      );
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson({
    //   "status": 200,
    //   "message": "visit request rejected successfully",
    //   "data": {
    //     "volunteers": [
    //       {"id": "189d6f51-b790-47ee-a247-38d7ad752ad0", "name": "Made Bagus"},
    //       {
    //         "id": "189d6f51-b790-47ee-a247-38d7ad752ad1",
    //         "name": "Ketut Dontol",
    //       },
    //     ],
    //     "pagination": {"current_page": 1, "total_page": 1},
    //   },
    // }, (json) => VolunteerResponseDto.fromJson(json as Map<String, dynamic>));
  }
}
