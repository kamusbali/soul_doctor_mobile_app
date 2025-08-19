import 'provider_injection.dart';
import 'repository_injection.dart';
import 'use_case/use_cases_injection.dart';

class Injection {
  static void execute() {
    ProviderInjection.inject();
    RepositoryInjection.inject();
    UseCasesInjection.inject();
  }
}