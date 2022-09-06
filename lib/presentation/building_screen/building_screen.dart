import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../menu_draweritem/controller/menu_controller.dart';
import '../menu_draweritem/menu_draweritem.dart';
import 'controller/building_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stsp_app/core/app_export.dart';

// ignore_for_file: must_be_immutable
class BuildingScreen extends GetView<BuildingController> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late InAppWebViewController _webViewController;
  String filePath = 'files/MapboxIndex.html';

  @override
  Widget build(BuildContext context) {
    Get.put(BuildingController());

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
                icon: Icon(Icons.library_books_rounded),
                /*Image.asset(ImageConstant.img117,
                    width: getHorizontalSize(30.0),
                    height: getVerticalSize(22.0),
                    fit: BoxFit.fill),*/
                onPressed: () {
                  // TODO Switch list or maps
                  Get.toNamed(AppRoutes.factoryListScreen,
                      arguments: "ConstructionSite");
                },
              ),
            ),
          ],
        ),
        key: _scaffoldKey,
        backgroundColor: ColorConstant.whiteA700,
        drawer: MenuDraweritem(MenuController()),
        body: InAppWebView(
          initialFile: filePath,
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                useShouldOverrideUrlLoading: true,
              ),
              android: AndroidInAppWebViewOptions(
                  //useHybridComposition: true
                  )),
          androidOnGeolocationPermissionsShowPrompt:
              (InAppWebViewController controller, String origin) async {
            bool? result = await showDialog<bool>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Allow access location $origin'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Allow access location $origin'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Allow'),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                    TextButton(
                      child: Text('Denied'),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                  ],
                );
              },
            );
            if (result!) {
              return Future.value(GeolocationPermissionShowPromptResponse(
                  origin: origin, allow: true, retain: true));
            } else {
              return Future.value(GeolocationPermissionShowPromptResponse(
                  origin: origin, allow: false, retain: false));
            }
          },
          onWebViewCreated: (InAppWebViewController webViewController) {
            _webViewController = webViewController;
            controller.loadWebView(_webViewController);

            webViewController.addJavaScriptHandler(
                handlerName: 'comunicationname',
                callback: (args) {
                  print(args);
                });
          },
        ),
        /*body: WebView(
          initialUrl: '',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
            _loadHtmlFromAssets();

            controller.loadWebView(_webViewController);
            // onPressed to call html file js function
            // _webViewController.evaluateJavascript('add(10, 10)');
          },
        ),*/
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Colors.grey,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            onTap: (int index) {
              controller.onItemTapped(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.apartment_rounded,
                  color: controller.s1.value
                      ? Color.fromRGBO(0, 123, 200, 1)
                      : null,
                ),
                label: controller.s1.value ? "建物圖/開" : "建物圖/關",
              ),
              BottomNavigationBarItem(
                icon: new Icon(
                  Icons.system_update_tv_outlined,
                  color: controller.s2.value
                      ? Color.fromRGBO(0, 123, 200, 1)
                      : null,
                ),
                label: controller.s2.value ? "儲存區/開" : "儲存區/關",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.lightbulb_rounded,
                  color: controller.s3.value
                      ? Color.fromRGBO(0, 123, 200, 1)
                      : null,
                ),
                label: controller.s3.value ? "乙種搶救圖/開" : "乙種搶救圖/關",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt_outlined),
                label: '拍照留存',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.location_on_outlined,
                  color: controller.s5.value
                      ? Color.fromRGBO(0, 123, 200, 1)
                      : null,
                ),
                label: '定位功能',
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*_loadHtmlFromAssets() async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }*/

  onTapImgMenu() {
    _scaffoldKey.currentState?.openDrawer();
  }
}
