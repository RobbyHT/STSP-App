import '../controller/album_controller.dart';
import 'package:get/get.dart';

class AlbumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumController());
  }
}
