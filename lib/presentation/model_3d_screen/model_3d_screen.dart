// import 'package:model_viewer/model_viewer.dart';
//import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:stsp_app/core/app_export.dart';
import 'package:stsp_app/presentation/model_3d_screen/controller/model_3d_controller.dart';

class Model3DScreen extends GetWidget<Model3DController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 123, 200, 1),
          centerTitle: true,
          title: Text(
            "3D模型",
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.textstyleurbanistromanbold20.copyWith(
              fontSize: getFontSize(20),
            ),
          ),
          elevation: 0,
          leadingWidth: 100,
          leading: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: ElevatedButton.icon(
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                ImageConstant.imgIconlylightou,
                fit: BoxFit.fill,
                width: 20.0,
                height: 20.0,
              ),
              label: Text("返回"),
              style: ElevatedButton.styleFrom(
                  elevation: 0, primary: Colors.transparent),
            ),
          ),
        ),
        body: /*BabylonJSViewer(
            //src: 'https://models.babylonjs.com/boombox.glb',
            src: 'files/test.glb',
          ),*/
            ModelViewer(
          backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
          src: 'files/test.glb',
          ar: true,
          arModes: ['scene-viewer', 'webxr', 'quick-look'],
          autoRotate: true,
          //cameraControls: true,
          touchAction: TouchAction.none,
          enablePan: true,
        ),
      ),
    );
  }
}
