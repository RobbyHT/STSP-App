import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:stsp_app/presentation/album_screen/models/album_model.dart';
import 'package:stsp_app/presentation/album_screen/repositories/album_repository.dart';
import '/core/app_export.dart';

class AlbumController extends GetxController with StateMixin<dynamic> {
  
  final repo = AlbumRepository();

  var type_id = 0;
  var album_type = "";
  var selectedItem = new HashSet().obs;
  var selectState = false.obs;

  var allAlbumList = <AlbumModel>[];
  var albumList = <AlbumModel>[].obs;
  var albumState = AlbumState.IDLE.obs;

  getAllAlbum() async{
    var result = await repo.getAll(album_type, type_id);
    
    allAlbumList = result;
    albumList.value = result;
  }

  void albumFilter(String str) {
    if (str.isEmpty) {
      albumList.value = allAlbumList;
    }else{
      albumList.value = allAlbumList
          .where((album) =>
              album.name!.toLowerCase().contains(str.toLowerCase()))
          .toList();
      print(albumList.length);
    }

    update();
  }

  void delAlbum() async{
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
            "type": "album",
            "ids": selectedItem.value
          });
          await getAllAlbum();
          loading(false);

          setSelectState();
          Get.back();
        }
      );
    } on PlatformException catch(e) {
      print('Delete photo error: $e');
    }
  }

  void setSelectState() {
    selectState.value = !selectState.value;
    selectedItem.value.clear();
    update();
  }

  void doMultiSelection(int album_id) {
    if(selectedItem.value.contains(album_id))
      selectedItem.value.remove(album_id);
    else
      selectedItem.value.add(album_id);
    
    update();
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

  @override
  void onReady() async{
    type_id = Get.arguments['type_id'];
    album_type = Get.arguments['type'];
    albumState.value = AlbumState.LOADING;
    await getAllAlbum();
    albumState.value = AlbumState.IDLE;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

enum AlbumState { IDLE, LOADING }