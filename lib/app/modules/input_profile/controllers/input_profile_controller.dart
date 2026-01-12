import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/domain/model/education.dart';
import 'package:soul_doctor/app/domain/model/gender.dart';
import 'package:soul_doctor/app/domain/model/marital.dart';
import 'package:soul_doctor/app/domain/model/profile.dart';
import 'package:soul_doctor/app/domain/model/religion.dart';
import 'package:soul_doctor/app/domain/model/role.dart';
import 'package:soul_doctor/app/domain/use_case/auth_use_cases/auth_use_cases.dart';
import 'package:soul_doctor/app/domain/use_case/profile_use_cases/profile_use_cases.dart';
import 'package:soul_doctor/app/helpers/ui_feedback_utils.dart';
import 'package:soul_doctor/app/modules/input_profile/settings/input_profile_settings.dart';
import 'package:soul_doctor/app/routes/app_pages.dart';

import '../../../core/error/error_type.dart';

class InputProfileController extends GetxController {
  final ProfileUseCases _profileUseCases;
  final AuthUseCases _authUseCases;

  InputProfileController(this._profileUseCases, this._authUseCases);

  InputProfileSettings inputProfileSettings =
      Get.arguments ?? InputProfileSettings();

  final formKey = GlobalKey<FormState>();

  Role? selectedRole;
  final TextEditingController roleController = TextEditingController();
  Rx<String?> roleErrorText = (null as String?).obs;

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  DateTime? selectedDateTime;
  final TextEditingController dateTimeController = TextEditingController();

  Gender? selectedGender;
  final TextEditingController genderController = TextEditingController();
  Rx<String?> genderErrorText = (null as String?).obs;

  Marital? selectedMarital;
  final TextEditingController maritalController = TextEditingController();
  Rx<String?> maritalErrorText = (null as String?).obs;

  Education? selectedEducation;
  final TextEditingController educationController = TextEditingController();
  Rx<String?> educationErrorText = (null as String?).obs;

  final TextEditingController jobController = TextEditingController();

  Religion? selectedReligion;
  final TextEditingController religionController = TextEditingController();
  Rx<String?> religionErrorText = (null as String?).obs;

  final TextEditingController addressController = TextEditingController();

  var inputProfileStatus = Resource<bool>.none().obs;

  var currentProfileData = Resource<Profile>.none().obs;

