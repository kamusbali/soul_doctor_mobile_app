# Graph Report - lib  (2026-09-18)

## Corpus Check
- 386 files · ~57,809 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 3526 nodes · 5503 edges · 231 communities (227 shown, 4 thin omitted)
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- App Routes
- Basic Dialog
- Report Daily Controller
- Color Theme
- Report Visit Controller
- Assessment Result View
- Dummy Constant
- Update Pin Controller
- Consultation Detail Response Dto
- Profile Provider
- Input Profile Controller
- Consultation Repository Impl
- Visit Schedule Form Controller
- Visit Provider
- Account Setting View
- Patient Item Response Dto
- Create Patient Controller
- Update Profile Use Case
- Visit Use Cases
- Patient History Controller
- Diagnosis Repository Impl
- Otp Verification Controller
- Auth Repository Impl
- Visit Report Local Dto
- Detail Consultation Controller
- Add Edit Reminder Care Task Controller
- Reminder Care Task List Patient Controller
- Report Daily Patient Controller
- Create Pin Use Case
- Patient Controller
- Visit Result Model
- Daily Report Item Response Dto
- Add Visit Request Controller
- Consultation Controller
- Repository Injection
- Visit Result Response Dto
- Profile Use Cases
- Visit Repository
- Visit Controller
- Volunteer Home Controller
- Notification Utils
- Api Url
- Text Style Theme
- Patient Repository Impl
- Verify Otp Request
- Transaction Otp Response Dto
- Daily Report Item Model
- Create Profile Use Case
- Profile Response Dto
- Auth Use Cases
- Account Controller
- Visit Detail Controller
- Caregiver Wrapper Controller
- Profile Request
- Refresh Token Request
- Consultation Item Response Dto
- Consultation Detail Model
- Spacing Theme
- Add Consultation Controller
- Diagnosis Form Controller
- Card Consultation
- Const Path Constant
- Add Reminder Calendar Use Case
- Create Patient Request
- Compact Consultation Detail Response Dto
- Compact Consultation Detail Model
- Reminder Care Task Detail
- Account Setting Controller
- Animated Progress Bar
- App Config
- Calendar Reminder Local Dto
- Token Provider
- Patient Detail History Response Dto
- Assessment Question Controller
- Create Pin Controller
- Accordion Account Linked Widget
- Provider Injection
- Profile Repository
- Create Reminder Care Task Use Case
- Screening Repository Impl
- Sync Provider Data
- Patient Detail Response Dto
- Calendar Reminder Model
- Reminder Care Task Use Cases
- Consultation Request Detail Controller
- Reminder Care Task Controller
- Card Expanded Information
- Patient Summary Response Dto
- Reminder Care Task Response Dto
- Patient Use Cases
- Screening Use Cases
- Use Cases Injection
- Patient Detail Model
- Profile Model
- Get Patient Report Use Case
- Compact User Response Dto
- Medication Summary Response Dto
- Auth Repository
- Account Binding
- Doctor Home Controller
- Login Controller
- Patient Detail History Controller
- User Home Controller
- Main Production
- Main Development
- Reminder Care Task Request
- Detail Reminder Care Task Response Dto
- Reminder Care Tasks Response Dto
- Consultation Model
- Main Staging
- Patient Local Dto
- Patient Summary Local Dto
- Reminder Calendar Local Provider
- Diagnosis Request
- Compact Consultation Response Dto
- Compact Information Response Dto
- Compact Profile Response Dto
- Consultation Request Response Dto
- Consultation Response Dto
- Patient Response Dto
- Recent Visitor Response Dto
- Visitor Rejection Response Dto
- Compact User Model
- Reminder Calendar Repository
- Doctor Wrapper Controller
- Reminder Calendar Use Cases
- Default Constant
- Pagination Information Common
- Resource Common
- Claims Token Service
- Reminder Calendar Repository Impl
- Response Wrapper Common
- Pagination Response Dto
- Volunteer Item Response Dto
- Patient Detail History Model
- Reminder Care Task Model
- Screening Score Model
- Assessment Result Controller
- Session Data Model
- Accordion Account Linked Widget 2
- Patient Wrapper Controller
- Volunteer Wrapper Controller
- Refresh Api Client
- Reminder Care Task Repository Impl
- Assign Visit Request
- Change Pin Request
- Create Pin Request
- Daily Report Response Dto
- Diagnosis Use Cases Injection
- Patient Summary Model
- Validators
- Account Setting Binding
- Add Edit Reminder Care Task Binding
- Assessment Result Binding
- Patient Local Provider
- Login Request
- Reject Visit Request
- Volunteer Response Dto
- Reminder Calendar Use Cases Injection
- Reminder Care Task Use Cases Injection
- Circle Photo Profile
- Login Use Case
- Effect Theme
- Otp Phone Request
- Consultation Status Model
- Date Time Utils
- Basic App Bar
- Injection
- Doctor Diagnosis Model
- Medication Summary Model
- Patient Item Summary Model
- Role Model
- Reminder Care Task Repository
- Add Visit Request Binding
- Assessment Question Binding
- Caregiver Wrapper Binding
- Consultation Binding
- Consultation Request Detail Binding
- Create Patient Binding
- Create Pin Binding
- Detail Consultation Binding
- Diagnosis Form Binding
- Doctor Home Binding
- Doctor Wrapper Binding
- Guest Wrapper Binding
- Input Profile Binding
- Login Binding
- Otp Verification Binding
- Patient Binding
- Patient Detail History Binding
- Patient History Binding
- Patient Wrapper Binding
- Register Binding
- Reminder Care Task Binding
- Reminder Care Task List Patient Binding
- Report Daily Binding
- Report Daily Patient Binding
- Report Daily Patient Detail Binding
- Report Visit Binding
- Update Pin Binding
- User Home Binding
- Visit Binding
- Visit Detail Binding
- Visit Schedule Form Binding
- Volunteer Home Binding
- Volunteer Wrapper Binding
- Animated Bottom Navigation Bar Item
- Card Full Information
- Auth Middleware
- Consultation Type Model
- Gender Model
- Medicine Condition Model
- Pemuput Upacara Model
- Screening Answer Model
- Screening Question Model
- Self Care Model
- Visit Result Status Model
- Get Session Data Use Cases
- Ui Feedback Utils
- List Item
- Network Content Type
- Education Model
- Marital Model
- Religion Model
- Logout Use Case
- Report Visit Settings
- Chip Tag Consultation Item
- Screening Repository
- String Utils
- Accordion Account Linked Item
- Reminder Care Task Settings

## God Nodes (most connected - your core abstractions)
1. `AuthUseCases` - 29 edges
2. `_` - 13 edges
3. `AuthRepository` - 13 edges
4. `ConsultationUseCases` - 13 edges
5. `PatientUseCases` - 11 edges
6. `Role` - 9 edges
7. `ClaimsTokenService` - 8 edges
8. `ConsultationRepository` - 8 edges
9. `Comunication` - 7 edges
10. `Gender` - 7 edges

## Surprising Connections (you probably didn't know these)
- `AuthRepositoryImpl` --implements--> `AuthRepository`  [EXTRACTED]
  app/data/repository/auth_repository_impl.dart → app/domain/repository/auth_repository.dart
- `ConsultationRepositoryImpl` --implements--> `ConsultationRepository`  [EXTRACTED]
  app/data/repository/consultation_repository_impl.dart → app/domain/repository/consultation_repository.dart
- `DailyReportRepositoryImpl` --implements--> `DailyReportRepository`  [EXTRACTED]
  app/data/repository/daily_report_repository_impl.dart → app/domain/repository/daily_report_repository.dart
- `PatientRepositoryImpl` --implements--> `PatientRepository`  [EXTRACTED]
  app/data/repository/patient_repository_impl.dart → app/domain/repository/patient_repository.dart
- `ProfileRepositoryImpl` --inherits--> `ProfileRepository`  [EXTRACTED]
  app/data/repository/profile_repository_impl.dart → app/domain/repository/profile_repository.dart

## Import Cycles
- None detected.

## Communities (231 total, 4 thin omitted)

### Community 0 - "App Routes"
Cohesion: 0.02
Nodes (123): AppPages, routes, INITIAL, Routes, ../modules/account/bindings/account_binding.dart, ../modules/account_setting/bindings/account_setting_binding.dart, ../modules/account_setting/views/account_setting_view.dart, ../modules/account/views/account_view.dart (+115 more)

