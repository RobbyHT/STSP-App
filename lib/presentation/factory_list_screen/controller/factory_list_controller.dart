import 'package:flutter/material.dart';
import 'package:stsp_app/presentation/factory_list_screen/models/factory_list_model.dart';
import 'package:stsp_app/presentation/factory_list_screen/repositories/factory_list_repository.dart';

import '/core/app_export.dart';

class FactoryListController extends GetxController with StateMixin<dynamic> {

  final repo = FactoryListRepository();

  var type = "";
  var allFactoryList = <FactoryListModel>[];
  var factoryList = <FactoryListModel>[].obs;
  var factoryListState = FactoryListState.IDLE.obs;
  
  getAllFactoryList() async{
    allFactoryList.assignAll(await repo.getAll(type));
    factoryList.assignAll(allFactoryList);
    update();
  }

  void factoryFilter(String str) {
    if (str.isEmpty) {
      factoryList.value = allFactoryList;
    }else{
      factoryList.value = allFactoryList
          .where((factory) =>
              factory.name.toLowerCase().contains(str.toLowerCase()) ||
              factory.address.toLowerCase().contains(str.toLowerCase()) ||
              factory.person.toLowerCase().contains(str.toLowerCase()) ||
              factory.phone.toLowerCase().contains(str.toLowerCase()) ||
              factory.oid.toLowerCase().contains(str.toLowerCase()) ||
              factory.other.toLowerCase().contains(str.toLowerCase())
          )
          .toList();
    }

    update();
  }

  @override
  void onReady() async {
    factoryListState.value = FactoryListState.LOADING;
    type = Get.arguments;
    await getAllFactoryList();
    factoryListState.value = FactoryListState.IDLE;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

enum FactoryListState { IDLE, LOADING }