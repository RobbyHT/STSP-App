import '../controller/model_3d_controller.dart';
import 'package:get/get.dart';

class Model3DBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Model3DController());
  }
}
