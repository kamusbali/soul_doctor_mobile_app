import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/domain/repository/visit_repository.dart';

class AssignVolunteerUseCase {
  final VisitRepository _visitRepository;

  AssignVolunteerUseCase(this._visitRepository);

  Future<Either<Failure, bool>> execute({
    required String consultationId,
    required String volunteerId,
    required String note,
  }) async {
    var response = await _visitRepository.assignVolunteer(
      consultationId: consultationId,
      volunteerId: volunteerId,
      note: note,
    );

    return response;
  }
}
