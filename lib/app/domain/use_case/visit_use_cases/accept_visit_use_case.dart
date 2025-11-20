import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../repository/visit_repository.dart';

class AcceptVisitUseCase {
  final VisitRepository _visitRepository;

  AcceptVisitUseCase(this._visitRepository);

  Future<Either<Failure, bool>> execute({required String visitId}) async {
    var response = await _visitRepository.acceptVolunteerVisit(
      visitId: visitId,
    );
    return response;
  }
}