  @override
  void onInit() {
    super.onInit();

    onGetProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onChangeRoleValue(Role role) {
    selectedRole = role;
  }

  void onChangeGenderValue(Gender gender) {
    selectedGender = gender;
  }

  void onChangeMaritalValue(Marital marital) {
    selectedMarital = marital;
  }

  void onChangeEducationValue(Education education) {
    selectedEducation = education;
  }

  void onChaneReligionValue(Religion religion) {
    selectedReligion = religion;
  }

  void onGetProfile() async {
    if (inputProfileSettings.initialProfile != null) {
      currentProfileData.value = Resource.loading();
      var profile = inputProfileSettings.initialProfile!;

      var sessionData = await _authUseCases.getSessionDataUseCases.execute();

      selectedRole = sessionData?.role;
      roleController.text = sessionData!.role.name;

      fullnameController.text = profile.fullname;
      nikController.text = profile.nik;
      nicknameController.text = profile.nickname;
      emailController.text = profile.email ?? "";
      dateTimeController.text = DateFormat(
        "yyyy-MM-dd",
      ).format(profile.birthday).toString();
      selectedDateTime = profile.birthday;

      selectedGender = profile.gender;
      genderController.text = profile.gender.name;

      selectedMarital = Marital.getMaritalFromId(profile.maritalStatusId);
      maritalController.text = selectedMarital!.name;

      selectedEducation = Education.getEducationFromId(profile.lastEducationId);
      educationController.text = selectedEducation!.name;
      phoneController.text = profile.phone ?? "";

      jobController.text = profile.job;

      selectedReligion = Religion.getReligionFromId(profile.religionId);
      religionController.text = selectedReligion!.name;

      addressController.text = profile.address;
      currentProfileData.value = Resource.success(profile);

      return;
    }
    currentProfileData.value = Resource.loading();

    var compactResponse = await _profileUseCases.getProfileUseCase.execute();

    compactResponse.fold(
      (failure) {
        if (failure.errorType == ErrorType.sessionExpired) {
          UiFeedbackUtils.showDialog(
            title: "Sesi Login Kadaluarsa",
            body: "Silahkan login kembali untuk dapat mengakses fitur",
            primaryButtonText: "Okay",
            onPrimaryPressed: () async {
              await _authUseCases.logoutUseCase.execute();
              Get.offAllNamed(Routes.GUEST_WRAPPER);
            },
          );
          currentProfileData.value = Resource.error(failure.message);
          return;
        }

        UiFeedbackUtils.showDialog(
          title: "Terjadi Kesalahan",
          body: failure.message,
          primaryButtonText: "Okay",
          onPrimaryPressed: () {
            Get.back();
          },
        );
        currentProfileData.value = Resource.error(failure.message);
      },
      (success) {
        emailController.text = success.email!;
        currentProfileData.value = Resource.success(success);
      },
    );

    return;
  }

  void onUpdateProfile() async {
    if (selectedRole == null &&
        selectedGender == null &&
        selectedMarital == null &&
        selectedDateTime == null &&
        selectedEducation == null &&
        selectedReligion == null &&
        !formKey.currentState!.validate()) {
      if (selectedRole == null) {
        roleErrorText.value = "Jenis user tidak boleh kosong";
      }
      if (selectedGender == null) {
        genderErrorText.value = "Jenis kelamin tidak boleh kosong";
      }
      if (selectedMarital == null) {
        maritalErrorText.value = "Status perkawinan tidak boleh kosong";
      }
      if (selectedEducation == null) {
        educationErrorText.value = "Pendidikan tidak boleh kosong";
      }
      if (selectedReligion == null) {
        religionErrorText.value = "Agama tidak boleh kosong";
      }
      UiFeedbackUtils.showSnackbar("Lengkapi!", "Tolong lengkapi semua data!");
      return;
    }
    inputProfileStatus.value = Resource.loading();

    var response = await _profileUseCases.updateProfileUseCase.execute(
      role: selectedRole!,
      fullname: fullnameController.text,
      nickname: nicknameController.text,
      nik: nicknameController.text,
      phone: phoneController.text,
      email: emailController.text,
      birthday: selectedDateTime!,
      gender: selectedGender!,
      maritalStatusId: selectedMarital!,
      lastEducationId: selectedEducation!,
      job: jobController.text,
      religionId: selectedReligion!,
      address: addressController.text,
    );

    response.fold(
      (failure) {
        UiFeedbackUtils.showSnackbar("Error", failure.message);
        inputProfileStatus.value = Resource.error(failure.message);
      },
      (success) {
        inputProfileStatus.value = Resource.success(success);
        UiFeedbackUtils.showDialog(
          title: "Sukses",
          body: "Data berhasil di input, silahkan anda dapat melanjutkan!",
          primaryButtonText: "Oke",
          onPrimaryPressed: () async {
            if (Get.isDialogOpen == true) {
              Get.back();
            }

            if (Navigator.of(Get.context!).canPop()) {
              Get.back();
              return;
            }

            var sessionData = await _authUseCases.getSessionDataUseCases
                .execute();
            if (sessionData?.role == Role.patient) {
              Get.offAllNamed(Routes.PATIENT_WRAPPER);
              return;
            } else if (sessionData?.role == Role.caregiver) {
              Get.offAllNamed(Routes.CAREGIVER_WRAPPER);
              return;
            } else if (sessionData?.role == Role.volunteer) {
              Get.offAllNamed(Routes.VOLUNTEER_WRAPPER);
              return;
            } else if (sessionData?.role == Role.doctor) {
              Get.offAllNamed(Routes.DOCTOR_WRAPPER);
              return;
            }

            Get.offAllNamed(Routes.GUEST_WRAPPER);
            // Get to
          },
          barrierDismissible: false,
        );
      },
    );
  }

  void onCreateProfile() async {
    if (selectedRole == null &&
        selectedGender == null &&
        selectedMarital == null &&
        selectedDateTime == null &&
        selectedEducation == null &&
        selectedReligion == null &&
        !formKey.currentState!.validate()) {
      if (selectedRole == null) {
        roleErrorText.value = "Jenis user tidak boleh kosong";
      }
      if (selectedGender == null) {
        genderErrorText.value = "Jenis kelamin tidak boleh kosong";
      }
      if (selectedMarital == null) {
        maritalErrorText.value = "Status perkawinan tidak boleh kosong";
      }
      if (selectedEducation == null) {
        educationErrorText.value = "Pendidikan tidak boleh kosong";
      }
      if (selectedReligion == null) {
        religionErrorText.value = "Agama tidak boleh kosong";
      }
      UiFeedbackUtils.showSnackbar("Lengkapi!", "Tolong lengkapi semua data!");
      return;
    }
    inputProfileStatus.value = Resource.loading();
    var response = await _profileUseCases.createProfileUseCase.execute(
      role: selectedRole!,
      fullname: fullnameController.text,
      nickname: nicknameController.text,
      nik: nikController.text,
      phone: phoneController.text,
      email: emailController.text,
      birthday: selectedDateTime!,
      gender: selectedGender!,
      maritalStatusId: selectedMarital!,
      lastEducationId: selectedEducation!,
      job: jobController.text,
      religionId: selectedReligion!,
      address: addressController.text,
    );

    response.fold(
      (failure) {
        UiFeedbackUtils.showSnackbar("Error", failure.message);
        inputProfileStatus.value = Resource.error(failure.message);
      },
      (success) {
        inputProfileStatus.value = Resource.success(success);
        UiFeedbackUtils.showDialog(
          title: "Sukses",
          body: "Data berhasil di input, silahkan anda dapat melanjutkan!",
          primaryButtonText: "Oke",
          onPrimaryPressed: () async {
            if (Get.isDialogOpen == true) {
              Get.back();
            }

            if (Navigator.of(Get.context!).canPop()) {
              Get.back();
              return;
            }

            var sessionData = await _authUseCases.getSessionDataUseCases
                .execute();
            if (sessionData?.role == Role.patient) {
              Get.offAllNamed(Routes.PATIENT_WRAPPER);
              return;
            } else if (sessionData?.role == Role.caregiver) {
              Get.offAllNamed(Routes.CAREGIVER_WRAPPER);
              return;
            } else if (sessionData?.role == Role.volunteer) {
              Get.offAllNamed(Routes.VOLUNTEER_WRAPPER);
              return;
            } else if (sessionData?.role == Role.doctor) {
              Get.offAllNamed(Routes.DOCTOR_WRAPPER);
              return;
            }

            Get.offAllNamed(Routes.GUEST_WRAPPER);
          },
          barrierDismissible: false,
        );
      },
    );
  }

  Future<void> onSelectDateBirth() async {
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDate != null) {
      selectedDateTime = pickedDate;
      dateTimeController.text = DateFormat(
        "yyyy-MM-dd",
      ).format(pickedDate).toString();
    }
  }
}
