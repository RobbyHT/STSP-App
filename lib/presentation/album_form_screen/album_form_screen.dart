import 'dart:io';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stsp_app/presentation/album_form_screen/widgets/image_source_widget.dart';
import 'package:stsp_app/presentation/album_screen/models/album_model.dart';

import 'controller/album_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:stsp_app/core/app_export.dart';

class AlbumFormScreen extends GetWidget<AlbumFormController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetBuilder<AlbumFormController>(
        //init: AlbumFormController(repo: null),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(0, 123, 200, 1),
              centerTitle: true,
              title: Text(
                controller.albumModel.value.name ?? "新增相簿",
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
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: Icon(controller.selectState.value
                        ? Icons.disabled_by_default
                        : Icons.library_add_check),
                    onPressed: () {
                      controller.setSelectState();
                    },
                  ),
                ),
              ],
            ),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        controller: controller.titleController
                          ..text = controller.albumModel.value.name ?? "",
                        name: 'title',
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                        ),
                        onSubmitted: (_) => controller.setTitle(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: controller.album_id != 0
                      ? GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3, childAspectRatio: 1.0),
                          children: <Widget>[
                            GestureDetector(
                              child: Container(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withAlpha(50),
                                  child: Container(
                                    width: 110,
                                    height: 110,
                                    child: Icon(
                                      Icons.camera_enhance,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () {
                                if (!controller.selectState.value) {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (_) {
                                      return ImageSourceWidget();
                                    },
                                  );
                                }
                              },
                            ),
                            ...?controller.albumModel.value.photos?.map(
                              (photo) {
                                return GestureDetector(
                                  child: Container(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 300,
                                            width: 300,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                photo.path!,
                                                fit: BoxFit.cover,
                                                height: 120,
                                                width: 120,
                                                color: Colors.black.withOpacity(
                                                    controller
                                                            .selectedItem.value
                                                            .contains(photo.id!)
                                                        ? 1
                                                        : 0),
                                                colorBlendMode: BlendMode.color,
                                              ),
                                            ),
                                          ),
                                          Visibility(
                                            visible: controller
                                                .selectedItem.value
                                                .contains(photo.id!),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () =>
                                      controller.doMultiSelection(photo.id!),
                                );
                              },
                            ).toList(),
                            ...controller.newPhotoPaths.value.map(
                              (photo) {
                                return GestureDetector(
                                  child: Container(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        height: 110,
                                        width: 110,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.file(
                                            File(photo.path),
                                            fit: BoxFit.cover,
                                            height: 120,
                                            width: 120,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () =>
                                      controller.doMultiSelection(photo.id!),
                                );
                              },
                            ).toList(),
                          ],
                        )
                      : Text(
                          "請先輸入相簿名稱！",
                          style: TextStyle(color: Colors.red),
                        ),
                ),
              ],
            ),
            bottomNavigationBar: Visibility(
              visible: controller.selectState.value,
              child: Container(
                height: 80,
                padding: const EdgeInsets.all(12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    color: Colors.lightBlue.withOpacity(0.3),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '已選取 ${controller.selectedItem.value.length} 張照片',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                //
                                controller.delPhoto();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
