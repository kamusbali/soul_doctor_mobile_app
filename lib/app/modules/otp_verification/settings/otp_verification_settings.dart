import 'package:soul_doctor/app/domain/model/transaction_otp.dart';

class OtpVerificationSettings {
  TransactionOtp transactionOtp;
  String phoneNumber;

  OtpVerificationSettings({
    required this.transactionOtp,
    required this.phoneNumber,
  });
}
