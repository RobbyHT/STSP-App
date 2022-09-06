import '/core/app_export.dart';
import 'package:stsp_app/presentation/earthquake_bulletin_screen/models/earthquake_bulletin_model.dart';

class EarthquakeBulletinController extends GetxController
    with StateMixin<dynamic> {
  Rx<EarthquakeBulletinModel> earthquakeBulletinModelObj =
      EarthquakeBulletinModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