### Community 1 - "Basic Dialog"
Cohesion: 0.04
Nodes (74): build, CardAccountAuthentication, build, CardAccountLinked, isAddCard, role, title, build (+66 more)

### Community 2 - "Report Daily Controller"
Cohesion: 0.03
Nodes (68): addReportStatus, afterSleepConditionController, afterSleepConditionErrorText, _authUseCases, autoanamnesisController, ceremonyNameController, comunicationController, comunicationErrorText (+60 more)

### Community 3 - "Color Theme"
Cohesion: 0.03
Nodes (64): COBALT_200, COBALT_300, COBALT_400, COBALT_500, COBALT_600, COBALT_700, COBALT_800, ColorTheme (+56 more)

### Community 4 - "Report Visit Controller"
Cohesion: 0.03
Nodes (63): addReportStatus, afterSleepConditionController, afterSleepConditionErrorText, _authUseCases, autoanamnesisController, ceremonyNameController, comunicationController, comunicationErrorText (+55 more)

### Community 5 - "Assessment Result View"
Cohesion: 0.10
Nodes (41): Education, Marital, Patient, Religion, build, build, build, build (+33 more)

### Community 6 - "Dummy Constant"
Cohesion: 0.06
Nodes (44): ../../add_edit_reminder_care_task/settings/add_edit_reminder_care_task_settings.dart, Dummy, photoProfile, build, build, build, build, build (+36 more)

### Community 7 - "Update Pin Controller"
Cohesion: 0.05
Nodes (43): DailyReportUseCasesInjection, inject, DailyReportUseCases, getPatientReportUseCase, markdownPatientDailyReportUseCase, reportDailyUseCase, ReportDailyUseCase, _authUseCases (+35 more)

### Community 8 - "Consultation Detail Response Dto"
Cohesion: 0.05
Nodes (44): caregiver, ConsultationDetailResponseDto, ConsultationDetailResponseDtoConversion, consultationDetailResponseDtoFromJson, consultationDetailResponseDtoToJson, consultationRequest, currentVisit, doctorDiagnosis (+36 more)

### Community 9 - "Profile Provider"
Cohesion: 0.06
Nodes (40): DailyReportProvider, _dio, getDailyReports, reportDaily, createDiagnosis, _dio, createPatientOnCaregiver, _dio (+32 more)

### Community 10 - "Input Profile Controller"
Cohesion: 0.05
Nodes (43): addressController, _authUseCases, currentProfileData, dateTimeController, educationController, educationErrorText, emailController, formKey (+35 more)

### Community 11 - "Consultation Repository Impl"
Cohesion: 0.06
Nodes (36): _consultationProvider, ConsultationRepositoryImpl, createRequestConsultation, getCompactConsultationDetail, getConsultation, getConsultationDetail, _syncProviderData, ConsultationProvider (+28 more)

### Community 12 - "Visit Schedule Form Controller"
Cohesion: 0.05
Nodes (34): inject, VolunteerUseCasesInjection, name, reason, time, VisitorRejection, id, name (+26 more)

### Community 13 - "Visit Provider"
Cohesion: 0.08
Nodes (31): _dailyReportProvider, getDailyReports, reportDaily, acceptVolunteerVisit, assignVolunteer, rejectVolunteerVisit, reportVolunteer, _visitProvider (+23 more)

### Community 14 - "Account Setting View"
Cohesion: 0.10
Nodes (26): build, build, build, build, build, build, build, build (+18 more)

### Community 15 - "Patient Item Response Dto"
Cohesion: 0.06
Nodes (30): fromJson, id, name, PatientItemResponseDto, PatientItemResponseDtoConversion, patientItemResponseDtoFromJson, patientItemResponseDtoToJson, summary (+22 more)

### Community 16 - "Create Patient Controller"
Cohesion: 0.06
Nodes (32): addressController, dateTimeController, educationController, educationErrorText, emailController, formKey, fullnameController, genderController (+24 more)

### Community 17 - "Update Profile Use Case"
Cohesion: 0.08
Nodes (27): PatientRepositoryImpl, createPatientOnCaregiver, getPatient, getPatientDetail, PatientRepository, execute, _patientRepository, execute (+19 more)

### Community 18 - "Visit Use Cases"
Cohesion: 0.09
Nodes (26): VisitRepositoryImpl, inject, VisitUseCasesInjection, VisitRepository, AcceptVisitUseCase, execute, _visitRepository, AssignVolunteerUseCase (+18 more)

### Community 19 - "Patient History Controller"
Cohesion: 0.06
Nodes (29): _authUseCases, changeIndexTab, _claimsTokenService, consultation, _consultationUseCases, getConsultation, isMedication, isMedicationTemp (+21 more)

### Community 20 - "Diagnosis Repository Impl"
Cohesion: 0.09
Nodes (24): createDiagnosis, _diagnosisProvider, DiagnosisRepositoryImpl, DiagnosisProvider, createDiagnosis, DiagnosisRepository, getVolunteer, _consultationRepository (+16 more)

### Community 21 - "Otp Verification Controller"
Cohesion: 0.07
Nodes (28): _authUseCases, count, duration, isCanVerification, isUserCanResend, onChangedOtpValue, onClose, onInit (+20 more)

### Community 22 - "Auth Repository Impl"
Cohesion: 0.08
Nodes (27): _authProvider, changePin, _claimsTokenService, createPin, forgetPassword, getSessionData, getSessionStatus, login (+19 more)

### Community 23 - "Visit Report Local Dto"
Cohesion: 0.07
Nodes (27): afterSleepConditionId, autoanamnesis, ceremonyName, communicationId, cooperation, diseaseHistory, doingCeremony, familyHistory (+19 more)

### Community 24 - "Detail Consultation Controller"
Cohesion: 0.09
Nodes (24): ConsultationUseCasesInjection, inject, ConsultationUseCases, createRequestConsultationUseCase, getCompactConsultationDetailUseCase, getConsultationDetailUseCase, getConsultationUseCase, getHomeConsultation (+16 more)

### Community 25 - "Add Edit Reminder Care Task Controller"
Cohesion: 0.08
Nodes (25): addEditReminderCalendarSettings, addEditReminderCareTaskState, dateTimeEndController, dateTimeStartController, descriptionController, formKey, frequencyPerDayController, getPatient (+17 more)

### Community 26 - "Reminder Care Task List Patient Controller"
Cohesion: 0.08
Nodes (24): _authUseCases, getPatient, isAgeGreaterThan50, isAgeGreaterThan50Temp, isFemale, isFemaleTemp, isMale, isMaleTemp (+16 more)

### Community 27 - "Report Daily Patient Controller"
Cohesion: 0.08
Nodes (24): _authUseCases, getPatient, isAgeGreaterThan50, isAgeGreaterThan50Temp, isFemale, isFemaleTemp, isMale, isMaleTemp (+16 more)

### Community 28 - "Create Pin Use Case"
Cohesion: 0.10
Nodes (19): AuthRepositoryImpl, AuthRepository, _authRepository, CreatePinUseCase, execute, _authRepository, execute, GetSessionStatusUseCase (+11 more)

### Community 29 - "Patient Controller"
Cohesion: 0.08
Nodes (23): _authUseCases, getPatient, isAgeGreaterThan50, isAgeGreaterThan50Temp, isFemale, isFemaleTemp, isMale, isMaleTemp (+15 more)

### Community 30 - "Visit Result Model"
Cohesion: 0.09
Nodes (21): after_sleep_condition.dart, AfterSleepCondition, getAfterSleepConditionFromId, normal, afterSleepCondition, ceremonyName, communication, doingCeremony (+13 more)

### Community 31 - "Daily Report Item Response Dto"
Cohesion: 0.09
Nodes (22): afterSleepConditionId, ceremonyName, communicationId, DailyReportItemResponseDto, DailyReportItemResponseDtoConversion, doingCeremony, fromJson, images (+14 more)

### Community 32 - "Add Visit Request Controller"
Cohesion: 0.09
Nodes (22): addConsultationState, _consultationUseCases, formKey, getImages, getPatient, onAddConsultation, onAddPicture, onChangeSelectedPatient (+14 more)

### Community 33 - "Consultation Controller"
Cohesion: 0.09
Nodes (22): _authUseCases, changeIndexTab, consultation, _consultationUseCases, getConsultation, isAgeGreaterThan50, isAgeGreaterThan50Temp, isFirstConsultation (+14 more)

