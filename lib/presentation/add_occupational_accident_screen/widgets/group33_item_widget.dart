import '../controller/add_occupational_accident_controller.dart';
import '../models/group33_item_model.dart';
import 'package:flutter/material.dart';
import 'package:stsp_app/core/app_export.dart';

// ignore: must_be_immutable
class Group33ItemWidget extends StatelessWidget {
  Group33ItemWidget(this.group33ItemModelObj);

  Group33ItemModel group33ItemModelObj;

  var controller = Get.find<AddOccupationalAccidentController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: getHorizontalSize(20.00),
        top: getVerticalSize(
          1.00,
        ),
        bottom: getVerticalSize(
          1.00,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: getVerticalSize(
                    14.00,
                  ),
                  bottom: getVerticalSize(
                    11.00,
                  ),
                ),
                child: Image.asset(
                  group33ItemModelObj.img,
                  height: getSize(
                    23.00,
                  ),
                  width: getSize(
                    23.00,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: getHorizontalSize(
                  109.00,
                ),
                margin: EdgeInsets.only(
                  left: getHorizontalSize(
                    15.00,
                  ),
                ),
                child: Text(
                  group33ItemModelObj.title,
                  maxLines: null,
                  textAlign: TextAlign.left,
                  style: AppStyle.textstyleubuntucondensedregular16.copyWith(
                    fontSize: getFontSize(
                      16,
                    ),
                    letterSpacing: 0.22,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: getHorizontalSize(
              109.00,
            ),
            margin: EdgeInsets.only(
              left: getHorizontalSize(
                87.00,
              ),
            ),
            child: InkWell(
              onTap: () {
                if(group33ItemModelObj.type == "date"){
                  controller.showDate();
                }
              },
              child: TextFormField(
                controller: controller.tfController[group33ItemModelObj.id],
                keyboardType: group33ItemModelObj.type == "number" ? TextInputType.number : null,
                enabled: group33ItemModelObj.type == "date" ? false : true,
              ),
            ),
            /*child: Text(
              group33ItemModelObj.content,
              maxLines: null,
              textAlign: TextAlign.right,
              style: AppStyle.textstyleubuntucondensedregular161.copyWith(
                fontSize: getFontSize(
                  16,
                ),
                letterSpacing: 0.22,
              ),
            ),*/
          ),
        ],
      ),
    );
  }
}
