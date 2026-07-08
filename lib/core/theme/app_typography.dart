import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTypography {
  AppTypography._();

  static const String fontFamily = 'Roboto';
  static const String oriflameFontFamily = 'Oriflame Sans 2.0';
  static const String satoshiFontFamily = 'Satoshi';

  static const TextStyle headline = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get tabLabel => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
      );

  static TextStyle get readyToShareLabel => TextStyle(
        fontFamily: satoshiFontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
        color: Colors.white,
      );

  static TextStyle get communityLabel => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
        color: Colors.white,
      );

  static TextStyle get productName => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
        color: Colors.white,
      );

  static TextStyle get productPrice => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
        color: Colors.white,
      );

  static TextStyle get productDiscount => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 10.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
        color: Colors.white,
      );

  static TextStyle get musicRecommendedLabel => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 10.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
        color: Colors.white,
      );

  static TextStyle get musicTitle => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.italic,
        height: 1,
        letterSpacing: 0,
        color: Colors.white,
      );

  static TextStyle get musicArtist => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1,
        letterSpacing: 0,
        color: Colors.white,
      );

  static TextStyle get captionBody => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        height: 1,
        letterSpacing: 0,
        color: Colors.white,
      );

  static TextStyle get captionLabel => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
        color: Colors.white,
      );

  static TextStyle get captionBold => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
        color: Colors.white,
      );

  static TextStyle get captionLink => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        height: 1,
        letterSpacing: 0,
        color: Colors.white,
      );

  static TextStyle get editCaptionTitle => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
        color: Colors.black,
      );

  static TextStyle get editCaptionButton => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
      );

  static TextStyle get quickShareLabel => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
        color: Colors.white,
      );

  static TextStyle get loadingMessage => TextStyle(
        fontFamily: oriflameFontFamily,
        fontSize: 13.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: 0,
        color: const Color(0xFFB1B1B1),
      );
}
