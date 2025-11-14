import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/network/api_url.dart';
import 'package:soul_doctor/app/core/network/dio_client.dart';
import 'package:soul_doctor/app/data/source/remote/dto/common/response_wrapper.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/profile_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/compact_user_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/profile_response_dto.dart';


class ProfileProvider {
  final Dio _dio = DioClient.instance;

  Future<ResponseWrapper<CompactUserResponseDto?>> getCompactProfile() async {
    try {
      var response = await _dio.get(
        ApiUrl.profile,
        queryParameters: {"compact": true},
      );
      var result = ResponseWrapper<CompactUserResponseDto>.fromJson(
        response.data,
        (json) => CompactUserResponseDto.fromJson(json as Map<String, dynamic>),
      );
      return result;
    } catch (e) {
      rethrow;
    }
    // throw DioException(
    //   requestOptions: RequestOptions(),
    //   response: Response(
    //     requestOptions: RequestOptions(),
    //     data: {"status": 401, "message": "", "data": null, "error": []},
    //     statusCode: 401,
    //   ),
    // );
    // return ResponseWrapper<CompactUserResponseDto>(
    //   status: 200,
    //   message: "get profile success",
    //   data: CompactUserResponseDto(
    //     fullname: "Anak Agung Ngurah Putra Tole Armstrong",
    //     role: Role.patient.id,
    //     patients: null,
    //     caregiver: CompactProfileResponseDto(id: "", name: "Tude Maha"),
    //   ),
    // );
  }

  Future<ResponseWrapper<ProfileResponseDto>> getProfile() async {
    try {
      var response = await _dio.get(
        ApiUrl.profile,
        queryParameters: {"compact": false},
      );
      var result = ResponseWrapper<ProfileResponseDto>.fromJson(
        response.data,
        (json) => ProfileResponseDto.fromJson(json as Map<String, dynamic>),
      );
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson({
    //   "status": 200,
    //   "message": "get profile success",
    //   "data": {
    //     "fullname": "John Doe",
    //     "nickname": "John",
    //     "email": "johndoe@doctorsoul.com",
    //     "birthday": "2025-09-01",
    //     "gender": true,
    //     "phone": "0855252525252",
    //     "marital_status_id": 1,
    //     "last_education_id": 2,
    //     "job": "Swasta",
    //     "religion_id": 1,
    //     "address": "Br. Kebilbil, Desa Belalang, Kediri, Tabanan, Bali",
    //   },
    // }, (json) => ProfileResponseDto.fromJson(json as Map<String, dynamic>));
  }

  Future<ResponseWrapper> createProfile(ProfileRequest profileRequest) async {
    try {
      var response = await _dio.post(
        ApiUrl.profile,
        data: profileRequest.toJson(),
      );
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson({
    //   "status": 201,
    //   "message": "profile created successfully",
    //   "data": null,
    // }, (json) => null);
  }

  Future<ResponseWrapper> updateProfile(ProfileRequest profileRequest) async {
    try {
      var response = await _dio.put(
        ApiUrl.profile,
        data: profileRequest.toJson(),
      );
      var result = ResponseWrapper.fromJson(response.data, (json) => null);
      return result;
    } catch (e) {
      rethrow;
    }
    // return ResponseWrapper.fromJson({
    //   "status": 200,
    //   "message": "profile updated successfully",
    //   "data": null,
    // }, (json) => null);
  }
}
