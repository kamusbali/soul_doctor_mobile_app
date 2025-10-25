import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/compact_consultation_detail_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_detail_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_response_dto.dart';

import '../model/consultation_status.dart';

abstract class ConsultationRepository {
  Future<Either<Failure, ConsultationResponseDto>> getConsultation({
    required ConsultationStatus state,
    bool? medication,
    bool? therapy,
    bool? visit,
    int? age,
    bool? firstConsultation,
    String? patientId,
    String? q,
    int? p,
    int? pp,
  });

  Future<Either<Failure, ConsultationDetailResponseDto>> getConsultationDetail(
    String id,
  );

  Future<Either<Failure, CompactConsultationDetailResponseDto>>
  getCompactConsultationDetail(String id);

  Future<Either<Failure, bool>> createRequestConsultation({
    required String patientId,
    required String symptom,
    required DateTime startDate,
    required MultipartFile? image,
  });
}
