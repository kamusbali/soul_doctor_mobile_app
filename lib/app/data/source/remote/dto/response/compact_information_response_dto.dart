// To parse this JSON data, do
//
//     final compactInformationResponseDto = compactInformationResponseDtoFromJson(jsonString);

import 'dart:convert';

CompactInformationResponseDto compactInformationResponseDtoFromJson(String str) => CompactInformationResponseDto.fromJson(json.decode(str));

String compactInformationResponseDtoToJson(CompactInformationResponseDto data) => json.encode(data.toJson());

class CompactInformationResponseDto {
    String? fullname;
    String? nickname;
    DateTime? birthday;

    CompactInformationResponseDto({
        this.fullname,
        this.nickname,
        this.birthday,
    });

    factory CompactInformationResponseDto.fromJson(Map<String, dynamic> json) => CompactInformationResponseDto(
        fullname: json["fullname"],
        nickname: json["nickname"],
        birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
    );

    Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "nickname": nickname,
        "birthday": "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
    };
}
