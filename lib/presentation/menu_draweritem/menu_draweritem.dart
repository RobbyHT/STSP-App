import 'controller/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stsp_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MenuDraweritem extends StatelessWidget {
  MenuDraweritem(this.controller);

  MenuController controller;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                  image: AssetImage(ImageConstant.img2), fit: BoxFit.cover),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: getVerticalSize(65),
                  width: getHorizontalSize(65),
                  child: SvgPicture.asset(ImageConstant.imgGroup30,
                      fit: BoxFit.fill),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: getHorizontalSize(16.31),
                    top: getVerticalSize(8.22),
                    bottom: getVerticalSize(8.95),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: getHorizontalSize(10.00),
                        ),
                        child: Text(
                          "lbl".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylepoppinsregular14.copyWith(
                              fontSize: getFontSize(14), height: 1.14),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: getVerticalSize(6.67)),
                        child: Text(
                          "lbl_user_name".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.textstylepoppinsmedium18.copyWith(
                              fontSize: getFontSize(18), height: 1.33),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image.asset(ImageConstant.imgIconlycustom,
                height: getSize(30.00),
                width: getSize(30.00),
                fit: BoxFit.fill),
            title: Text("lbl2".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.textstylepoppinsmedium181
                    .copyWith(fontSize: getFontSize(18), height: 0.89)),
            onTap: () => {onTaptf()},
          ),
          ListTile(
            leading: Image.asset(ImageConstant.imgIconlycustom1,
                height: getSize(30.00),
                width: getSize(30.00),
                fit: BoxFit.fill),
            title: Text("lbl3".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.textstylepoppinsmedium181
                    .copyWith(fontSize: getFontSize(18), height: 0.89)),
            onTap: () => {onTaptf1()},
          ),
          ListTile(
            leading: Image.asset(ImageConstant.imgIconlycustom2,
                height: getSize(30.00),
                width: getSize(30.00),
                fit: BoxFit.fill),
            title: Text("lbl4".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.textstylepoppinsmedium181
                    .copyWith(fontSize: getFontSize(18), height: 0.89)),
            onTap: () => {onTaptf2()},
          ),
          ListTile(
            leading: Image.asset(ImageConstant.imgIconlycustom3,
                height: getSize(30.00),
                width: getSize(30.00),
                fit: BoxFit.fill),
            title: Text("lbl5".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.textstylepoppinsmedium181
                    .copyWith(fontSize: getFontSize(18), height: 0.89)),
            onTap: () => {onTaptf3()},
          ),
          ListTile(
            leading: Image.asset(ImageConstant.imgIconlycustom4,
                height: getSize(30.00),
                width: getSize(30.00),
                fit: BoxFit.fill),
            title: Text("lbl6".tr,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.textstylepoppinsmedium181
                    .copyWith(fontSize: getFontSize(18), height: 0.89)),
            onTap: () => {onTapGroup29()},
          ),
        ],
      ),
    );
    
  }

  onTaptf() {
    Get.toNamed(AppRoutes.homeScreen);
  }

  onTaptf1() {
    Get.toNamed(AppRoutes.earthquakeBulletinScreen);
  }

  onTaptf2() {
    Get.toNamed(AppRoutes.factoryListScreen, arguments: "OccupationalDisaster");
  }

  onTaptf3() {
    Get.toNamed(AppRoutes.buildingScreen);
  }

  onTapGroup29() {
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
