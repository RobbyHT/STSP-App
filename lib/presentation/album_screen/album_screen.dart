import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stsp_app/presentation/album_screen/models/album_model.dart';

import 'controller/album_controller.dart';
import 'package:flutter/material.dart';
import 'package:stsp_app/core/app_export.dart';

class AlbumScreen extends GetView<AlbumController> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  final GlobalKey<FormBuilderState> _searchFormBuilderKey =
      new GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetBuilder<AlbumController>(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(0, 123, 200, 1),
              centerTitle: true,
              title: Text(
                "相簿",
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
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async {
                if (!controller.selectState.value) {
                  await Get.toNamed(AppRoutes.albumFormScreen, arguments: {
                    "type_id": Get.arguments['type_id'],
                    "type": Get.arguments['type']
                  });
                }
              },
            ),
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          name: 'title',
                          maxLines: 1,
                          decoration: InputDecoration(
                              labelText: 'Search',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 16)),
                          onChanged: (value) {
                            controller.albumFilter(value!);
                          },
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => (controller.albumState.value == AlbumState.LOADING)
                        ? Center(child: CircularProgressIndicator())
                        : Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: controller.albumList.length > 0
                                  ? CustomScrollView(
                                      physics: BouncingScrollPhysics(),
                                      slivers: <Widget>[
                                        CupertinoSliverRefreshControl(
                                          onRefresh: () async {
                                            await controller.getAllAlbum();
                                            return Future.value(true);
                                          },
                                        ),
                                        SliverToBoxAdapter(
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            primary: false,
                                            itemCount:
                                                controller.albumList.length,
                                            itemBuilder: (_, i) =>
                                                _buildAlbumTile(
                                                    controller.albumList[i]),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Text("查無資料"),
                            ),
                          ),
                  ),
                ],
              ),
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
                              '已選取 ${controller.selectedItem.value.length} 個相簿',
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
                                controller.delAlbum();
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

  Widget _buildAlbumTile(AlbumModel albumModel) {
    return GestureDetector(
      onTap: () async {
        if (controller.selectState.value) {
          controller.doMultiSelection(albumModel.id!);
        } else {
          Get.toNamed(AppRoutes.albumFormScreen, arguments: {
            "type": Get.arguments['type'],
            "type_id": Get.arguments['type_id'],
            "albumModel": albumModel
          });
        }
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: controller.selectedItem.value.contains(albumModel.id!)
                  ? Colors.red
                  : Colors.white,
              width: 5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                albumModel.name!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (albumModel.photos?.length ?? 0) < 5
                          ? (albumModel.photos?.length ?? 0)
                          : 5,
                      itemBuilder: (_, i) =>
                          _buildImage(albumModel.photos![i].path!),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(String path) {
    return ClipRRect(
      child: Image.network(
        path,
        fit: BoxFit.cover,
        height: 120,
        width: 120,
      ),
    );
  }
}
