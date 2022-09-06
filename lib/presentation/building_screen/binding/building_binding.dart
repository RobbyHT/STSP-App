import '../controller/building_controller.dart';
import 'package:get/get.dart';

class BuildingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BuildingController());
  }
}
