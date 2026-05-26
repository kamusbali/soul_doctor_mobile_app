import 'package:amicons/amicons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/resource.dart';
import '../../../core/theme/color_theme.dart';
import '../../../core/theme/spacing_theme.dart';
import '../../../core/theme/text_style_theme.dart';
import '../../../helpers/date_time_utils.dart';
import '../../../widgets/card/card_expanded_information.dart';
import '../../../widgets/item/item_information.dart';
import '../../../widgets/placeholder/placeholder_no_consultation.dart';
import '../controllers/report_daily_patient_detail_controller.dart';

class ReportDailyPatientDetailView
    extends GetView<ReportDailyPatientDetailController> {
  const ReportDailyPatientDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Permintaan',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SpacingTheme.SPACING_8),
        child: Obx(() {
          switch (controller.reportDetail.value.status) {
            case Status.loading:
              return Center(child: CircularProgressIndicator());
            case Status.success:
              return LayoutBuilder(
                builder: (context, constraints) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      controller.onInit();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          spacing: SpacingTheme.SPACING_4,
                          children:
                              controller.reportDetail.value.data
                                  ?.map(
                                    (e) => CardExpandedInformation(
                                      title:
                                          'Catatan Harian ${DateTimeUtils.dateToDayMonthYear(e.reportDate)}',
                                      icon: Amicons.lucide_briefcase_medical,
                                      items: [
                                        if (e.observation != null)
                                          ItemInformation(
                                            title: "Observasi",
                                            value: Text(
                                              e.observation ?? "-",
                                              style: TextStyleTheme.PARAGRAPH_5,
                                            ),
                                          ),
                                        // ignore: unnecessary_null_comparison
                                        if (e.sideEffect != null)
                                          ItemInformation(
                                            title: "Efek Samping",
                                            value: Text(
                                              e.sideEffect ? "Ya" : "Tidak",
                                              style: TextStyleTheme.PARAGRAPH_5,
                                            ),
                                          ),
                                        ItemInformation(
                                          title: "Perkembangan",
                                          value: Text(
                                            e.resultStatus.name,
                                            style: TextStyleTheme.PARAGRAPH_5,
                                          ),
                                        ),
                                        ItemInformation(
                                          title: "Jam Tidur",
                                          value: Text(
                                            e.sleepHour.toString(),
                                            style: TextStyleTheme.PARAGRAPH_5,
                                          ),
                                        ),
                                        ItemInformation(
                                          title: "Kondisi Setelah Tidur",
                                          value: Text(
                                            e.afterSleepCondition.name,
                                            style: TextStyleTheme.PARAGRAPH_5,
                                          ),
                                        ),
                                        ItemInformation(
                                          title: "Kondisi Obat",
                                          value: Text(
                                            e.medicineCondition.name,
                                            style: TextStyleTheme.PARAGRAPH_5,
                                          ),
                                        ),
                                        ItemInformation(
                                          title: "Komunikasi",
                                          value: Text(
                                            e.communication.name,
                                            style: TextStyleTheme.PARAGRAPH_5,
                                          ),
                                        ),
                                        ItemInformation(
                                          title: "Perawatan Diri",
                                          value: Text(
                                            e.selfCare.name,
                                            style: TextStyleTheme.PARAGRAPH_5,
                                          ),
                                        ),
                                        ItemInformation(
                                          title:
                                              "Melaksanakan Upacara dalam 3 bulan terakhir?",
                                          value: Text(
                                            e.doingCeremony == true
                                                ? "Ya"
                                                : "Tidak",
                                            style: TextStyleTheme.PARAGRAPH_5,
                                          ),
                                        ),
                                        if (e.doingCeremony == true)
                                          ItemInformation(
                                            title: "Nama Upacara",
                                            value: Text(
                                              e.ceremonyName ?? "-",
                                              style: TextStyleTheme.PARAGRAPH_5,
                                            ),
                                          ),
                                        if (e.doingCeremony == true)
                                          ItemInformation(
                                            title: "Pemuput Upacara",
                                            value: Text(
                                              e.pemuputUpacara.name,
                                              style: TextStyleTheme.PARAGRAPH_5,
                                            ),
                                          ),

                                        if (e.images != null &&
                                            e.images!.isNotEmpty)
                                          ItemInformation(
                                            title: "Foto Hasil Visit",
                                            value: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                spacing: SpacingTheme.SPACING_8,
                                                children: e.images!
                                                    .map(
                                                      (e) => Image.network(
                                                        e,
                                                        width: 200,
                                                        errorBuilder:
                                                            (
                                                              context,
                                                              error,
                                                              stackTrace,
                                                            ) {
                                                              debugPrint(
                                                                error
                                                                    .toString(),
                                                              );
                                                              return const Icon(
                                                                Icons
                                                                    .broken_image,
                                                              );
                                                            },
                                                      ),
                                                    )
                                                    .toList(),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  )
                                  .toList() ??
                              [],
                        ),
                      ),
                    ),
                  );
                },
              );
            default:
              return LayoutBuilder(
                builder: (context, constraints) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      controller.onInit();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Column(
                          children: [
                            PlaceholderNoData(
                              title: "Belum ada catatan harian",
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
          }
        }),
      ),
    );
  }
}
