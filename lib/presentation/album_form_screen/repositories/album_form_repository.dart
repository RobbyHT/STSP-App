
import 'package:stsp_app/presentation/album_form_screen/providers/album_form_provider.dart';

class AlbumFormRepository {

  final apiClient = AlbumFormApiClient();

  getAll(){
    return apiClient.getAll();
  }
  getId(id){
    return apiClient.getId(id);
  }
  delete(id){
    return apiClient.delete(id);
  }
  edit(obj){
    return apiClient.edit( obj );
  }
  add(obj){
    return apiClient.add( obj );
  }

}