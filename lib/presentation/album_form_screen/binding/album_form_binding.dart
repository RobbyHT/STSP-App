import '../controller/album_form_controller.dart';
import 'package:get/get.dart';

class AlbumFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumFormController());
  }
}
