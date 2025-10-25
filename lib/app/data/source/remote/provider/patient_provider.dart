import 'package:soul_doctor/app/data/source/remote/dto/request/create_patient_request.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_detail_response_dto.dart';
import 'package:soul_doctor/app/data/source/remote/dto/response/patient_response_dto.dart';

import '../dto/common/response_wrapper.dart';

class PatientProvider {
  Future<ResponseWrapper> createPatientOnCaregiver(
    CreatePatientRequest patient,
  ) async {
    return ResponseWrapper.fromJson({
      "status": 201,
      "message": "patient created successfully",
      "data": null,
    }, (json) => null);
  }

  Future<ResponseWrapper<PatientResponseDto>> getPatient({
    String? q,
    int? p,
    int? pp,
  }) async {
    return ResponseWrapper.fromJson({
      "status": 200,
      "message": "success get patients",
      "data": {
        "patients": [
          {
            "id": "189d6f51-b790-47ee-a247-38d7ad752ad0",
            "name": "Anak Agung Ngurah Putra Tole Armstrong",
            "summary": {"age": 69, "gender": true, "has_caregiver": true},
          },
          {
            "id": "189d6f51-b790-47ee-6t2s-38d7ad752ad0",
            "name": "I Dontol",
            "summary": {"age": 49, "gender": false, "has_caregiver": false},
          },
        ],
        "pagination": {"current_page": 1, "total_page": 1},
      },
    }, (json) => PatientResponseDto.fromJson(json as Map<String, dynamic>));
  }

  Future<ResponseWrapper<PatientDetailResponseDto>> getPatientDetail(
    String id, {
    bool? detailed,
  }) async {
    return ResponseWrapper.fromJson({
      "status": 200,
      "message": "success get patients",
      "data": {
        "patient": {
          "fullname": "I Wayan Dontol",
          "nickname": "Abo",
          "birthday": "1995-10-01",
        },
        "caregiver": {
          "fullname": "I Made Caregiver",
          "nickname": "Sahur",
          "birthday": "1980-10-01",
        },
        "patient_history": {
          "cooperation": "RS Udayana",
          "main_disease": "Ngumik",
          "autoanamnesis":
              "Pasien tidak bisa diajak bicara, pasien bicara terus tidak henti-hentinya.",
          "disease_history": "Gangguan jiwa semenjak 33 thn lalu.",
          "family_history": "Lahir dari pasangan A dan B.",
          "heteroanamnesis":
              "Saudaranya, mengatakan pasien tidur sambil ngumik.",
          "medication_history": "Berobat ke RSJ Bangli.",
          "psychiatric_status": "-",
        },
        "consultations": [
          {
            "consultation_id": "189d6f51-b790-47ee-a247-38d7ad752ad0",
            "date": "2025-10-01",
            "detail": {
              "symptom":
                  "Cemas berlebihan, kesulitan tidur, stres karena pekerjaan",
              "start_date": "2025-09-25",
              "symptom_image": "https://example.com/image.jpg",
              "observation":
                  "Pasien lebih banyak diam, terkadang senyum sendiri",
              "diagnosis": "Depresi",
              "medication":
                  "- Clonazepam 0.5 mg (1 x sehari sampai habis) - Amoxicillin 500 mg (3 x sehari sampai habis)\n",
              "therapy":
                  "- Istirahat cukup, kurangi penggunaan gadget sebelum tidur - Olahraga ringan dan rutin\n",
              "visitor": "Putu Widyantara",
              "visit_images": [
                "https://example.com/image1.jpg",
                "https://example.com/image2.jpg",
              ],
            },
          },
        ],
      },
    }, (json) => PatientDetailResponseDto.fromJson(json as Map<String, dynamic>));
  }
}
