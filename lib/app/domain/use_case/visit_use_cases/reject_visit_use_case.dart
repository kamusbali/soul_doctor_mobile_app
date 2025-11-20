import 'package:dartz/dartz.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/domain/repository/visit_repository.dart';

class RejectVisitUseCase {
  final VisitRepository _visitRepository;

  RejectVisitUseCase(this._visitRepository);

  Future<Either<Failure, bool>> execute({
    required String visitId,
    required String reason,
  }) async {
    var response = await _visitRepository.rejectVolunteerVisit(
      visitId: visitId,
      reason: reason,
    );
    return response;
  }
}
