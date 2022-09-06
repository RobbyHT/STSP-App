import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../add_occupational_accident_screen/widgets/group33_item_widget.dart';
import 'controller/add_occupational_accident_controller.dart';
import 'models/group33_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stsp_app/core/app_export.dart';

class AddOccupationalAccidentScreen
    extends GetView<AddOccupationalAccidentController> {
  @override
  Widget build(BuildContext context) {
    Get.put(AddOccupationalAccidentController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.gray100,
        body: Container(
          width: size.width,
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Color.fromRGBO(0, 123, 200, 1),
                centerTitle: true,
                title: Text(
                  "lbl8".tr,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppStyle.textstyleurbanistromanbold20.copyWith(
                    fontSize: getFontSize(20),
                  ),
                ),
                elevation: 0,
                leadingWidth: 100,
                leading: ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: SvgPicture.asset(
                    ImageConstant.imgIconlylightou,
                    fit: BoxFit.fill,
                    width: 20.0,
                    height: 20.0,
                  ),
                  label: Text("lbl7".tr),
                  style: ElevatedButton.styleFrom(
                      elevation: 0, primary: Colors.transparent),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      controller.save();
                    },
                    child: Text(
                      "lbl9".tr,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
                pinned: true,
                expandedHeight: 300,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: getVerticalSize(120.00)),
                      child: Obx(
                        () => InkWell(
                          onTap: () => controller.getImage(ImageSource.gallery),
                          child: controller.imagefiles.value.length > 0
                              ? Wrap(
                                  children: controller.imagefiles.value.map(
                                    (imageone) {
                                      return Container(
                                        child: Card(
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            child: Image.file(
                                              File(imageone.path),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                                )
                              : Text("Choose image..."),
                        ),
                      ),
                    ),
                  ),
                  background: Image.asset(ImageConstant.img1,
                      height: getVerticalSize(321.00),
                      width: getHorizontalSize(390.00),
                      fit: BoxFit.fill),
                ),
              ),
              CupertinoSliverRefreshControl(
                onRefresh: () async {
                  await Future.delayed(Duration(milliseconds: 1000));
                  return Future.value(true);
                },
              ),
              SliverList(
                /*delegate: SliverChildListDelegate([
                  Group33ItemWidget(new Group33ItemModel(
                    0,
                    controller.imgText[0],
                    controller.titleText[0].tr,
                    "text"))
                ])*/
                delegate: SliverChildBuilderDelegate((ctx, idx) {
                  Group33ItemModel model;

                  switch (idx) {
                    case 6:
                      model = new Group33ItemModel(idx, controller.imgText[idx],
                          controller.titleText[idx].tr, "number");
                      break;
                    case 8:
                      model = new Group33ItemModel(idx, controller.imgText[idx],
                          controller.titleText[idx].tr, "date");
                      break;
                    default:
                      model = new Group33ItemModel(idx, controller.imgText[idx],
                          controller.titleText[idx].tr, "text");
                  }

                  return Group33ItemWidget(model);
                }, childCount: 9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
