import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '/core/app_export.dart';
import 'package:stsp_app/presentation/add_occupational_accident_screen/models/add_occupational_accident_model.dart';

class AddOccupationalAccidentController extends GetxController
    with StateMixin<dynamic> {
  Rx<AddOccupationalAccidentModel> addOccupationalAccidentModelObj =
      AddOccupationalAccidentModel().obs;
  
  var tfController = List.generate(9, (i) => TextEditingController());
  var selectedDate = DateTime.now().obs;

  List<String> imgText = [ImageConstant.img11, ImageConstant.img113, ImageConstant.img12, ImageConstant.img13, ImageConstant.img14, ImageConstant.img15, ImageConstant.img16, ImageConstant.img17, ImageConstant.img18];
  List<String> titleText = ['lbl13', 'lbl14', 'lbl15', 'lbl16', 'lbl17', 'lbl18', 'lbl19', 'lbl20', 'lbl21'];

  RxString path = "".obs;

  var count = 0.obs;

  //File? image;
  var imagefiles = [].obs;

  void getImage(ImageSource imageSource) async{
    try {
      // final pickedFile = await ImagePicker().pickImage(source: imageSource);
      final pickedFiles = await ImagePicker().pickMultiImage();
      if (pickedFiles != null) {
        imagefiles.value = pickedFiles;
      }else{
        Get.snackbar('Error', 'No image selected', snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      }
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  void setInput(int index, String value) {
    print("123");
    switch (index) {
      case 0:
        print("工程名稱：");
        break;
      case 1:
        print("事業單位名稱：$value");
        break;
      case 2:
        print("負責人(代表人)：$value");
        break;
      case 3:
        print("詳細地址：$value");
        break;
      default:
    }
  }

  void save() {
    
    print(tfController[1].text);
  }

  void showDate() async{
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
      tfController[8].text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }


  /*Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      final imageTemp = File(image.path);

      this.image = imageTemp;
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);

      this.image = imageTemp;
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }*/

  void increment(String str) {
    str += count.toString();
    path = str.obs;
    count++;
  }

  void increment2() {
    count++;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tfController.forEach((element) {
      element.dispose();
    });
  }
}
