import '../menu_draweritem/controller/menu_controller.dart';
import '../menu_draweritem/menu_draweritem.dart';
import 'controller/earthquake_bulletin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stsp_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class EarthquakeBulletinScreen extends GetWidget<EarthquakeBulletinController> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 123, 200, 1),
          centerTitle: true,
          title: Text(
            "lbl29".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.textstyleurbanistromanbold20.copyWith(
              fontSize: getFontSize(20),
            ),
          ),
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: IconButton(
              onPressed: () {
                onTapImgMenu();
              },
              icon: SvgPicture.asset(ImageConstant.imgMenu1,
                  fit: BoxFit.fill,
                  width: getHorizontalSize(15.0),
                  height: getVerticalSize(15.0)),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: Image.asset(ImageConstant.img117,
                    width: getHorizontalSize(30.0),
                    height: getVerticalSize(22.0),
                    fit: BoxFit.fill),
                onPressed: () => debugPrint('Camara button is pressed.'),
              ),
            ),
          ],
        ),
        key: _scaffoldKey,
        backgroundColor: ColorConstant.whiteA700,
        drawer: MenuDraweritem(MenuController()),
        body: Container(
          width: size.width,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(color: ColorConstant.whiteA700),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(ImageConstant.img32,
                      height: getVerticalSize(127.00),
                      width: getHorizontalSize(390.00),
                      fit: BoxFit.fill),
                  Padding(
                      padding: EdgeInsets.only(
                          left: getHorizontalSize(31.00),
                          top: getVerticalSize(13.00),
                          right: getHorizontalSize(31.00)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                height: getVerticalSize(34.00),
                                width: getHorizontalSize(4.00),
                                decoration: BoxDecoration(
                                    color: ColorConstant.lightBlue802)),
                            Padding(
                                padding: EdgeInsets.only(
                                    left: getHorizontalSize(12.00)),
                                child: Text("lbl3".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle
                                        .textstyleubuntucondensedregular241
                                        .copyWith(
                                            fontSize: getFontSize(24),
                                            letterSpacing: 0.22)))
                          ])),
                  Container(
                      margin: EdgeInsets.only(top: getVerticalSize(20.00)),
                      decoration: BoxDecoration(color: ColorConstant.gray100),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    left: getHorizontalSize(22.00),
                                    top: getVerticalSize(5.00),
                                    bottom: getVerticalSize(4.00)),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(ImageConstant.img113,
                                          height: getVerticalSize(31.00),
                                          width: getHorizontalSize(26.00),
                                          fit: BoxFit.fill),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: getHorizontalSize(9.00),
                                              top: getVerticalSize(1.00),
                                              bottom: getVerticalSize(2.00)),
                                          child: Text("lbl30".tr,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.left,
                                              style: AppStyle
                                                  .textstyleubuntucondensedregular20
                                                  .copyWith(
                                                      fontSize: getFontSize(20),
                                                      letterSpacing: 0.22)))
                                    ])),
                            Padding(
                                padding: EdgeInsets.only(
                                    top: getVerticalSize(9.00),
                                    right: getHorizontalSize(11.00),
                                    bottom: getVerticalSize(9.00)),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("lbl31".tr,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          style: AppStyle
                                              .textstyleubuntucondensedregular16
                                              .copyWith(
                                                  fontSize: getFontSize(16),
                                                  letterSpacing: 0.22)),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: getHorizontalSize(1.00),
                                              top: getVerticalSize(1.00)),
                                          child: Container(
                                              height: getSize(21.00),
                                              width: getSize(21.00),
                                              child: SvgPicture.asset(
                                                  ImageConstant
                                                      .imgIconlylightou2,
                                                  fit: BoxFit.fill)))
                                    ]))
                          ])),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: getHorizontalSize(25.00),
                          top: getVerticalSize(31.00),
                          right: getHorizontalSize(25.00)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(ImageConstant.img114,
                              height: getVerticalSize(100.00),
                              width: getHorizontalSize(340.00),
                              fit: BoxFit.fill),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: getVerticalSize(35.00)),
                              child: Image.asset(ImageConstant.img115,
                                  height: getVerticalSize(100.00),
                                  width: getHorizontalSize(340.00),
                                  fit: BoxFit.fill)),
                          Padding(
                              padding:
                                  EdgeInsets.only(top: getVerticalSize(35.00)),
                              child: Image.asset(ImageConstant.img116,
                                  height: getVerticalSize(100.00),
                                  width: getHorizontalSize(340.00),
                                  fit: BoxFit.fill))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromRGBO(0, 123, 200, 1),
          child: Container(
            height: getVerticalSize(80.00),
            child: Padding(
              padding: EdgeInsets.only(top: getVerticalSize(15.0)),
              child: Text(
                "msg".tr,
                textAlign: TextAlign.center,
                style: AppStyle.textstyleurbanistromanmedium12
                    .copyWith(fontSize: getFontSize(12), letterSpacing: 0.20),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapImgMenu() {
    _scaffoldKey.currentState?.openDrawer();
  }
}
