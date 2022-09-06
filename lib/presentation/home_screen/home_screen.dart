import '../menu_draweritem/controller/menu_controller.dart';
import '../menu_draweritem/menu_draweritem.dart';
import 'controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stsp_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class HomeScreen extends GetWidget<HomeController> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                onPressed: () {
                  debugPrint('Camara button is pressed.');
                  onTapToModel3D();
                },
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
                  Image.asset(ImageConstant.img33,
                      height: getVerticalSize(127.00),
                      width: getHorizontalSize(390.00),
                      fit: BoxFit.fill),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getHorizontalSize(31.00),
                      top: getVerticalSize(13.00),
                      right: getHorizontalSize(31.00),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: getVerticalSize(34.00),
                          width: getHorizontalSize(4.00),
                          decoration:
                              BoxDecoration(color: ColorConstant.lightBlue802),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: getHorizontalSize(12.00),
                          ),
                          child: Text(
                            "lbl2".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.textstyleubuntucondensedregular241
                                .copyWith(
                                    fontSize: getFontSize(24),
                                    letterSpacing: 0.22),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: getVerticalSize(58.00),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              onTapImgtf();
                            },
                            child: Image.asset(ImageConstant.img118,
                                height: getVerticalSize(100.00),
                                width: getHorizontalSize(340.00),
                                fit: BoxFit.fill),
                          ),
                          GestureDetector(
                            onTap: () {
                              onTapImgtf1();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(40.00),
                              ),
                              child: Image.asset(ImageConstant.img119,
                                  height: getVerticalSize(100.00),
                                  width: getHorizontalSize(340.00),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              onTapImgtf2();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: getVerticalSize(40.00),
                              ),
                              child: Image.asset(ImageConstant.img120,
                                  height: getVerticalSize(100.00),
                                  width: getHorizontalSize(340.00),
                                  fit: BoxFit.fill),
                            ),
                          ),
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

  onTapImgtf() {
    Get.toNamed(AppRoutes.earthquakeBulletinScreen);
  }

  onTapImgtf1() {
    Get.toNamed(AppRoutes.factoryListScreen, arguments: "OccupationalDisaster");
  }

  onTapImgtf2() {
    Get.toNamed(AppRoutes.buildingScreen);
  }

  onTapToModel3D() {
    Get.toNamed(AppRoutes.model3dScreen);
  }
}
