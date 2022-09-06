import 'package:flutter/material.dart';
import 'package:stsp_app/core/app_export.dart';

class AppDecoration {
  static BoxDecoration get groupstyle1 => BoxDecoration();
  static BoxDecoration get groupstyle2 => BoxDecoration();
  static BoxDecoration get groupstylegray100 => BoxDecoration(
        color: ColorConstant.gray100,
      );
  static BoxDecoration get groupstylewhiteA700cornerradius => BoxDecoration(
        color: ColorConstant.whiteA700,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            10.00,
          ),
        ),
      );
  static BoxDecoration get groupstylelightBlue801 => BoxDecoration(
        color: ColorConstant.lightBlue801,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black90021,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get textstyleurbanistromanbold201 => BoxDecoration(
        color: ColorConstant.yellow900,
        borderRadius: BorderRadius.circular(
          getHorizontalSize(
            25.00,
          ),
        ),
      );
  static BoxDecoration get textstyleurbanistromanmedium12 => BoxDecoration(
        color: ColorConstant.lightBlue801,
        boxShadow: [
          BoxShadow(
            color: ColorConstant.black90021,
            spreadRadius: getHorizontalSize(
              2.00,
            ),
            blurRadius: getHorizontalSize(
              2.00,
            ),
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
      );
  static BoxDecoration get groupstylewhiteA700 => BoxDecoration(
        color: ColorConstant.whiteA700,
      );
}
