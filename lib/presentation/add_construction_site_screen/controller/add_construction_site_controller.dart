import '/core/app_export.dart';
import 'package:stsp_app/presentation/add_construction_site_screen/models/add_construction_site_model.dart';

class AddConstructionSiteController extends GetxController
    with StateMixin<dynamic> {
  Rx<AddConstructionSiteModel> addConstructionSiteModelObj =
      AddConstructionSiteModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