### Community 34 - "Repository Injection"
Cohesion: 0.10
Nodes (20): VolunteerRepositoryImpl, inject, RepositoryInjection, VolunteerRepository, execute, _volunteerRepository, ../data/repository/daily_report_repository_impl.dart, ../data/repository/reminder_calendar_repository_impl.dart (+12 more)

### Community 35 - "Visit Result Response Dto"
Cohesion: 0.10
Nodes (21): afterSleepConditionId, ceremonyName, communicationId, doingCeremony, fromJson, images, medicineConditionId, observation (+13 more)

### Community 36 - "Profile Use Cases"
Cohesion: 0.12
Nodes (19): inject, ProfileUseCasesInjection, CreateProfileUseCase, execute, GetProfileUseCase, _profileRepository, createProfileUseCase, getCompactProfileUseCase (+11 more)

### Community 37 - "Visit Repository"
Cohesion: 0.15
Nodes (18): getDailyReports, reportDaily, acceptVolunteerVisit, assignVolunteer, rejectVolunteerVisit, reportVolunteer, _dailyReportRepository, execute (+10 more)

### Community 38 - "Visit Controller"
Cohesion: 0.09
Nodes (21): _authUseCases, changeIndexTab, consultation, _consultationUseCases, getConsultation, isAgeGreaterThan50, isAgeGreaterThan50Temp, isFirstConsultation (+13 more)

### Community 39 - "Volunteer Home Controller"
Cohesion: 0.10
Nodes (18): ErrorType, errorType, Failure, message, _authUseCases, _consultationUseCases, onClose, onGetProfileData (+10 more)

### Community 40 - "Notification Utils"
Cohesion: 0.10
Nodes (20): _box, CHANNEL_DESCRIPTION, CHANNEL_ID, CHANNEL_IMPORTANCE, CHANNEL_TITLE, dipose, _flutterLocalNotificationsPlugin, getNotificationStatus (+12 more)

### Community 41 - "Api Url"
Cohesion: 0.10
Nodes (20): ApiUrl, baseUrl, changePin, consultation, createPin, dailyReport, diagnosis, forgetPassword (+12 more)

### Community 42 - "Text Style Theme"
Cohesion: 0.10
Nodes (20): BODY_1, BODY_2, HEADING_1, HEADING_2, HEADING_3, HEADING_4, LABEL_1, LABEL_2 (+12 more)

### Community 43 - "Patient Repository Impl"
Cohesion: 0.11
Nodes (19): createPatientOnCaregiver, _getCachedPatients, getPatient, getPatientDetail, _patientLocalProvider, _patientProvider, createProfile, getCompactProfile (+11 more)

### Community 44 - "Verify Otp Request"
Cohesion: 0.10
Nodes (17): ResponseError, responseErrorFromJson, responseErrorToJson, AcceptVisitRequestDto, acceptVisitRequestDtoFromJson, acceptVisitRequestDtoToJson, fromJson, otp (+9 more)

### Community 45 - "Transaction Otp Response Dto"
Cohesion: 0.10
Nodes (17): fromJson, toJson, toTransactionOtp, transactionId, TransactionOtpResponseDto, TransactionOtpResponseDtoConversion, transactionOtpResponseDtoFromJson, transactionOtpResponseDtoToJson (+9 more)

### Community 46 - "Daily Report Item Model"
Cohesion: 0.10
Nodes (19): Comunication, disconected, getComunicationFromId, afterSleepCondition, ceremonyName, communication, DailyReportItem, doingCeremony (+11 more)

### Community 47 - "Create Profile Use Case"
Cohesion: 0.11
Nodes (18): _createDio, _dio, DioClient, _refreshClient, _tokenManager, _authRepository, _claimsTokenService, execute (+10 more)

### Community 48 - "Profile Response Dto"
Cohesion: 0.11
Nodes (19): address, birthday, email, fromJson, fullname, gender, job, lastEducationId (+11 more)

### Community 49 - "Auth Use Cases"
Cohesion: 0.14
Nodes (18): AuthUseCasesInjection, inject, createPinUseCase, getSessionDataUseCases, getSessionStatusUseCase, loginUseCase, logoutUseCase, registerUseCase (+10 more)

### Community 50 - "Account Controller"
Cohesion: 0.10
Nodes (19): _authUseCases, compactUser, _dailyReportUseCases, getAppInfo, _launchUrl, onClose, onCopyDailyReport, onGetProfileData (+11 more)

### Community 51 - "Visit Detail Controller"
Cohesion: 0.10
Nodes (18): acceptVisitStatus, _authUseCases, _consultationUseCases, onAcceptVisit, onClose, onGetVisitData, onInit, onReady (+10 more)

### Community 52 - "Caregiver Wrapper Controller"
Cohesion: 0.12
Nodes (17): ../../account/views/account_view.dart, activeIndex, autoSizeGroup, onChangeTab, onClose, onInit, onReady, selectedItemRole (+9 more)

### Community 53 - "Profile Request"
Cohesion: 0.11
Nodes (18): address, birthday, email, fromJson, fullname, gender, job, lastEducationId (+10 more)

### Community 54 - "Refresh Token Request"
Cohesion: 0.11
Nodes (15): fromJson, refreshToken, RefreshTokenRequest, refreshTokenRequestFromJson, refreshTokenRequestToJson, toJson, CurrentVisit, visitId (+7 more)

### Community 55 - "Consultation Item Response Dto"
Cohesion: 0.11
Nodes (18): address, ConsultationItemResponseDto, ConsultationItemResponseDtoConversion, consultationItemResponseDtoFromJson, consultationItemResponseDtoToJson, description, fromJson, id (+10 more)

### Community 56 - "Consultation Detail Model"
Cohesion: 0.11
Nodes (17): caregiver, ConsultationDetail, consultationRequest, currentVisit, doctorDiagnosis, patient, recentVisitors, state (+9 more)

### Community 57 - "Spacing Theme"
Cohesion: 0.11
Nodes (17): SPACING_1, SPACING_10, SPACING_11, SPACING_12, SPACING_13, SPACING_14, SPACING_15, SPACING_2 (+9 more)

### Community 58 - "Add Consultation Controller"
Cohesion: 0.11
Nodes (17): addConsultationState, _authUseCases, _consultationUseCases, formKey, getImages, onAddConsultation, onAddPicture, onClearPicture (+9 more)

### Community 59 - "Diagnosis Form Controller"
Cohesion: 0.11
Nodes (16): _authUseCases, diagnosisController, diagnosisFormSettings, diagnosisStatus, _diagnosisUseCases, formKey, medicationController, notesController (+8 more)

### Community 60 - "Card Consultation"
Cohesion: 0.11
Nodes (16): backgroundColor, body, build, CardFeature, foregroundColor, imageAssetPath, title, body (+8 more)

### Community 61 - "Const Path Constant"
Cohesion: 0.12
Nodes (16): AVATAR_DEFAULT_PATH, BACKGROUND_AUTHENTICATION_PROFILE_PATH, BACKGROUND_HEADER_PATH, CARD_ILLUSTRATION_CHECK_MENTAL_CONDITION_PATH, CARD_ILLUSTRATION_CONSULTATION_PATH, CARD_ILLUSTRATION_DAILY_REPORT_PATH, ConstPath, DEVELOPMENT_PATH (+8 more)

### Community 62 - "Add Reminder Calendar Use Case"
Cohesion: 0.15
Nodes (14): ReminderCalendarRepositoryImpl, ReminderCalendarRepository, AddReminderCalendarUseCase, execute, reminderCalendarRepository, DeleteReminderCalendarUseCase, execute, reminderCalendarRepository (+6 more)

### Community 63 - "Create Patient Request"
Cohesion: 0.12
Nodes (16): address, birthday, CreatePatientRequest, createPatientRequestFromJson, createPatientRequestToJson, email, fromJson, fullname (+8 more)

### Community 64 - "Compact Consultation Detail Response Dto"
Cohesion: 0.12
Nodes (16): CompactConsultationDetailDtoConversion, CompactConsultationDetailResponseDto, compactConsultationDetailResponseDtoFromJson, compactConsultationDetailResponseDtoToJson, diagnosis, fromJson, medication, observation (+8 more)

