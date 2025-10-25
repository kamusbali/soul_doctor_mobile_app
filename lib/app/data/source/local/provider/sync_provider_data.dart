import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soul_doctor/app/core/error/failure.dart';
import 'package:soul_doctor/app/data/source/local/dto/visit_report_local_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_detail_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/consultation_response_dto.dart';

class SyncProviderData {
  SyncProviderData._internal();
  static final SyncProviderData _instance = SyncProviderData._internal();
  static SyncProviderData get instance => _instance;

  final Box<Map<String, dynamic>> _consultationBox =
      Hive.box<Map<String, dynamic>>('consultation');

  final Box<Map<String, dynamic>> _consultationDetailBox =
      Hive.box<Map<String, dynamic>>('consultation_detail');

  final Box<Map<String, dynamic>> _visitReportBox =
      Hive.box<Map<String, dynamic>>('visit_report');

  void addConsultationStateData({
    required int state,
    required ConsultationResponseDto consultationResponseDto,
  }) async {
    _consultationBox.put(state.toString(), consultationResponseDto.toJson());
  }

  void addConsultationDetailData({
    required String id,
    required ConsultationDetailResponseDto consultationDetailResponseDto,
  }) async {
    _consultationDetailBox.put(id, consultationDetailResponseDto.toJson());
  }

  Future<void> addVisitReportData({
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
    final List<Uint8List> listImageBytes = [];
    if (images != null) {
      for (final img in images) {
        listImageBytes.add(await img.readAsBytes());
      }
    }

    final data = VisitReportLocalDto(
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
      images: listImageBytes,
    );

    await _visitReportBox.put(visitId, data.toJson());
  }

  Either<Failure, List<VisitReportLocalDto>> getVisitReport() {
    var data = _visitReportBox.values.toList();

    if (data.isEmpty) {
      return Left(Failure("No Data"));
    }

    return Right(
      data.map((element) => VisitReportLocalDto.fromJson(element)).toList(),
    );
  }

  Either<Failure, ConsultationResponseDto> getLocalConsultation({
    required int state,
  }) {
    var data = _consultationBox.get(state);

    if (data == null) {
      return Left(Failure("No Data"));
    }

    return Right(ConsultationResponseDto.fromJson(data));
  }

  Either<Failure, ConsultationDetailResponseDto> getLocalDetailConsultation({
    required String id,
  }) {
    var data = _consultationDetailBox.get(id);

    if (data == null) {
      return Left(Failure("No Data"));
    }

    return Right(ConsultationDetailResponseDto.fromJson(data));
  }
}
