import 'package:soul_doctor/app/domain/use_case/profile_use_cases/get_compact_profile_use_case.dart';
import 'package:soul_doctor/app/domain/use_case/profile_use_cases/get_profile_use_case.dart';

class ProfileUseCases {
  final GetCompactProfileUseCase getCompactProfileUseCase;
  final GetProfileUseCase getProfileUseCase;

  ProfileUseCases({
    required this.getCompactProfileUseCase,
    required this.getProfileUseCase,
  });
}