### Community 65 - "Compact Consultation Detail Model"
Cohesion: 0.12
Nodes (15): CompactConsultation, compactConsultationDetail, consultationId, date, CompactConsultationDetail, diagnosis, medication, observation (+7 more)

### Community 66 - "Reminder Care Task Detail"
Cohesion: 0.12
Nodes (14): ConsultationRequestData, image, startDate, symptom, date, name, RecentVisitor, date (+6 more)

### Community 67 - "Account Setting Controller"
Cohesion: 0.12
Nodes (15): AuthUseCases, _authUseCases, getProfile, onClose, onInit, onReady, profile, _profileUseCases (+7 more)

### Community 68 - "Animated Progress Bar"
Cohesion: 0.12
Nodes (16): _anim, build, _controller, createState, curve, didUpdateWidget, dispose, duration (+8 more)

### Community 69 - "App Config"
Cohesion: 0.13
Nodes (13): AppConfig, Environment, staging, dependencies, SplashScreenBinding, SplashScreenController, build, SplashScreenView (+5 more)

### Community 70 - "Calendar Reminder Local Dto"
Cohesion: 0.13
Nodes (15): calendarReminderDtoFromJson, calendarReminderDtoToJson, CalendarReminderLocalDto, CalendarReminderLocalDtoExtension, dateTime, description, fromJson, id (+7 more)

### Community 71 - "Token Provider"
Cohesion: 0.12
Nodes (15): _accessTokenKey, _claimsTokenService, clearAll, getAccessToken, getRefreshToken, _instance, _refreshTokenKey, saveAccessToken (+7 more)

### Community 72 - "Patient Detail History Response Dto"
Cohesion: 0.13
Nodes (15): autoanamnesis, cooperation, diseaseHistory, familyHistory, fromJson, heteroanamnesis, mainDisease, medicationHistory (+7 more)

### Community 73 - "Assessment Question Controller"
Cohesion: 0.12
Nodes (15): answers, currentQuestion, getCurrentAnswer, getInitialization, onBackQuestion, onChangeSelectedAnswerIndex, onClose, onInit (+7 more)

### Community 74 - "Create Pin Controller"
Cohesion: 0.12
Nodes (15): _authUseCases, createPinSettings, formKey, isLoading, isPinRepeatVisible, isPinVisible, onChangePinRepeatVisibility, onChangePinVisibility (+7 more)

### Community 75 - "Accordion Account Linked Widget"
Cohesion: 0.13
Nodes (14): Animation, _arrowTurns, build, _controller, createState, dispose, _expand, initState (+6 more)

### Community 76 - "Provider Injection"
Cohesion: 0.15
Nodes (13): @pragma, syncServiceStart, inject, ProviderInjection, ../data/source/local/provider/patient_local_provider.dart, ../data/source/local/provider/reminder_calendar_local_provider.dart, ../data/source/remote/provider/reminder_calendar_provider.dart, ../data/source/remote/provider/reminder_care_task_provider.dart (+5 more)

### Community 77 - "Profile Repository"
Cohesion: 0.14
Nodes (13): ProfileRepositoryImpl, createProfile, getCompactProfile, getProfile, ProfileRepository, updateProfile, execute, GetCompactProfileUseCase (+5 more)

### Community 78 - "Create Reminder Care Task Use Case"
Cohesion: 0.15
Nodes (12): ReminderCareTaskRepositoryImpl, ReminderCareTaskRepository, CreateReminderCareTaskUseCase, execute, _reminderCareTaskRepository, DeleteReminderCareTaskUseCase, execute, _reminderCareTaskRepository (+4 more)

### Community 79 - "Screening Repository Impl"
Cohesion: 0.16
Nodes (12): getQuestion, _screeningProvider, ScreeningRepositoryImpl, getQuestion, ScreeningProvider, ScreeningRepository, execute, GetQuestionUseCase (+4 more)

### Community 80 - "Sync Provider Data"
Cohesion: 0.13
Nodes (14): addConsultationDetailData, addConsultationStateData, addVisitReportData, _consultationBox, _consultationDetailBox, getLocalConsultation, getLocalDetailConsultation, getVisitReport (+6 more)

### Community 81 - "Patient Detail Response Dto"
Cohesion: 0.14
Nodes (14): caregiver, consultations, fromJson, patient, PatientDetailResponseDto, PatientDetailResponseDtoConversion, patientDetailResponseDtoFromJson, patientDetailResponseDtoToJson (+6 more)

### Community 82 - "Calendar Reminder Model"
Cohesion: 0.13
Nodes (13): CalendarReminder, dateTime, description, id, isDoneDateTime, isSynced, repeatInterval, title (+5 more)

### Community 83 - "Reminder Care Task Use Cases"
Cohesion: 0.13
Nodes (13): execute, GetReminderCareTaskUseCase, _reminderCareTaskRepository, createReminderCareTaskUseCase, deleteReminderCareTaskUseCase, getReminderCareTasksUseCase, markAsDoneReminderCareTaskUseCase, ReminderCareTaskUseCases (+5 more)

### Community 84 - "Consultation Request Detail Controller"
Cohesion: 0.13
Nodes (13): _authUseCases, consultationDetail, consultationRequestDetailSettings, _consultationUseCases, onClose, onGetConsultationData, onGetSessionData, onInit (+5 more)

### Community 85 - "Reminder Care Task Controller"
Cohesion: 0.13
Nodes (14): arguments, _authUseCases, fetchReminderCareTask, initialize, markAsDoneReminderCareTask, markAsDoneReminderCareTaskState, onClose, onGetProfileData (+6 more)

### Community 86 - "Card Expanded Information"
Cohesion: 0.14
Nodes (13): AnimationController, _arrowTurns, build, _controller, createState, dispose, _expand, icon (+5 more)

### Community 87 - "Patient Summary Response Dto"
Cohesion: 0.15
Nodes (13): age, fromJson, gender, hasCaregiver, isContinuation, isFirstVisit, isVisitRejected, PatientSummaryResponseDto (+5 more)

### Community 88 - "Reminder Care Task Response Dto"
Cohesion: 0.15
Nodes (13): description, details, doctorId, frequencyPerDay, fromJson, id, patientId, ReminderCareTaskResponseDto (+5 more)

### Community 89 - "Patient Use Cases"
Cohesion: 0.21
Nodes (12): inject, PatientUseCasesInjection, CreatePatientUseCase, GetPatientDetailUseCase, GetPatientUseCase, createPatientUseCase, getPatientDetailUseCase, getPatientUseCase (+4 more)

### Community 90 - "Screening Use Cases"
Cohesion: 0.18
Nodes (11): inject, ScreeningUseCasesInjection, CalculateScreeningUseCase, execute, calculateScreeningUseCase, getQuestionUseCase, ScreeningUseCases, package:soul_doctor/app/domain/model/screening_score.dart (+3 more)

### Community 91 - "Use Cases Injection"
Cohesion: 0.14
Nodes (13): inject, UseCasesInjection, package:soul_doctor/app/di/use_case/auth_use_cases_injection.dart, package:soul_doctor/app/di/use_case/consultation_use_cases_injection.dart, package:soul_doctor/app/di/use_case/daily_report_use_cases_injection.dart, package:soul_doctor/app/di/use_case/diagnosis_use_cases_injection.dart, package:soul_doctor/app/di/use_case/patient_use_cases_injection.dart, package:soul_doctor/app/di/use_case/profile_use_cases_injection.dart (+5 more)

### Community 92 - "Patient Detail Model"
Cohesion: 0.14
Nodes (12): birthday, CompactInformation, fullname, nickname, caregiver, consultations, patient, PatientDetail (+4 more)

### Community 93 - "Profile Model"
Cohesion: 0.14
Nodes (13): address, birthday, defaultObj, email, fullname, gender, job, lastEducationId (+5 more)

### Community 94 - "Get Patient Report Use Case"
Cohesion: 0.18
Nodes (11): DailyReportRepositoryImpl, DailyReportRepository, _dailyReportRepository, execute, GetPatientReportUseCase, _dailyReportRepository, execute, MarkdownPatientDailyReportUseCase (+3 more)

### Community 95 - "Compact User Response Dto"
Cohesion: 0.17
Nodes (12): caregiver, CompactUserResponseDto, CompactUserResponseDtoConversion, compactUserResponseDtoFromJson, compactUserResponseDtoToJson, fromJson, fullname, patients (+4 more)

