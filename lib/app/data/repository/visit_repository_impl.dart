import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/request/assign_visit_request.dart';
import 'package:soul_doctor/app/data/source/remote/provider/visit_provider.dart';
import 'package:soul_doctor/app/domain/repository/visit_repository.dart';

import '../../core/error/error_type.dart';
import '../source/remote/dto/common/response_wrapper.dart';

class VisitRepositoryImpl implements VisitRepository {
  final VisitProvider _visitProvider;

  VisitRepositoryImpl(this._visitProvider);

  @override
  Future<Either<Failure, bool>> assignVolunteer({
    required String consultationId,
    required String volunteerId,
    required String note,
  }) async {
    try {
      await _visitProvider.assignVolunteerVisit(
        AssignVisitRequest(
          consultationId: consultationId,
          volunteerId: volunteerId,
          note: note,
        ),
      );
      return Right(true);
    } catch (e) {
      if (e is DioException) {
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
      }
      return Left(Failure(e.toString()));
    }
  }

  @override
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
  }) async {
    try {
      List<MultipartFile> listMultipartImage = [];

      images?.forEach((data) async {
        listMultipartImage.add(
          await MultipartFile.fromFile(data.path, filename: data.name),
        );
      });

      await _visitProvider.reportVisit(
        visitId: visitId,
        observation: observation,
        cooperation: cooperation,
        mainDisease: mainDisease,
        autoanamnesis: autoanamnesis,
        diseaseHistory: diseaseHistory,
        familyHistory: familyHistory,
        heteroanamnesis: heteroanamnesis,
        medicationHistory: medicationHistory,
        psychiatricStatus: psychiatricStatus,
        images: listMultipartImage,
      );
      return Right(true);
    } catch (e) {
      if (e is DioException) {
        print(e);
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
      }
      return Left(Failure(e.toString()));
    }
  }
}
