import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'controller/factory_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:stsp_app/core/app_export.dart';

class FactoryListScreen extends GetWidget<FactoryListController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GetBuilder<FactoryListController>(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(0, 123, 200, 1),
              centerTitle: true,
              title: Text(
                Get.arguments == "OccupationalDisaster" ? "職災列表" : "工地列表",
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
            body: Column(
              children: [
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
                          controller.factoryFilter(value!);
                        },
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => (controller.factoryListState.value ==
                          FactoryListState.LOADING)
                      ? Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: CustomScrollView(
                            physics: BouncingScrollPhysics(),
                            slivers: <Widget>[
                              CupertinoSliverRefreshControl(
                                onRefresh: () async {
                                  await controller.getAllFactoryList();
                                  return Future.value(true);
                                },
                              ),
                              SliverToBoxAdapter(
                                child: ListView.builder(
                                  padding: EdgeInsets.all(10.0),
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount: controller.factoryList.length,
                                  itemBuilder: (_, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.albumScreen,
                                            arguments: {
                                              "type_id": controller
                                                  .factoryList[index].id,
                                              "type": Get.arguments,
                                            });
                                      },
                                      child: Card(
                                        child: CustomListItemTwo(
                                          thumbnail: Get.arguments ==
                                                  "OccupationalDisaster"
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(controller
                                                        .factoryList[index]
                                                        .oid),
                                                    Column(
                                                      children: [
                                                        Text(controller
                                                            .factoryList[index]
                                                            .date),
                                                        Text(controller
                                                            .factoryList[index]
                                                            .time),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : null,
                                          name: controller
                                              .factoryList[index].name,
                                          address: controller
                                              .factoryList[index].address,
                                          person: controller
                                              .factoryList[index].person,
                                          phone: controller
                                              .factoryList[index].phone,
                                          other: controller
                                              .factoryList[index].other,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    Key? key,
    required this.name,
    required this.address,
    required this.person,
    required this.phone,
    required this.other,
  }) : super(key: key);

  final String name;
  final String address;
  final String person;
  final String phone;
  final String other;

  @override
  Widget build(BuildContext context) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.vertical,
      children: <Widget>[
        Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.visible,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 2.0)),
        Text(
          address,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black54,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                other,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$person ($phone)',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    Key? key,
    this.thumbnail,
    required this.name,
    required this.address,
    required this.person,
    required this.phone,
    required this.other,
  }) : super(key: key);

  final Widget? thumbnail;
  final String name;
  final String address;
  final String person;
  final String phone;
  final String other;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SizedBox(
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Visibility(
                  visible: thumbnail != null,
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: thumbnail,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                    child: _ArticleDescription(
                      name: name,
                      address: address,
                      person: person,
                      phone: phone,
                      other: other,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        //Divider(),
      ],
    );
  }
}
