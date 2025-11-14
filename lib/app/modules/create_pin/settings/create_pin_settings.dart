import 'package:soul_doctor/app/domain/model/transaction_otp.dart';

class CreatePinSettings {
  String phoneNumber;
  TransactionOtp transactionOtp;

  CreatePinSettings({required this.phoneNumber, required this.transactionOtp});
}
