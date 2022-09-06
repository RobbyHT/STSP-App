import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stsp_app/core/app_export.dart';
import 'package:stsp_app/presentation/album_form_screen/controller/album_form_controller.dart';

// ignore: must_be_immutable
class ImageSourceWidget extends StatelessWidget {

  var controller = Get.find<AlbumFormController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.camera_enhance),
            title: Text('Camera'),
            onTap: () {
              controller.addPhoto(ImageSource.camera);
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Gallery'),
            onTap: () {
              controller.addPhoto(ImageSource.gallery);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
