import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stsp_app/core/app_export.dart';

class LoginScreen extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(244, 244, 244, 1.0),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img_.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: getHorizontalSize(27.00),
                          top: getVerticalSize(480.00),
                          right: getHorizontalSize(23.00)),
                      child: Container(
                          height: getVerticalSize(50.00),
                          width: getHorizontalSize(340.00),
                          child: TextFormField(
                              controller: controller.tfController,
                              decoration: InputDecoration(
                                  hintText: "lbl32".tr,
                                  hintStyle: AppStyle.textstyleurbanistsemibold16
                                      .copyWith(
                                          fontSize: getFontSize(16.0),
                                          color: ColorConstant.gray901),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(12.00)),
                                      borderSide: BorderSide.none),
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: getHorizontalSize(20.00),
                                          right: getHorizontalSize(10.00)),
                                      child: Container(
                                          height: getSize(20.00),
                                          width: getSize(20.00),
                                          child:
                                              SvgPicture.asset(ImageConstant.imgIconlyBoldProfile, fit: BoxFit.contain))),
                                  prefixIconConstraints: BoxConstraints(minWidth: getSize(20.00), minHeight: getSize(20.00)),
                                  filled: true,
                                  fillColor: ColorConstant.whiteA700,
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(top: getVerticalSize(18.20), bottom: getVerticalSize(18.20))),
                              style: TextStyle(color: ColorConstant.gray901, fontSize: getFontSize(16.0), fontFamily: 'Urbanist', fontWeight: FontWeight.w600)))),
                  Padding(
                      padding: EdgeInsets.only(
                          left: getHorizontalSize(27.00),
                          top: getVerticalSize(45.00),
                          right: getHorizontalSize(23.00)),
                      child: Container(
                          height: getVerticalSize(50.00),
                          width: getHorizontalSize(340.00),
                          child: TextFormField(
                              controller: controller.tfController1,
                              decoration: InputDecoration(
                                  hintText: "lbl33".tr,
                                  hintStyle: AppStyle
                                      .textstyleurbanistsemibold16
                                      .copyWith(
                                          fontSize: getFontSize(16.0),
                                          color: ColorConstant.gray901),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          getHorizontalSize(12.00)),
                                      borderSide: BorderSide.none),
                                  prefixIcon: Padding(
                                      padding: EdgeInsets.only(
                                          left: getHorizontalSize(20.00),
                                          right: getHorizontalSize(10.00)),
                                      child: Container(
                                          height: getSize(20.00),
                                          width: getSize(20.00),
                                          child: SvgPicture.asset(ImageConstant.imgIconlyBoldLock, fit: BoxFit.contain))),
                                  prefixIconConstraints: BoxConstraints(minWidth: getSize(20.00), minHeight: getSize(20.00)),
                                  suffixIcon: Padding(padding: EdgeInsets.only(left: getHorizontalSize(10.00), right: getHorizontalSize(20.00)), child: Container(height: getSize(20.00), width: getSize(20.00), child: SvgPicture.asset(ImageConstant.imgIconlyBoldHide, fit: BoxFit.contain))),
                                  suffixIconConstraints: BoxConstraints(minWidth: getSize(20.00), minHeight: getSize(20.00)),
                                  filled: true,
                                  fillColor: ColorConstant.whiteA700,
                                  isDense: true,
                                  contentPadding: EdgeInsets.only(top: getVerticalSize(18.20), bottom: getVerticalSize(18.20))),
                              style: TextStyle(color: ColorConstant.gray901, fontSize: getFontSize(16.0), fontFamily: 'Urbanist', fontWeight: FontWeight.w600)))),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: getHorizontalSize(24.00),
                          top: getVerticalSize(45.00),
                          right: getHorizontalSize(23.00),
                          bottom: getVerticalSize(20.00)),
                      child: GestureDetector(
                        onTap: () {
                          onTapBtntf();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: getVerticalSize(50.00),
                          width: getHorizontalSize(343.00),
                          decoration:
                              AppDecoration.textstyleurbanistromanbold201,
                          child: Text(
                            "lbl34".tr,
                            textAlign: TextAlign.center,
                            style: AppStyle.textstyleurbanistromanbold201
                                .copyWith(
                                    fontSize: getFontSize(20),
                                    letterSpacing: 0.20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapBtntf() {
    Get.toNamed(AppRoutes.homeScreen);
  }
}
