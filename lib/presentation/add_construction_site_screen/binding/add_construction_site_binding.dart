import '../controller/add_construction_site_controller.dart';
import 'package:get/get.dart';

class AddConstructionSiteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddConstructionSiteController());
  }
}
