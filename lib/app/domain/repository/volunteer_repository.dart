import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/volunteer_response_dto.dart';

abstract class VolunteerRepository {
  Future<Either<Failure, VolunteerResponseDto>> getVolunteer();
}
