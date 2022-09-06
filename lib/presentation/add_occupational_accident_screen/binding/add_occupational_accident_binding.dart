import '../controller/add_occupational_accident_controller.dart';
import 'package:get/get.dart';

class AddOccupationalAccidentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddOccupationalAccidentController());
  }
}
