import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:stsp_app/presentation/album_form_screen/models/album_form_model.dart';
import 'package:stsp_app/presentation/factory_list_screen/models/factory_list_model.dart';

//const baseUrl = 'https://jsonplaceholder.typicode.com/todos';
const baseUrl = 'http://192.168.2.186/api/v2/getAllForApp';

class FactoryListApiClient {
  final httpClient = Dio();

  // GET API OK
  getAll(type) async {
    try {
      print('loading...');
      var response = await httpClient.get(baseUrl,
          queryParameters: {"album_type": type},
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjI2MWJiMjUyZDMxYTdiMzcwNWE4M2FmZGI0NDNmMjk1MWE1ZDQzYWE4YmVkZTA0YTZiYzE4YjMxN2YyNWIyOWNjN2VkNjA5MzM0MmE1NjJkIn0.eyJhdWQiOiIyIiwianRpIjoiMjYxYmIyNTJkMzFhN2IzNzA1YTgzYWZkYjQ0M2YyOTUxYTVkNDNhYThiZWRlMDRhNmJjMThiMzE3ZjI1YjI5Y2M3ZWQ2MDkzMzQyYTU2MmQiLCJpYXQiOjE2NjE5MjUyMDgsIm5iZiI6MTY2MTkyNTIwOCwiZXhwIjoxNjYzMjIxMjA3LCJzdWIiOiIxIiwic2NvcGVzIjpbIioiXX0.mR66AJBXSCWRXXpntvFaTxbG910syWrWINBhZ8OxyuAg8wg9pjAm7H0p0VIuPiVp22CdooL4eO669UpO_rQvNej_0IqNUpoNxgyEMx7m0KThIldxwO7ryEWGfeYx3DDQqhrnlPzTvmPRtyz-Udt37cX25QPLvcuoWwf6_46DL_OGz4OHAUqLV6ECtnvZN6hRzxxOpEQ8RKwIaE-q0h0wejnmxyAyoA7bxTSloo_eS_kn_NsHKhT3E5BXRU5_Ih7q8XTLInFwAcDR7HqjRjP5AeIS1x2tRX3Ec7-c6OpeAg1cnEMvN1J4Y-NGEkKVKLkxAgvfv0ProCr8bG4nhhqZH1F_RNSeZb1H10ACNcXQ469SJupD1EsNCsHU252_0L6Y9x8bJJakMKs5HZQn_bnPFiIETw9Jbdbexbci9XYIuToo1BWN639IJAdF_FheIxvpDQTuXtbTz7sGQQFP8Lthu6mfDY6ImOOii1eymXwgatZe1x7KUDFphiJNFSV4T-t67uCeTO_xxTuEOW-FLCYhPHiHaXwgjV0hedQb0wqXqsgMlKbVK-z5PZlIObLJgN4UUACX99JvnLfGPef2dTY1a2FhRnXg0t0ouJZUc0Wg343FEF3o2hWJ8JE8t9s8KGcAaurgo1OLxGFHoX95LCXeSZguwg1_ra6ARo2o-EaDWfA'
          }));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            json.decode(json.encode(response.data)) as Map<String, dynamic>;

        List<FactoryListModel> listMyModel = jsonResponse['data']
            .map<FactoryListModel>((map) => FactoryListModel.fromJson(map))
            .toList();

        print('show print...');

        return listMyModel;
      } else
        print('erro -getAll');
    } catch (_) {
      print(_.toString());
    }
  }

  // TODO 因為API回傳欄位不同，可能要建不同Model，但GET已測試OK，所以不在測試，請改測試POST(add)
  getId(id) async {
    try {
      print('loading...');
      var response = await httpClient.get('${baseUrl}/${id}',
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization':
                'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjI2MWJiMjUyZDMxYTdiMzcwNWE4M2FmZGI0NDNmMjk1MWE1ZDQzYWE4YmVkZTA0YTZiYzE4YjMxN2YyNWIyOWNjN2VkNjA5MzM0MmE1NjJkIn0.eyJhdWQiOiIyIiwianRpIjoiMjYxYmIyNTJkMzFhN2IzNzA1YTgzYWZkYjQ0M2YyOTUxYTVkNDNhYThiZWRlMDRhNmJjMThiMzE3ZjI1YjI5Y2M3ZWQ2MDkzMzQyYTU2MmQiLCJpYXQiOjE2NjE5MjUyMDgsIm5iZiI6MTY2MTkyNTIwOCwiZXhwIjoxNjYzMjIxMjA3LCJzdWIiOiIxIiwic2NvcGVzIjpbIioiXX0.mR66AJBXSCWRXXpntvFaTxbG910syWrWINBhZ8OxyuAg8wg9pjAm7H0p0VIuPiVp22CdooL4eO669UpO_rQvNej_0IqNUpoNxgyEMx7m0KThIldxwO7ryEWGfeYx3DDQqhrnlPzTvmPRtyz-Udt37cX25QPLvcuoWwf6_46DL_OGz4OHAUqLV6ECtnvZN6hRzxxOpEQ8RKwIaE-q0h0wejnmxyAyoA7bxTSloo_eS_kn_NsHKhT3E5BXRU5_Ih7q8XTLInFwAcDR7HqjRjP5AeIS1x2tRX3Ec7-c6OpeAg1cnEMvN1J4Y-NGEkKVKLkxAgvfv0ProCr8bG4nhhqZH1F_RNSeZb1H10ACNcXQ469SJupD1EsNCsHU252_0L6Y9x8bJJakMKs5HZQn_bnPFiIETw9Jbdbexbci9XYIuToo1BWN639IJAdF_FheIxvpDQTuXtbTz7sGQQFP8Lthu6mfDY6ImOOii1eymXwgatZe1x7KUDFphiJNFSV4T-t67uCeTO_xxTuEOW-FLCYhPHiHaXwgjV0hedQb0wqXqsgMlKbVK-z5PZlIObLJgN4UUACX99JvnLfGPef2dTY1a2FhRnXg0t0ouJZUc0Wg343FEF3o2hWJ8JE8t9s8KGcAaurgo1OLxGFHoX95LCXeSZguwg1_ra6ARo2o-EaDWfA'
          }));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            json.decode(json.encode(response.data)) as Map<String, dynamic>;

        print(jsonResponse['data']);

        Datum myModel = Datum.fromJson(jsonResponse['data']);
        print(myModel);

        print('show print...');

        return myModel.groupName;
      } else
        print('erro -getAll');
    } catch (_) {}
  }

  // GET API OK
  add(obj) async {
    try {
      var formData = FormData();
      formData.files.addAll(obj.imagePaths.map<MapEntry<String, MultipartFile>>(
          (image) => _createMapEntryFromFile(image)));

      print(formData);

      // ignore: unnecessary_brace_in_string_interps
      var response = await httpClient.post(baseUrl,
          data: formData,
          options: Options(
              headers: {'Content-Type': 'application/x-www-form-urlencoded'}));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.data);
        //
        return jsonResponse;
      } else
        print('erro -add');
    } catch (_) {}
  }

  edit(obj) async {
    //
  }

  delete(id) async {
    //
  }

  MapEntry<String, MultipartFile> _createMapEntryFromFile(File image) {
    return MapEntry<String, MultipartFile>('images',
        MultipartFile.fromFileSync(image.path, filename: basename(image.path)));
  }
}
