// To parse this JSON data, do
//
//     final transactionOtpResponseDto = transactionOtpResponseDtoFromJson(jsonString);

import 'dart:convert';

import 'package:soul_doctor/app/domain/model/transaction_otp.dart';

TransactionOtpResponseDto transactionOtpResponseDtoFromJson(String str) =>
    TransactionOtpResponseDto.fromJson(json.decode(str));

String transactionOtpResponseDtoToJson(TransactionOtpResponseDto data) =>
    json.encode(data.toJson());

class TransactionOtpResponseDto {
  String? transactionId;

  TransactionOtpResponseDto({this.transactionId});

  factory TransactionOtpResponseDto.fromJson(Map<String, dynamic> json) =>
      TransactionOtpResponseDto(transactionId: json["transaction_id"]);

  Map<String, dynamic> toJson() => {"transaction_id": transactionId};
}

extension TransactionOtpResponseDtoConversion on TransactionOtpResponseDto {
  TransactionOtp toTransactionOtp() {
    return TransactionOtp(transactionId: transactionId!);
  }
}
