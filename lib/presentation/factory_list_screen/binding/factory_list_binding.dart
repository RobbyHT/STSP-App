import 'package:get/get.dart';
import 'package:stsp_app/presentation/factory_list_screen/controller/factory_list_controller.dart';

class FactoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FactoryListController());
  }
}