### Community 96 - "Medication Summary Response Dto"
Cohesion: 0.17
Nodes (12): fromJson, medication, MedicationSummaryResponseDto, MedicationSummaryResponseDtoConversion, medicationSummaryResponseDtoFromJson, medicationSummaryResponseDtoToJson, therapy, toJson (+4 more)

### Community 97 - "Auth Repository"
Cohesion: 0.15
Nodes (12): changePin, createPin, forgetPassword, getSessionData, getSessionStatus, login, logout, onSaveToken (+4 more)

### Community 98 - "Account Binding"
Cohesion: 0.17
Nodes (11): AccountBinding, dependencies, AccountController, AccountView, build, ../controllers/account_controller.dart, package:soul_doctor/app/modules/account/widgets/accordion_account_linked.dart, package:soul_doctor/app/modules/account/widgets/accordion_account_linked_item.dart (+3 more)

### Community 99 - "Doctor Home Controller"
Cohesion: 0.15
Nodes (12): _authUseCases, consultation, _consultationUseCases, doctorWrapperController, onClose, onGetProfileData, onGetRecentConsultation, onInit (+4 more)

### Community 100 - "Login Controller"
Cohesion: 0.15
Nodes (12): _authUseCases, emailController, formKey, isPinVisible, loginStatus, onChangePinVisibility, onClose, onInit (+4 more)

### Community 101 - "Patient Detail History Controller"
Cohesion: 0.15
Nodes (11): onClose, onGetPatientDetailData, onInit, onReady, patientDataStatus, patientDetailHistorySettings, _patientUseCases, PatientDetailHistorySettings (+3 more)

### Community 102 - "User Home Controller"
Cohesion: 0.15
Nodes (12): _authUseCases, _claimsTokenService, consultation, _consultationUseCases, getConsultationData, getSessionStatus, onClose, onInit (+4 more)

### Community 103 - "Main Production"
Cohesion: 0.17
Nodes (11): app/core/infrastructure/config/app_config.dart, app/di/injection.dart, appDocumentDirectory, config, init, initializeDateFormatting, load, main (+3 more)

### Community 104 - "Main Development"
Cohesion: 0.17
Nodes (11): app/core/infrastructure/sync/sync_service.dart, appDocumentDirectory, config, init, initializeDateFormatting, load, main, null (+3 more)

### Community 105 - "Reminder Care Task Request"
Cohesion: 0.17
Nodes (11): description, endDate, frequencyPerDay, fromJson, patientId, ReminderCareTaskRequest, reminderCareTaskRequestFromJson, reminderCareTaskRequestToJson (+3 more)

### Community 106 - "Detail Reminder Care Task Response Dto"
Cohesion: 0.18
Nodes (11): date, DetailReminderCareTaskResponseDto, DetailReminderCareTaskResponseDtoConversion, fromJson, id, isDone, order, taskReminderId (+3 more)

### Community 107 - "Reminder Care Tasks Response Dto"
Cohesion: 0.18
Nodes (11): fromJson, reminderCareTaskResponseDtoFromJson, reminderCareTaskResponseDtoToJson, ReminderCareTasksResponseDto, ReminderCareTasksResponseDtoConversion, reminders, toJson, toListReminderCareTask (+3 more)

### Community 108 - "Consultation Model"
Cohesion: 0.17
Nodes (11): address, Consultation, type, description, id, medicationSummary, name, patientSummary (+3 more)

### Community 109 - "Main Staging"
Cohesion: 0.17
Nodes (11): appDocumentDirectory, config, init, initializeDateFormatting, load, main, null, openBox (+3 more)

### Community 110 - "Patient Local Dto"
Cohesion: 0.20
Nodes (10): fromJson, id, name, PatientLocalDto, PatientLocalDtoConversion, summary, toJson, toPatientItemResponseDto (+2 more)

### Community 111 - "Patient Summary Local Dto"
Cohesion: 0.20
Nodes (10): age, fromJson, gender, hasCaregiver, PatientSummaryLocalDto, PatientSummaryLocalDtoConversion, toJson, toPatientItemSummaryResponseDto (+2 more)

### Community 112 - "Reminder Calendar Local Provider"
Cohesion: 0.18
Nodes (10): addReminderCalendarData, _consultationBox, deleteReminderCalendarData, getAllReminderCalendarData, _instance, ReminderCalendarLocalProvider, updateReminderCalendarData, ../dto/calendar_reminder_local_dto.dart (+2 more)

### Community 113 - "Diagnosis Request"
Cohesion: 0.18
Nodes (10): consultationId, diagnosis, DiagnosisRequest, diagnosisRequestFromJson, diagnosisRequestToJson, fromJson, medication, note (+2 more)

### Community 114 - "Compact Consultation Response Dto"
Cohesion: 0.20
Nodes (10): compactConsultationDetailResponseDto, CompactConsultationResponseDto, CompactConsultationResponseDtoConversion, consultationId, date, fromJson, patientDetailCompactConsultationResponseDtoFromJson, patientDetailCompactConsultationResponseDtoToJson (+2 more)

### Community 115 - "Compact Information Response Dto"
Cohesion: 0.20
Nodes (10): birthday, CompactInformationResponseDto, CompactInformationResponseDtoConversion, compactInformationResponseDtoFromJson, compactInformationResponseDtoToJson, fromJson, fullname, nickname (+2 more)

### Community 116 - "Compact Profile Response Dto"
Cohesion: 0.20
Nodes (10): caregiverResponseDtoFromJson, caregiverResponseDtoToJson, CompactProfileResponseDto, CompactProfileResponseDtoConversion, fromJson, id, name, toCompactProfile (+2 more)

### Community 117 - "Consultation Request Response Dto"
Cohesion: 0.20
Nodes (10): ConsultationRequestResonseDtoConversion, ConsultationRequestResponseDto, consultationRequestResponseDtoFromJson, consultationRequestResponseDtoToJson, fromJson, image, startDate, symptom (+2 more)

### Community 118 - "Consultation Response Dto"
Cohesion: 0.20
Nodes (10): ConsultationResponseDto, ConsultationResponseDtoConversion, consultationResponseDtoFromJson, consultationResponseDtoToJson, consultations, fromJson, pagination, toConsultationPaging (+2 more)

### Community 119 - "Patient Response Dto"
Cohesion: 0.20
Nodes (10): fromJson, pagination, PatientResponseDto, PatientResponseDtoConversion, patientResponseDtoFromJson, patientResponseDtoToJson, patients, toJson (+2 more)

### Community 120 - "Recent Visitor Response Dto"
Cohesion: 0.20
Nodes (10): date, fromJson, name, RecentVisitorResponseDto, RecentVisitorResponseDtoConversion, recentVisitorResponseDtoFromJson, recentVisitorResponseDtoToJson, toJson (+2 more)

### Community 121 - "Visitor Rejection Response Dto"
Cohesion: 0.20
Nodes (10): fromJson, name, reason, time, toJson, toVisitorRejection, VisitorRejectionResponseDto, VisitorRejectionResponseDtoConversion (+2 more)

### Community 122 - "Compact User Model"
Cohesion: 0.18
Nodes (9): CompactProfile, id, name, caregiver, CompactUser, fullname, patients, role (+1 more)

### Community 123 - "Reminder Calendar Repository"
Cohesion: 0.18
Nodes (9): addReminderCalendar, deleteReminderCalendar, getAllReminderCalendar, updateReminderCalendar, execute, GetAllReminderCalendarUseCase, reminderCalendarRepository, ../../../data/source/local/dto/calendar_reminder_local_dto.dart (+1 more)

### Community 124 - "Doctor Wrapper Controller"
Cohesion: 0.18
Nodes (10): activeIndex, autoSizeGroup, onChangeTab, onClose, onInit, onReady, selectedItemRole, ../../consultation/views/consultation_view.dart (+2 more)

### Community 125 - "Reminder Calendar Use Cases"
Cohesion: 0.20
Nodes (9): add_reminder_calendar_use_case.dart, addReminderCalendarUseCase, deleteReminderCalendarUseCase, getAllReminderCalendarUseCase, ReminderCalendarUseCases, updateReminderCalendarUseCase, delete_reminder_calendar_use_case.dart, get_all_reminder_calendar_use_case.dart (+1 more)

### Community 126 - "Default Constant"
Cohesion: 0.20
Nodes (9): Default, defaultBool, defaultDateTime, defaultInt, defaultString, static const bool, static const int, static const String (+1 more)

