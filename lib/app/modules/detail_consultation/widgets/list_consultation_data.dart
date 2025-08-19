import 'package:flutter/material.dart';
import 'package:soul_doctor/app/utils/theme/color_theme.dart';
import 'package:soul_doctor/app/utils/theme/spacing_theme.dart';
import 'package:soul_doctor/app/utils/theme/text_style_theme.dart';

class ListConsultationData extends StatelessWidget {
  const ListConsultationData({
    super.key,
    required this.title,
    this.body,
    this.bodyList,
    required this.icon,
  });

  final String title;
  final String? body;
  final List<String>? bodyList;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 30,
              alignment: Alignment.center,
              child: Icon(icon, color: ColorTheme.CRIMSON_500),
            ),
            SizedBox(width: SpacingTheme.SPACING_4),
            Text(
              title,
              style: TextStyleTheme.BODY_2.copyWith(color: ColorTheme.TEXT_100),
            ),
          ],
        ),
        SizedBox(height: SpacingTheme.SPACING_2),
        Row(
          children: [
            Container(width: 30, alignment: Alignment.center),
            SizedBox(width: SpacingTheme.SPACING_4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (body != null)
                    Text(
                      body!,
                      style: TextStyleTheme.PARAGRAPH_5.copyWith(
                        color: ColorTheme.TEXT_200,
                      ),
                    ),
                  if (bodyList != null)
                    ...bodyList!.map(
                      (e) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 15,
                            alignment: Alignment.center,
                            child: Text(
                              "•",
                              style: TextStyleTheme.PARAGRAPH_5.copyWith(
                                color: ColorTheme.TEXT_200,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              e,
                              style: TextStyleTheme.PARAGRAPH_5.copyWith(
                                color: ColorTheme.TEXT_200,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  // if ((bodyList != null || bodyList!.isNotEmpty) && body == null)
                  // bodyList.map((element) => )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
