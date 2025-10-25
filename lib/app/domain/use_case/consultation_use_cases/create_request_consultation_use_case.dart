import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soul_doctor/app/core/error/failure.dart';

import '../../repository/consultation_repository.dart';

class CreateRequestConsultationUseCase {
  final ConsultationRepository _consultationRepository;

  CreateRequestConsultationUseCase(this._consultationRepository);

  Future<Either<Failure, bool>> execute({
    required String patientId,
    required String symptom,
    required DateTime startDate,
    required XFile? image,
  }) async {
    MultipartFile? multipartImage = image != null
        ? await MultipartFile.fromFile(image.path, filename: image.name)
        : null;

    var response = await _consultationRepository.createRequestConsultation(
      patientId: patientId,
      symptom: symptom,
      startDate: startDate,
      image: multipartImage,
    );

    return response.fold(
      (failure) {
        return Left(failure);
      },
      (success) {
        return Right(success);
      },
    );
  }
}