### Community 127 - "Pagination Information Common"
Cohesion: 0.20
Nodes (8): data, currentPage, defaultObj, PaginationInformation, totalPage, Pagination, paginationData, package:soul_doctor/app/common/pagination_information.dart

### Community 128 - "Resource Common"
Cohesion: 0.22
Nodes (10): _, data, empty, error, loading, message, none, Resource (+2 more)

### Community 129 - "Claims Token Service"
Cohesion: 0.20
Nodes (9): _box, _claimsKey, clearSessionData, getSessionData, _instance, saveSessionData, package:get_storage/get_storage.dart, static ClaimsTokenService get (+1 more)

### Community 130 - "Reminder Calendar Repository Impl"
Cohesion: 0.20
Nodes (9): addReminderCalendar, deleteReminderCalendar, getAllReminderCalendar, _reminderCalendarProvider, updateReminderCalendar, ../../../../domain/model/repeat_calendar_reminder.dart, ../domain/repository/reminder_calendar_repository.dart, package:soul_doctor/app/data/source/local/dto/calendar_reminder_local_dto.dart (+1 more)

### Community 131 - "Response Wrapper Common"
Cohesion: 0.20
Nodes (9): data, error, fromJson, message, ResponseWrapper, status, toJson, int? (+1 more)

### Community 132 - "Pagination Response Dto"
Cohesion: 0.22
Nodes (9): currentPage, fromJson, PaginationResponseDto, PaginationResponseDtoConversion, paginationResponseDtoFromJson, paginationResponseDtoToJson, toJson, toPaginationInformation (+1 more)

### Community 133 - "Volunteer Item Response Dto"
Cohesion: 0.22
Nodes (9): fromJson, id, name, toJson, toVolunteer, VolunteerItemResponseDto, VolunteerItemResponseDtoConversion, volunteerItemResponseDtoFromJson (+1 more)

### Community 134 - "Patient Detail History Model"
Cohesion: 0.20
Nodes (9): autoanamnesis, cooperation, diseaseHistory, familyHistory, heteroanamnesis, mainDisease, medicationHistory, PatientDetailHistory (+1 more)

### Community 135 - "Reminder Care Task Model"
Cohesion: 0.20
Nodes (9): description, details, doctorId, frequencyPerDay, id, patientId, ReminderCareTask, title (+1 more)

### Community 136 - "Screening Score Model"
Cohesion: 0.20
Nodes (9): anxiety, anxietyQuestion, depression, depressionQuestion, psychosis, psychosisQuestion, stress, stressQuestion (+1 more)

### Community 137 - "Assessment Result Controller"
Cohesion: 0.20
Nodes (9): ScreeningScore, body, imagePath, isGood, onClose, onInit, onReady, score (+1 more)

### Community 138 - "Session Data Model"
Cohesion: 0.20
Nodes (9): fromJson, fromToken, fullname, iat, id, nickname, role, SessionData (+1 more)

### Community 139 - "Accordion Account Linked Widget 2"
Cohesion: 0.27
Nodes (10): AccordionAccountLinked, _AccordionAccountLinkedState, CardExpandedInformation, _CardExpandedInformationState, AnimatedProgressBar, _AnimatedProgressBarState, SingleTickerProviderStateMixin, State (+2 more)

### Community 140 - "Patient Wrapper Controller"
Cohesion: 0.20
Nodes (9): activeIndex, autoSizeGroup, onChangeTab, onClose, onInit, onReady, selectedItemRole, package:soul_doctor/app/modules/user_home/views/user_home_view.dart (+1 more)

### Community 141 - "Volunteer Wrapper Controller"
Cohesion: 0.20
Nodes (9): activeIndex, autoSizeGroup, onChangeTab, onClose, onInit, onReady, selectedItemRole, ../../visit/views/visit_view.dart (+1 more)

### Community 142 - "Refresh Api Client"
Cohesion: 0.22
Nodes (8): _client, refresh, RefreshApiClient, ../../../data/source/remote/dto/common/response_wrapper.dart, ../../../data/source/remote/dto/response/auth_status_response_dto.dart, ../../network/api_url.dart, package:soul_doctor/app/core/network/network_content_type.dart, package:soul_doctor/app/data/source/remote/dto/request/refresh_token_request.dart

### Community 143 - "Reminder Care Task Repository Impl"
Cohesion: 0.22
Nodes (8): createReminderCareTask, deleteReminderCareTask, getReminderCareTask, markAsDoneReminderCareTask, _reminderCareTaskProvider, ../domain/repository/reminder_care_task_repository.dart, ../source/remote/dto/request/reminder_care_task_request.dart, ../source/remote/provider/reminder_care_task_provider.dart

### Community 144 - "Assign Visit Request"
Cohesion: 0.22
Nodes (8): AssignVisitRequest, consultationId, fromJson, note, toJson, visitRequestFromJson, visitRequestToJson, volunteerId

### Community 145 - "Change Pin Request"
Cohesion: 0.22
Nodes (8): ChangePinRequest, changePinRequestFromJson, changePinRequestToJson, fromJson, newPin, newPinRepeat, oldPin, toJson

### Community 146 - "Create Pin Request"
Cohesion: 0.22
Nodes (8): CreatePinRequest, createPinRequestFromJson, createPinRequestToJson, fromJson, pin, pinRepeat, toJson, transactionId

### Community 147 - "Daily Report Response Dto"
Cohesion: 0.22
Nodes (8): DailyReportResponseDto, dailyReportResponseDtoFromJson, dailyReportResponseDtoToJson, dailyReports, fromJson, pagination, toJson, package:soul_doctor/app/data/source/remote/dto/response/pagination_response_dto.dart

### Community 148 - "Diagnosis Use Cases Injection"
Cohesion: 0.28
Nodes (7): DiagnosisUseCasesInjection, inject, CreateDiagnosisUseCase, createDiagnosisUseCase, DiagnosisUseCases, package:soul_doctor/app/domain/use_case/diagnosis_use_cases/create_diagnosis_use_case.dart, package:soul_doctor/app/domain/use_case/diagnosis_use_cases/diagnosis_use_cases.dart

### Community 149 - "Patient Summary Model"
Cohesion: 0.22
Nodes (8): age, defaultObj, gender, hasCaregiver, isContinuation, isFirstVisit, isVisitRejected, PatientSummary

### Community 150 - "Validators"
Cohesion: 0.22
Nodes (8): onCheckDateAfter, onEmailValidation, onIntValidation, onNotEmptyValidation, onNumberValidation, onPinRepeatValidation, onPinValidation, Validators

### Community 151 - "Account Setting Binding"
Cohesion: 0.22
Nodes (7): AccountSettingBinding, dependencies, AddConsultationBinding, dependencies, Bindings, ../controllers/account_setting_controller.dart, ../controllers/add_consultation_controller.dart

### Community 152 - "Add Edit Reminder Care Task Binding"
Cohesion: 0.22
Nodes (8): AccountSettingController, AccountSettingView, AddEditReminderCareTaskBinding, dependencies, AddEditReminderCareTaskController, AddEditReminderCareTaskView, ../controllers/add_edit_reminder_care_task_controller.dart, GetView

### Community 153 - "Assessment Result Binding"
Cohesion: 0.22
Nodes (8): AddConsultationController, AddConsultationView, AssessmentResultBinding, dependencies, AssessmentResultController, AssessmentResultView, ../controllers/assessment_result_controller.dart, GetxController

### Community 154 - "Patient Local Provider"
Cohesion: 0.25
Nodes (7): addPatientData, getAllPatientData, _patientBox, PatientLocalProvider, Box, ../dto/patient_local_dto.dart, package:hive/hive.dart

### Community 155 - "Login Request"
Cohesion: 0.25
Nodes (7): email, fromJson, LoginRequest, loginRequestFromJson, loginRequestToJson, pin, toJson

### Community 156 - "Reject Visit Request"
Cohesion: 0.25
Nodes (7): fromJson, reason, RejectVisitRequest, rejectVisitRequestFromJson, rejectVisitRequestToJson, toJson, visitId

### Community 157 - "Volunteer Response Dto"
Cohesion: 0.25
Nodes (7): fromJson, pagination, toJson, VolunteerResponseDto, volunteerResponseDtoFromJson, volunteerResponseDtoToJson, volunteers

