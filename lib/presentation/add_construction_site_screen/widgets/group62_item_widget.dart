import '../controller/add_construction_site_controller.dart';
import '../models/group62_item_model.dart';
import 'package:flutter/material.dart';
import 'package:stsp_app/core/app_export.dart';

// ignore: must_be_immutable
class Group62ItemWidget extends StatelessWidget {
  Group62ItemWidget(this.group62ItemModelObj);

  Group62ItemModel group62ItemModelObj;

  var controller = Get.find<AddConstructionSiteController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getVerticalSize(
          1.00,
        ),
        bottom: getVerticalSize(
          1.00,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: getVerticalSize(
                    14.00,
                  ),
                  bottom: getVerticalSize(
                    11.00,
                  ),
                ),
                child: Image.asset(
                  ImageConstant.img19,
                  height: getSize(
                    23.00,
                  ),
                  width: getSize(
                    23.00,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  109.00,
                ),
                margin: EdgeInsets.only(
                  left: getHorizontalSize(
                    15.00,
                  ),
                ),
                child: Text(
                  "lbl20".tr,
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.textstyleubuntucondensedregular16.copyWith(
                    fontSize: getFontSize(
                      16,
                    ),
                    letterSpacing: 0.22,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: getHorizontalSize(
              109.00,
            ),
            margin: EdgeInsets.only(
              left: getHorizontalSize(
                87.00,
              ),
            ),
            child: Text(
              "lbl_test".tr,
              maxLines: null,
              textAlign: TextAlign.right,
              style: AppStyle.textstyleubuntucondensedregular161.copyWith(
                fontSize: getFontSize(
                  16,
                ),
                letterSpacing: 0.22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
