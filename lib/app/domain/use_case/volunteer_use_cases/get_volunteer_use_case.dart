import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/volunteer_item_response_dto.dart';
import 'package:soul_doctor/app/domain/model/volunteer.dart';
import 'package:soul_doctor/app/domain/repository/volunteer_repository.dart';

class GetVolunteerUseCase {
  final VolunteerRepository _volunteerRepository;

  GetVolunteerUseCase(this._volunteerRepository);

  Future<Either<Failure, List<Volunteer>>> execute() async {
    var response = await _volunteerRepository.getVolunteer();

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(
          success.volunteers?.map((e) => e.toVolunteer()).toList() ?? [],
        );
      },
    );
  }
}
