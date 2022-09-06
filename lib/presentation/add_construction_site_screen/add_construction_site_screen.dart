import '../add_construction_site_screen/widgets/group62_item_widget.dart';
import 'controller/add_construction_site_controller.dart';
import 'models/group62_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stsp_app/core/app_export.dart';

class AddConstructionSiteScreen
    extends GetWidget<AddConstructionSiteController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.gray100,
            body: Container(
                width: size.width,
                child: SingleChildScrollView(
                    child: Container(
                        decoration: BoxDecoration(color: ColorConstant.gray100),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: getVerticalSize(16.00)),
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                    height:
                                                        getVerticalSize(321.00),
                                                    width: size.width,
                                                    child: Stack(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        children: [
                                                          Align(
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Container(
                                                                  height:
                                                                      getVerticalSize(
                                                                          321.00),
                                                                  width: size
                                                                      .width,
                                                                  child: Stack(
                                                                      alignment:
                                                                          Alignment
                                                                              .topCenter,
                                                                      children: [
                                                                        Align(
                                                                            alignment: Alignment
                                                                                .centerLeft,
                                                                            child: Image.asset(ImageConstant.img4,
                                                                                height: getVerticalSize(321.00),
                                                                                width: getHorizontalSize(390.00),
                                                                                fit: BoxFit.fill)),
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.topCenter,
                                                                            child: Container(
                                                                                margin: EdgeInsets.only(right: getHorizontalSize(2.00), bottom: getVerticalSize(10.00)),
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [
                                                                                  Align(
                                                                                      alignment: Alignment.centerLeft,
                                                                                      child: Container(
                                                                                          width: size.width,
                                                                                          margin: EdgeInsets.only(top: getVerticalSize(12.00), bottom: getVerticalSize(6.00)),
                                                                                          child: Padding(
                                                                                              padding: EdgeInsets.only(left: getHorizontalSize(5.00), right: getHorizontalSize(10.00)),
                                                                                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.max, children: [
                                                                                                Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.max, children: [
                                                                                                  GestureDetector(
                                                                                                      onTap: () {
                                                                                                        onTapGroup59();
                                                                                                      },
                                                                                                      child: Container(
                                                                                                          height: getVerticalSize(32.00),
                                                                                                          width: getHorizontalSize(66.58),
                                                                                                          child: Stack(alignment: Alignment.topLeft, children: [
                                                                                                            Align(alignment: Alignment.centerRight, child: Padding(padding: EdgeInsets.only(left: getHorizontalSize(10.00), top: getVerticalSize(1.00)), child: Text("lbl7".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.textstyletajawalregular16.copyWith(fontSize: getFontSize(16), letterSpacing: 0.20)))),
                                                                                                            Align(alignment: Alignment.topLeft, child: Padding(padding: EdgeInsets.only(right: getHorizontalSize(10.00), bottom: getVerticalSize(10.00)), child: Container(height: getSize(25.00), width: getSize(25.00), child: SvgPicture.asset(ImageConstant.imgIconlylightou1, fit: BoxFit.fill))))
                                                                                                          ]))),
                                                                                                  Padding(padding: EdgeInsets.only(left: getHorizontalSize(81.42), top: getVerticalSize(1.00), bottom: getVerticalSize(7.00)), child: Text("lbl22".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.textstyleurbanistromanbold20.copyWith(fontSize: getFontSize(20))))
                                                                                                ]),
                                                                                                Padding(padding: EdgeInsets.only(top: getVerticalSize(7.00), bottom: getVerticalSize(6.00)), child: Text("lbl9".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.textstyletajawalregular16.copyWith(fontSize: getFontSize(16), letterSpacing: 0.20)))
                                                                                              ]))))
                                                                                ])))
                                                                      ]))),
                                                          Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Padding(
                                                                  padding: EdgeInsets.only(
                                                                      left: getHorizontalSize(
                                                                          27.00),
                                                                      top: getVerticalSize(
                                                                          10.00),
                                                                      right: getHorizontalSize(
                                                                          27.00),
                                                                      bottom: getVerticalSize(
                                                                          6.00)),
                                                                  child: Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.centerRight,
                                                                            child: Container(
                                                                                height: getVerticalSize(191.00),
                                                                                width: getHorizontalSize(198.00),
                                                                                margin: EdgeInsets.only(left: getHorizontalSize(10.00)),
                                                                                decoration: BoxDecoration(color: ColorConstant.whiteA700),
                                                                                child: Stack(alignment: Alignment.center, children: [
                                                                                  Align(alignment: Alignment.bottomCenter, child: Padding(padding: EdgeInsets.only(left: getHorizontalSize(49.00), top: getVerticalSize(43.00), right: getHorizontalSize(49.00), bottom: getVerticalSize(43.00)), child: Text("lbl10".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.textstyleubuntucondensedregular24.copyWith(fontSize: getFontSize(24), letterSpacing: 0.22)))),
                                                                                  Align(alignment: Alignment.center, child: Padding(padding: EdgeInsets.only(left: getHorizontalSize(40.00), top: getVerticalSize(40.00), right: getHorizontalSize(40.00), bottom: getVerticalSize(40.00)), child: Text("lbl11".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center, style: AppStyle.textstyletajawalregular48.copyWith(fontSize: getFontSize(48), letterSpacing: 0.20))))
                                                                                ]))),
                                                                        Align(
                                                                            alignment:
                                                                                Alignment.centerLeft,
                                                                            child: Padding(
                                                                                padding: EdgeInsets.only(top: getVerticalSize(36.00), right: getHorizontalSize(10.00)),
                                                                                child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
                                                                                  Image.asset(ImageConstant.imgTitleicon1, height: getVerticalSize(27.00), width: getHorizontalSize(23.00), fit: BoxFit.fill),
                                                                                  Padding(padding: EdgeInsets.only(left: getHorizontalSize(7.00), top: getVerticalSize(2.00)), child: Text("lbl12".tr, overflow: TextOverflow.ellipsis, textAlign: TextAlign.left, style: AppStyle.textstyleubuntucondensedregular18.copyWith(fontSize: getFontSize(18), letterSpacing: 0.22)))
                                                                                ])))
                                                                      ])))
                                                        ]))),
                                            Container(
                                                width: double.infinity,
                                                margin: EdgeInsets.only(
                                                    left: getHorizontalSize(
                                                        12.00),
                                                    top: getVerticalSize(15.00),
                                                    right: getHorizontalSize(
                                                        12.00)),
                                                decoration: BoxDecoration(
                                                    color:
                                                        ColorConstant.whiteA700,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            getHorizontalSize(
                                                                10.00))),
                                                child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                          padding: EdgeInsets.only(
                                                              left:
                                                                  getHorizontalSize(
                                                                      11.00),
                                                              right:
                                                                  getHorizontalSize(
                                                                      11.00)),
                                                          child: Obx(() =>
                                                              ListView.builder(
                                                                  physics:
                                                                      BouncingScrollPhysics(),
                                                                  shrinkWrap:
                                                                      true,
                                                                  itemCount: controller
                                                                      .addConstructionSiteModelObj
                                                                      .value
                                                                      .group62ItemList
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    Group62ItemModel
                                                                        model =
                                                                        controller
                                                                            .addConstructionSiteModelObj
                                                                            .value
                                                                            .group62ItemList[index];
                                                                    return Group62ItemWidget(
                                                                        model);
                                                                  })))
                                                    ]))
                                          ])))
                            ]))))));
  }

  onTapGroup59() {
    Get.toNamed(AppRoutes.homeScreen);
  }
}
