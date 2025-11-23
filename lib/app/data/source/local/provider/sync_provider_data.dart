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

  // final Box<Map<String, dynamic>> _consultationBox =
  //     Hive.box<Map<String, dynamic>>('consultation');
  final Box _consultationBox = Hive.box('consultation');

  final Box _consultationDetailBox = Hive.box('consultation_detail');

  final Box _visitReportBox = Hive.box('visit_report');

  Future<void> addConsultationStateData({
    required int state,
    required ConsultationResponseDto consultationResponseDto,
  }) async {
    print("Menambah data list konsultasi");
    await _consultationBox.put(
      state.toString(),
      consultationResponseDto.toJson(),
    );

    print(_consultationBox.get(state.toString()));
  }

  Future<void> addConsultationDetailData({
    required String id,
    required ConsultationDetailResponseDto consultationDetailResponseDto,
  }) async {
    print("Menambah data detail konsultasi");
    await _consultationDetailBox.put(
      id,
      consultationDetailResponseDto.toJson(),
    );
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
    var data = _visitReportBox.values
        .toList()
        .map((e) => Map<String, dynamic>.from(e))
        .toList();

    if (data.isEmpty) {
      return Left(Failure("Tidak ada lokal data yang didapatkan"));
    }

    return Right(
      data
          .map(
            (element) => VisitReportLocalDto.fromJson(
              Map<String, dynamic>.from(element),
            ),
          )
          .toList(),
    );
  }

  Either<Failure, ConsultationResponseDto> getLocalConsultation({
    required int state,
  }) {
    final raw = _consultationBox.get(state.toString());

    if (raw == null) {
      return Left(Failure("Tidak ada lokal data yang didapatkan"));
    }

    final data = Map<String, dynamic>.from(raw!);

    return Right(ConsultationResponseDto.fromJson(data));
  }

  Either<Failure, ConsultationDetailResponseDto> getLocalDetailConsultation({
    required String id,
  }) {
    var raw = _consultationDetailBox.get(id);

    if (raw == null) {
      return Left(Failure("Tidak ada lokal data yang didapatkan"));
    }

    final data = Map<String, dynamic>.from(raw!);

    return Right(ConsultationDetailResponseDto.fromJson(data));
  }
}
