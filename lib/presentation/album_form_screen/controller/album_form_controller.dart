import 'dart:collection';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stsp_app/presentation/album_screen/controller/album_controller.dart';
import 'package:stsp_app/presentation/album_screen/models/album_model.dart';
import 'package:stsp_app/presentation/album_screen/repositories/album_repository.dart';

import '/core/app_export.dart';
import 'package:flutter/material.dart';

class AlbumFormController extends GetxController with StateMixin<dynamic> {
  //var imageFilePath = "".obs;

  final repo = AlbumRepository();

  final titleController = TextEditingController();

  var album_id = 0;
  var album_type = "";
  var type_id = 0;

  var selectedItem = new HashSet().obs;
  var selectState = false.obs;

  var albumFormState = AlbumFormState.IDLE.obs;
  var albumModel = new AlbumModel().obs;
  var filePath = "".obs;

  //TODO girdview看可不可以show兩個ListBuilder
  final newPhotoPaths = [].obs;

  //TODO API抓該相簿所有圖片
  getAllPhoto() async{
    albumFormState.value = AlbumFormState.LOADING;

    var result = await repo.getId(album_type, album_id);
    albumModel.value = result;

    albumFormState.value = AlbumFormState.IDLE;
    update();
  }

  void addPhoto(ImageSource imageSource) async{
    try {
      var pickedFile;
      if(imageSource == ImageSource.gallery) {
        pickedFile = await ImagePicker().pickMultiImage();
        if (pickedFile != null) newPhotoPaths.addAll(pickedFile);
      }else{
        pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
        if (pickedFile != null) newPhotoPaths.add(pickedFile);
      }
      update();

      if (pickedFile != null) {
        Map<String, dynamic> obj = {
          "album_id": album_id,
          "album_name": titleController.text,
          "album_type": album_type,
          "newPhoto": pickedFile,
        };
        await repo.edit(obj);

        await getAllPhoto();

        newPhotoPaths.clear();
        update();
      }

    } on PlatformException catch(e) {
      Get.snackbar('Error', 'Failed to pick image', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      print('Failed to pick image: $e');
    }
  }

  void delPhoto() async{
    try {
      Get.defaultDialog(
        title: '提示',
        middleText: '確定要刪除？',
        textCancel: '取消',
        textConfirm: '確定',
        titleStyle: TextStyle(
          fontWeight: FontWeight.bold
        ),
        confirmTextColor: Colors.white,
        cancelTextColor: Colors.black,
        radius: 10,
        backgroundColor: Colors.teal.shade100,
        onConfirm: () async{
          loading(true);
          await repo.delete({
            "album_type": album_type,
            "type": "photo",
            "ids": selectedItem.value
          });
          await getAllPhoto();
          loading(false);

          setSelectState();
          Get.back();
        }
      );
    } on PlatformException catch(e) {
      print('Delete photo error: $e');
    }
  }

  void setTitle() async{
    try {
      if (titleController.text != "") {
        loading(true);
        Map<String, dynamic> obj = {
          "album_id": album_id,
          "album_name": titleController.text,
          "album_type": album_type,
          "type_id": type_id,
        };
        if(album_id == 0) {
          album_id = await repo.add(obj);
        }else{
          album_id = await repo.edit(obj);
        }
        await getAllPhoto();
        loading(false);
        update();
      }
    } on PlatformException catch(e) {
      print('Set title error: $e');
    }
  }

  void loading(bool tf) {
    if(tf) {
      showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                strokeWidth: 8,
              ),
            ),
          ),
        ),
      );
    }else{
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  void setSelectState() {
    selectState.value = !selectState.value;
    selectedItem.value.clear();
    update();
  }

  void doMultiSelection(int photo_id) {
    if(selectState.value) {
      if(selectedItem.value.contains(photo_id))
        selectedItem.value.remove(photo_id);
      else
        selectedItem.value.add(photo_id);
      
      update();
    }
  }

  @override
  void onReady() async{
    album_type = Get.arguments['type'];

    if(Get.arguments['type_id'] != null) type_id = Get.arguments['type_id'];

    if(Get.arguments['albumModel'] != null) {
      albumModel.value = Get.arguments['albumModel'];
      update();
      album_id = Get.arguments['albumModel'].id;
      await getAllPhoto();
    }

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    final oneLogic = Get.find<AlbumController>();
    oneLogic.onReady();
  }
}

enum AlbumFormState { IDLE, LOADING }