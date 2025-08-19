import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyleTheme {
  TextStyleTheme._();
  
  static final HEADING_1 = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w800,
  );
  static final HEADING_2 = GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );
  static final HEADING_3 = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static final HEADING_4 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static final BODY_1 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static final BODY_2 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static final LABEL_1 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static final LABEL_2 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final LABEL_3 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static final LABEL_4 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
  static final LABEL_5 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static final LABEL_6 = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w700,
  );

  static final PARAGRAPH_1 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static final PARAGRAPH_2 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static final PARAGRAPH_3 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final PARAGRAPH_4 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static final PARAGRAPH_5 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static final PARAGRAPH_6 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