### Community 158 - "Reminder Calendar Use Cases Injection"
Cohesion: 0.25
Nodes (7): inject, ReminderCalendarUseCasesInjection, ../../domain/use_case/reminder_calendar_use_cases/add_reminder_calendar_use_case.dart, ../../domain/use_case/reminder_calendar_use_cases/delete_reminder_calendar_use_case.dart, ../../domain/use_case/reminder_calendar_use_cases/reminder_calendar_use_cases.dart, ../../domain/use_case/reminder_calendar_use_cases/update_reminder_calendar_use_case.dart, package:soul_doctor/app/domain/use_case/reminder_calendar_use_cases/get_all_reminder_calendar_use_case.dart

### Community 159 - "Reminder Care Task Use Cases Injection"
Cohesion: 0.25
Nodes (7): inject, ReminderCareTaskUseCasesInjection, ../../domain/use_case/reminder_care_task_use_cases/create_reminder_care_task_use_case.dart, ../../domain/use_case/reminder_care_task_use_cases/delete_reminder_care_task_use_case.dart, ../../../domain/use_case/reminder_care_task_use_cases/reminder_care_task_use_cases.dart, package:soul_doctor/app/domain/use_case/reminder_care_task_use_cases/get_reminder_care_task_use_case.dart, package:soul_doctor/app/domain/use_case/reminder_care_task_use_cases/mark_as_done_reminder_care_task_use_case.dart

### Community 160 - "Circle Photo Profile"
Cohesion: 0.25
Nodes (7): build, CirclePhotoProfile, height, image, width, double?, ImageProvider

### Community 161 - "Login Use Case"
Cohesion: 0.29
Nodes (6): ClaimsTokenService, _authRepository, _claimsTokenService, execute, LoginUseCase, package:soul_doctor/app/core/infrastructure/auth/claims_token_service.dart

### Community 162 - "Effect Theme"
Cohesion: 0.29
Nodes (6): EffectTheme, HARD_SHADOW, MEDIUM_SHADOW, SOFT_SHADOW, package:flutter/cupertino.dart, static final

### Community 163 - "Otp Phone Request"
Cohesion: 0.29
Nodes (6): email, fromJson, OtpEmailRequest, registerRequestFromJson, registerRequestToJson, toJson

### Community 164 - "Consultation Status Model"
Cohesion: 0.29
Nodes (6): completed, ConsultationStatus, getColor, getConsultationStatusById, getName, created,
  waitingVolunteer,
  scheduled,
  needDiagnosis,

### Community 165 - "Date Time Utils"
Cohesion: 0.29
Nodes (6): DateTimeUtils, dateToDayMonthYear, dateToHoursMinute, formatSecondsToTime, onlyDate, package:intl/intl.dart

### Community 166 - "Basic App Bar"
Cohesion: 0.29
Nodes (6): BasicAppBar, build, preferredSize, title, PreferredSizeWidget, Size get

### Community 167 - "Injection"
Cohesion: 0.33
Nodes (5): execute, Injection, provider_injection.dart, repository_injection.dart, use_case/use_cases_injection.dart

### Community 168 - "Doctor Diagnosis Model"
Cohesion: 0.33
Nodes (5): diagnosis, DoctorDiagnosis, medication, note, therapy

### Community 169 - "Medication Summary Model"
Cohesion: 0.33
Nodes (5): defaultObj, medication, MedicationSummary, therapy, visit

### Community 170 - "Patient Item Summary Model"
Cohesion: 0.33
Nodes (5): age, defaultObj, gender, hasCaregiver, package:soul_doctor/app/common/constant/default.dart

### Community 171 - "Role Model"
Cohesion: 0.33
Nodes (5): doctor, getRoleById, getRoleByName, Role, patient,
  caregiver,
  volunteer,

### Community 172 - "Reminder Care Task Repository"
Cohesion: 0.33
Nodes (5): createReminderCareTask, deleteReminderCareTask, getReminderCareTask, markAsDoneReminderCareTask, ../../data/source/remote/dto/response/reminder_care_tasks_response_dto.dart

### Community 173 - "Add Visit Request Binding"
Cohesion: 0.33
Nodes (5): AddVisitRequestBinding, dependencies, AddVisitRequestController, AddVisitRequestView, ../controllers/add_visit_request_controller.dart

### Community 174 - "Assessment Question Binding"
Cohesion: 0.33
Nodes (5): AssessmentQuestionBinding, dependencies, AssessmentQuestionController, AssessmentQuestionView, ../controllers/assessment_question_controller.dart

### Community 175 - "Caregiver Wrapper Binding"
Cohesion: 0.33
Nodes (5): CaregiverWrapperBinding, dependencies, CaregiverWrapperController, CaregiverWrapperView, ../controllers/caregiver_wrapper_controller.dart

### Community 176 - "Consultation Binding"
Cohesion: 0.33
Nodes (5): ConsultationBinding, dependencies, ConsultationController, ConsultationView, ../controllers/consultation_controller.dart

### Community 177 - "Consultation Request Detail Binding"
Cohesion: 0.33
Nodes (5): ConsultationRequestDetailBinding, dependencies, ConsultationRequestDetailController, ConsultationRequestDetailView, ../controllers/consultation_request_detail_controller.dart

### Community 178 - "Create Patient Binding"
Cohesion: 0.33
Nodes (5): CreatePatientBinding, dependencies, CreatePatientController, CreatePatientView, ../controllers/create_patient_controller.dart

### Community 179 - "Create Pin Binding"
Cohesion: 0.33
Nodes (5): CreatePinBinding, dependencies, CreatePinController, CreatePinView, ../controllers/create_pin_controller.dart

### Community 180 - "Detail Consultation Binding"
Cohesion: 0.33
Nodes (5): dependencies, DetailConsultationBinding, DetailConsultationController, DetailConsultationView, ../controllers/detail_consultation_controller.dart

### Community 181 - "Diagnosis Form Binding"
Cohesion: 0.33
Nodes (5): dependencies, DiagnosisFormBinding, DiagnosisFormController, DiagnosisFormView, ../controllers/diagnosis_form_controller.dart

### Community 182 - "Doctor Home Binding"
Cohesion: 0.33
Nodes (5): dependencies, DoctorHomeBinding, DoctorHomeController, DoctorHomeView, ../controllers/doctor_home_controller.dart

### Community 183 - "Doctor Wrapper Binding"
Cohesion: 0.33
Nodes (5): dependencies, DoctorWrapperBinding, DoctorWrapperController, DoctorWrapperView, ../controllers/doctor_wrapper_controller.dart

### Community 184 - "Guest Wrapper Binding"
Cohesion: 0.33
Nodes (5): dependencies, GuestWrapperBinding, GuestWrapperController, GuestWrapperView, ../controllers/guest_wrapper_controller.dart

### Community 185 - "Input Profile Binding"
Cohesion: 0.33
Nodes (5): dependencies, InputProfileBinding, InputProfileController, InputProfileView, ../controllers/input_profile_controller.dart

### Community 186 - "Login Binding"
Cohesion: 0.33
Nodes (5): dependencies, LoginBinding, LoginController, LoginView, ../controllers/login_controller.dart

### Community 187 - "Otp Verification Binding"
Cohesion: 0.33
Nodes (5): dependencies, OtpVerificationBinding, OtpVerificationController, OtpVerificationView, ../controllers/otp_verification_controller.dart

### Community 188 - "Patient Binding"
Cohesion: 0.33
Nodes (5): dependencies, PatientBinding, PatientController, PatientView, ../controllers/patient_controller.dart

### Community 189 - "Patient Detail History Binding"
Cohesion: 0.33
Nodes (5): dependencies, PatientDetailHistoryBinding, PatientDetailHistoryController, PatientDetailHistoryView, ../controllers/patient_detail_history_controller.dart

### Community 190 - "Patient History Binding"
Cohesion: 0.33
Nodes (5): dependencies, PatientHistoryBinding, PatientHistoryController, PatientHistoryView, ../controllers/patient_history_controller.dart

### Community 191 - "Patient Wrapper Binding"
Cohesion: 0.33
Nodes (5): dependencies, PatientWrapperBinding, PatientWrapperController, PatientWrapperView, ../controllers/patient_wrapper_controller.dart

### Community 192 - "Register Binding"
Cohesion: 0.33
Nodes (5): dependencies, RegisterBinding, RegisterController, RegisterView, ../controllers/register_controller.dart

