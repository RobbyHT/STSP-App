import 'package:stsp_app/presentation/model_3d_screen/models/model_3d_model.dart';

import '/core/app_export.dart';
import 'package:flutter/material.dart';

class Model3DController extends GetxController with StateMixin<dynamic> {
  TextEditingController tfController = TextEditingController();

  TextEditingController tfController1 = TextEditingController();

  Rx<Model3DModel> loginModelObj = Model3DModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tfController.dispose();
    tfController1.dispose();
  }
}
