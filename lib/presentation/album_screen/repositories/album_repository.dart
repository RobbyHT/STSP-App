
import 'package:stsp_app/presentation/album_screen/providers/album_provider.dart';

class AlbumRepository {

  final apiClient = AlbumApiClient();

  getAll(album_type, type_id){
    return apiClient.getAll(album_type, type_id);
  }
  getId(type, id){
    return apiClient.getId(type, id);
  }
  delete(obj){
    return apiClient.delete(obj);
  }
  edit(obj){
    return apiClient.edit(obj);
  }
  add(obj){
    return apiClient.add(obj);
  }

}