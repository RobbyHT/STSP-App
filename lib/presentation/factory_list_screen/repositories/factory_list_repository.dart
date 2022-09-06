import 'package:stsp_app/presentation/factory_list_screen/providers/factory_list_provider.dart';

class FactoryListRepository {

  final apiClient = FactoryListApiClient();

  getAll(type){
    return apiClient.getAll(type);
  }
  getId(id){
    return apiClient.getId(id);
  }
  delete(id){
    return apiClient.delete(id);
  }
  edit(obj){
    return apiClient.edit(obj);
  }
  add(obj){
    return apiClient.add(obj);
  }

}