### Community 193 - "Reminder Care Task Binding"
Cohesion: 0.33
Nodes (5): dependencies, ReminderCareTaskBinding, ReminderCareTaskController, ReminderCareTaskView, ../controllers/reminder_care_task_controller.dart

### Community 194 - "Reminder Care Task List Patient Binding"
Cohesion: 0.33
Nodes (5): dependencies, ReminderCareTaskListPatientBinding, ReminderCareTaskListPatientController, ReminderCareTaskListPatientView, ../controllers/reminder_care_task_list_patient_controller.dart

### Community 195 - "Report Daily Binding"
Cohesion: 0.33
Nodes (5): dependencies, ReportDailyBinding, ReportDailyController, ReportDailyView, ../controllers/report_daily_controller.dart

### Community 196 - "Report Daily Patient Binding"
Cohesion: 0.33
Nodes (5): dependencies, ReportDailyPatientBinding, ReportDailyPatientController, ReportDailyPatientView, ../controllers/report_daily_patient_controller.dart

### Community 197 - "Report Daily Patient Detail Binding"
Cohesion: 0.33
Nodes (5): dependencies, ReportDailyPatientDetailBinding, ReportDailyPatientDetailController, ReportDailyPatientDetailView, ../controllers/report_daily_patient_detail_controller.dart

### Community 198 - "Report Visit Binding"
Cohesion: 0.33
Nodes (5): dependencies, ReportVisitBinding, ReportVisitController, ReportVisitView, ../controllers/report_visit_controller.dart

### Community 199 - "Update Pin Binding"
Cohesion: 0.33
Nodes (5): dependencies, UpdatePinBinding, UpdatePinController, UpdatePinView, ../controllers/update_pin_controller.dart

### Community 200 - "User Home Binding"
Cohesion: 0.33
Nodes (5): dependencies, UserHomeBinding, UserHomeController, UserHomeView, ../controllers/user_home_controller.dart

### Community 201 - "Visit Binding"
Cohesion: 0.33
Nodes (5): dependencies, VisitBinding, VisitController, VisitView, ../controllers/visit_controller.dart

### Community 202 - "Visit Detail Binding"
Cohesion: 0.33
Nodes (5): dependencies, VisitDetailBinding, VisitDetailController, VisitDetailView, ../controllers/visit_detail_controller.dart

### Community 203 - "Visit Schedule Form Binding"
Cohesion: 0.33
Nodes (5): dependencies, VisitScheduleFormBinding, VisitScheduleFormController, VisitScheduleFormView, ../controllers/visit_schedule_form_controller.dart

### Community 204 - "Volunteer Home Binding"
Cohesion: 0.33
Nodes (5): dependencies, VolunteerHomeBinding, VolunteerHomeController, VolunteerHomeView, ../controllers/volunteer_home_controller.dart

### Community 205 - "Volunteer Wrapper Binding"
Cohesion: 0.33
Nodes (5): dependencies, VolunteerWrapperBinding, VolunteerWrapperController, VolunteerWrapperView, ../controllers/volunteer_wrapper_controller.dart

### Community 206 - "Animated Bottom Navigation Bar Item"
Cohesion: 0.33
Nodes (5): AnimatedBottomNavigationBarItem, icon, label, view, package:flutter/widgets.dart

### Community 207 - "Card Full Information"
Cohesion: 0.33
Nodes (5): build, CardFullInformation, icon, items, title

### Community 208 - "Auth Middleware"
Cohesion: 0.40
Nodes (4): AuthMiddleware, redirect, GetMiddleware, package:flutter/src/widgets/navigator.dart

### Community 209 - "Consultation Type Model"
Cohesion: 0.40
Nodes (4): ConsultationType, getConsultationTypeById, help, consultation,

### Community 210 - "Gender Model"
Cohesion: 0.40
Nodes (4): female, Gender, getGenderByValue, male,

### Community 211 - "Medicine Condition Model"
Cohesion: 0.40
Nodes (4): finished, getMedicineConditionFromId, MedicineCondition, enough,
  little,

### Community 212 - "Pemuput Upacara Model"
Cohesion: 0.40
Nodes (4): getPamuputUpacaraFromId, pedanda, PemuputUpacara, familyMember,
  pemangku,

### Community 213 - "Screening Answer Model"
Cohesion: 0.40
Nodes (4): ScreeningAnswer, title, value, T

### Community 214 - "Screening Question Model"
Cohesion: 0.40
Nodes (4): id, question, ScreeningQuestion, toString

### Community 215 - "Self Care Model"
Cohesion: 0.40
Nodes (4): getSelfCareFromId, rejected, SelfCare, independent,
  assisted,

### Community 216 - "Visit Result Status Model"
Cohesion: 0.40
Nodes (4): curedWithoutMedicine, getVisitResultById, VisitResultStatus, worsening,
  gettingBetter,
  healed,
  curedWithMedicine,

### Community 217 - "Get Session Data Use Cases"
Cohesion: 0.40
Nodes (4): _authRepository, execute, GetSessionDataUseCases, package:soul_doctor/app/domain/model/session_data.dart

### Community 218 - "Ui Feedback Utils"
Cohesion: 0.40
Nodes (4): showDialog, showSnackbar, UiFeedbackUtils, package:soul_doctor/app/widgets/dialog/basic_dialog.dart

### Community 219 - "List Item"
Cohesion: 0.40
Nodes (4): build, icon, ListItem, title

### Community 220 - "Network Content Type"
Cohesion: 0.50
Nodes (3): multipartForm, NetworkContentType, applicationJson,

### Community 221 - "Education Model"
Cohesion: 0.50
Nodes (3): doctoral, getEducationFromId, seniorHighSchool,
  diploma,
  bachelor,
  master,

### Community 222 - "Marital Model"
Cohesion: 0.50
Nodes (3): divorceByDeath, getMaritalFromId, notMarried,
  married,
  divorce,

### Community 223 - "Religion Model"
Cohesion: 0.50
Nodes (3): believers, getReligionFromId, kristenKatolik,
  hindu,
  buddha,
  konghucu,

### Community 224 - "Logout Use Case"
Cohesion: 0.50
Nodes (3): _authRepository, execute, LogoutUseCase

### Community 225 - "Report Visit Settings"
Cohesion: 0.50
Nodes (3): isHasData, ReportVisitSettings, visitId

### Community 226 - "Chip Tag Consultation Item"
Cohesion: 0.50
Nodes (3): ChipTagItem, isChecked, title

## Knowledge Gaps
- **2177 isolated node(s):** `ConstPath`, `DEVELOPMENT_PATH`, `PRODUCTION_PATH`, `STAGING_PATH`, `_imageDirectory` (+2172 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **4 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `AuthUseCases` connect `Account Setting Controller` to `Report Daily Controller`, `Report Visit Controller`, `Update Pin Controller`, `Input Profile Controller`, `Patient History Controller`, `Otp Verification Controller`, `Detail Consultation Controller`, `Reminder Care Task List Patient Controller`, `Report Daily Patient Controller`, `Patient Controller`, `Consultation Controller`, `Visit Controller`, `Volunteer Home Controller`, `Auth Use Cases`, `Account Controller`, `Visit Detail Controller`, `Add Consultation Controller`, `Diagnosis Form Controller`, `Create Pin Controller`, `Consultation Request Detail Controller`, `Reminder Care Task Controller`, `Doctor Home Controller`, `Login Controller`, `User Home Controller`?**
  _High betweenness centrality (0.027) - this node is a cross-community bridge._
- **Why does `PatientDetailHistory` connect `Patient Detail History Model` to `Patient Detail Model`?**
  _High betweenness centrality (0.012) - this node is a cross-community bridge._
- **What connects `ConstPath`, `DEVELOPMENT_PATH`, `PRODUCTION_PATH` to the rest of the system?**
  _2177 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `App Routes` be split into smaller, more focused modules?**
  _Cohesion score 0.016129032258064516 - nodes in this community are weakly interconnected._
- **Should `Basic Dialog` be split into smaller, more focused modules?**
  _Cohesion score 0.037952559300873906 - nodes in this community are weakly interconnected._
- **Should `Report Daily Controller` be split into smaller, more focused modules?**
  _Cohesion score 0.028985507246376812 - nodes in this community are weakly interconnected._
- **Should `Color Theme` be split into smaller, more focused modules?**
  _Cohesion score 0.03076923076923077 - nodes in this community are weakly interconnected._