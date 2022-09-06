import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stsp_app/presentation/building_screen/building_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '/core/app_export.dart';
import 'package:stsp_app/presentation/building_screen/models/building_model.dart';

class BuildingController extends GetxController with StateMixin<dynamic> {
  Rx<BuildingModel> buildingModelObj = BuildingModel().obs;
  
  var selectedIndex = 0.obs;
  var s1 = true.obs;
  var s2 = false.obs;
  var s3 = false.obs;
  var s5 = false.obs;

  String geoJson = "";
  var sourceId = 'building_data';

  late InAppWebViewController _webViewController;

  void loadWebView(InAppWebViewController webViewController) {
    _webViewController = webViewController;
  }

  void onItemTapped(int index) async{
    switch (index) {
      case 0:
        s1(!s1.value);
        var result = await _webViewController.evaluateJavascript(source: "setBuilding('building-layer');");
        print(result);
        break;
      case 1:
        s2(!s2.value);
        break;
      case 2:
        s3(!s3.value);
        break;
      case 3:
        await Get.toNamed(AppRoutes.albumScreen);
        break;
      case 4:
        var result = await _webViewController.evaluateJavascript(source: "setLocate();");
        s5(result);
        break;
      default:
    }

    selectedIndex(index);
  }

  void requestPermission() async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.location].request();
  }

  @override
  void onReady() {
    super.onReady();
    requestPermission();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
