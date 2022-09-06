import 'package:flutter/material.dart';
import 'package:stsp_app/core/app_export.dart';

class AppStyle {
  static TextStyle textstyleregular20 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      20,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleregular16 = TextStyle(
    color: ColorConstant.bluegray400,
    fontSize: getFontSize(
      16,
    ),
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleubuntucondensedregular20 =
      textstyleubuntucondensedregular241.copyWith(
    fontSize: getFontSize(
      20,
    ),
    fontFamily: 'Ubuntu Condensed',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyletajawalregular48 = TextStyle(
    color: ColorConstant.gray501,
    fontSize: getFontSize(
      48,
    ),
    fontFamily: 'Tajawal',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyletajawalregular16 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Tajawal',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleubuntucondensedregular16 =
      textstyleubuntucondensedregular161.copyWith(
    color: ColorConstant.gray700,
  );

  static TextStyle textstyleubuntucondensedregular161 = TextStyle(
    color: ColorConstant.gray600,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Ubuntu Condensed',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleubuntucondensedregular18 = TextStyle(
    color: ColorConstant.lightBlue800,
    fontSize: getFontSize(
      18,
    ),
    fontFamily: 'Ubuntu Condensed',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstylepoppinsmedium18 =
      textstylepoppinsmedium181.copyWith(
    color: ColorConstant.gray900,
  );

  static TextStyle textstyleubuntucondensedregular241 =
      textstyleubuntucondensedregular24.copyWith(
    color: ColorConstant.black900,
  );

  static TextStyle textstyleurbanistsemibold16 = TextStyle(
    color: ColorConstant.gray901,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Urbanist',
    fontWeight: FontWeight.w600,
  );

  static TextStyle textstyleurbanistromanbold20 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: 'Urbanist',
    fontWeight: FontWeight.w700,
  );

  static TextStyle textstyleubuntucondensedregular24 = TextStyle(
    color: ColorConstant.gray500,
    fontSize: getFontSize(
      24,
    ),
    fontFamily: 'Ubuntu Condensed',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstyleurbanistromanbold201 =
      textstyleurbanistromanbold20.copyWith();

  static TextStyle textstyleurbanistromanmedium12 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getFontSize(
      12,
    ),
    fontFamily: 'Urbanist',
    fontWeight: FontWeight.w500,
  );

  static TextStyle textstylepoppinsregular14 = TextStyle(
    color: ColorConstant.whiteA700,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static TextStyle textstylepoppinsmedium181 = TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
      18,
    ),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
}
