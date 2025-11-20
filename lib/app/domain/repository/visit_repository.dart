import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soul_doctor/app/core/error/failure.dart';

abstract class VisitRepository {
  Future<Either<Failure, bool>> assignVolunteer({
    required String consultationId,
    required String volunteerId,
    required String note,
  });

  Future<Either<Failure, bool>> reportVolunteer({
    required String visitId,
    required String observation,
    String? cooperation,
    String? mainDisease,
    String? autoanamnesis,
    String? diseaseHistory,
    String? familyHistory,
    String? heteroanamnesis,
    String? medicationHistory,
    String? psychiatricStatus,
    List<XFile>? images,
  });

  Future<Either<Failure, bool>> rejectVolunteerVisit({
    required String visitId,
    required String reason,
  });

  Future<Either<Failure, bool>> acceptVolunteerVisit({required String visitId});
}
