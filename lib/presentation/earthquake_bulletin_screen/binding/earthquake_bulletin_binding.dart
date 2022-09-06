import '../controller/earthquake_bulletin_controller.dart';
import 'package:get/get.dart';

class EarthquakeBulletinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EarthquakeBulletinController());
  }
}
