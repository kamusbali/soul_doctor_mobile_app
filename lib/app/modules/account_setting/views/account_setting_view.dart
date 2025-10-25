import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soul_doctor/app/common/resource.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/domain/model/education.dart';
import 'package:soul_doctor/app/domain/model/marital.dart';
import 'package:soul_doctor/app/domain/model/religion.dart';
import 'package:soul_doctor/app/helpers/date_time_utils.dart';
import 'package:soul_doctor/app/widgets/item/item_information.dart';
import 'package:soul_doctor/app/widgets/list/list_item.dart';

import '../../../core/theme/color_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../controllers/account_setting_controller.dart';

class AccountSettingView extends GetView<AccountSettingController> {
  const AccountSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Formulir Pengajuan Konsultasi',
          style: TextStyleTheme.BODY_2.copyWith(color: ColorTheme.TEXT_100),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Amicons.flaticon_arrow_left_rounded,
            color: ColorTheme.NEUTRAL_900,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: SpacingTheme.SPACING_4),
              Container(
                width: Get.width,
                padding: EdgeInsets.all(SpacingTheme.SPACING_8),
                decoration: BoxDecoration(color: ColorTheme.NEUTRAL_100),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Keterangan Pasien",
                            style: TextStyleTheme.BODY_2,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text("Ubah", style: TextStyleTheme.LABEL_1),
                        ),
                      ],
                    ),
                    Divider(color: ColorTheme.NEUTRAL_500),
                    Obx(() {
                      switch (controller.profile.value.status) {
                        case Status.loading:
                          return Center(child: CircularProgressIndicator());
                        case Status.success:
                          var data = controller.profile.value.data!;
                          return Column(
                            children: [
                              ItemInformation(
                                title: "Nama Lengkap",
                                value: data.fullname,
                              ),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(
                                title: "Nama Panggilan",
                                value: data.nickname,
                              ),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(
                                title: "Email",
                                value: data.email ?? "-",
                              ),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(
                                title: "Tanggal Lahir",
                                value: DateTimeUtils.dateToDayMonthYear(
                                  data.birthday,
                                ),
                              ),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(
                                title: "Jenis Kelamin",
                                value: data.gender.name,
                              ),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(
                                title: "Status Perkawinan",
                                value:
                                    Marital.getMaritalFromId(
                                      data.maritalStatusId,
                                    )?.name ??
                                    "-",
                              ),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(
                                title: "Pendidikan Terakhir",
                                value:
                                    Education.getEducationFromId(
                                      data.lastEducationId,
                                    )?.name ??
                                    "-",
                              ),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(
                                title: "Pekerjaan",
                                value: data.job,
                              ),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(
                                title: "Agama",
                                value:
                                    Religion.getReligionFromId(
                                      data.religionId,
                                    )?.name ??
                                    "-",
                              ),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(
                                title: "Nomor Telepon",
                                value: data.phone ?? "-",
                              ),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(
                                title: "Kabupaten",
                                value: "Bangli",
                              ),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(
                                title: "Kecamatan",
                                value: "Kintamani",
                              ),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(title: "Desa", value: "Daup"),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(title: "Banjar", value: "Daup"),
                              SizedBox(height: SpacingTheme.SPACING_6),
                              ItemInformation(
                                title: "Alamat",
                                value: data.address,
                              ),
                            ],
                          );
                        default:
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text("No Data"),
                          );
                      }
                    }),
                  ],
                ),
              ),
              SizedBox(height: SpacingTheme.SPACING_4),
              ListItem(
                icon: Amicons.flaticon_lock_alt_rounded,
                title: "Ganti Password",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
