import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/volunteer_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/provider/volunteer_provider.dart';
import 'package:soul_doctor/app/domain/repository/volunteer_repository.dart';

import '../../core/error/error_type.dart';
import '../source/remote/dto/common/response_wrapper.dart';

class VolunteerRepositoryImpl implements VolunteerRepository {
  final VolunteerProvider _volunteerProvider;

  VolunteerRepositoryImpl(this._volunteerProvider);

  @override
  Future<Either<Failure, VolunteerResponseDto>> getVolunteer() async {
    try {
      var response = await _volunteerProvider.getVolunteer();
      if (response.data == null) return Left(Failure("Data kosong"));
      return Right(response.data!);
    } catch (e) {
      if (e is DioException) {
        try {
          var networkErrorMessage = ResponseWrapper.fromJson(
            (e).response?.data,
            (_) {},
          );
          if (networkErrorMessage.status == 401) {
            return Left(
              Failure(
                networkErrorMessage.message.toString(),
                errorType: ErrorType.sessionExpired,
              ),
            );
          }
          return Left(
            Failure(networkErrorMessage.message ?? "Unexpected Error Occured"),
          );
        } catch (e) {
          return Left(Failure("Error dalam melakukan konversi"));
        }
      }
      return Left(Failure(e.toString()));
    }
  }
}
