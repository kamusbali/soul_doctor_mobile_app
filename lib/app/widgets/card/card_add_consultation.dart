import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soul_doctor/app/common/constant/const_path.dart';
import 'package:soul_doctor/app/core/theme/color_theme.dart';
import 'package:soul_doctor/app/core/theme/spacing_theme.dart';
import 'package:soul_doctor/app/core/theme/text_style_theme.dart';

class CardAddConsultation extends StatelessWidget {
  const CardAddConsultation({super.key, required this.onTap});

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Get.width,
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        decoration: BoxDecoration(
          color: ColorTheme.EUCALYPTUS_500,
          borderRadius: BorderRadius.circular(SpacingTheme.SPACING_10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Usulkan Visit",
                      style: TextStyleTheme.BODY_2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Ajukan permintaan visit ke pasien yang Anda dampingi.",
                      style: TextStyleTheme.PARAGRAPH_5.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              ConstPath.CARD_ILLUSTRATION_CONSULTATION_PATH,
              width: 120,
            ),
          ],
        ),
      ),
    );
  }
}
