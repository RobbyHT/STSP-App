import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:stsp_app/presentation/album_screen/models/album_model.dart';

const baseUrl = 'http://192.168.2.186/api/v2/construction-site-album';
const token =
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjI2MWJiMjUyZDMxYTdiMzcwNWE4M2FmZGI0NDNmMjk1MWE1ZDQzYWE4YmVkZTA0YTZiYzE4YjMxN2YyNWIyOWNjN2VkNjA5MzM0MmE1NjJkIn0.eyJhdWQiOiIyIiwianRpIjoiMjYxYmIyNTJkMzFhN2IzNzA1YTgzYWZkYjQ0M2YyOTUxYTVkNDNhYThiZWRlMDRhNmJjMThiMzE3ZjI1YjI5Y2M3ZWQ2MDkzMzQyYTU2MmQiLCJpYXQiOjE2NjE5MjUyMDgsIm5iZiI6MTY2MTkyNTIwOCwiZXhwIjoxNjYzMjIxMjA3LCJzdWIiOiIxIiwic2NvcGVzIjpbIioiXX0.mR66AJBXSCWRXXpntvFaTxbG910syWrWINBhZ8OxyuAg8wg9pjAm7H0p0VIuPiVp22CdooL4eO669UpO_rQvNej_0IqNUpoNxgyEMx7m0KThIldxwO7ryEWGfeYx3DDQqhrnlPzTvmPRtyz-Udt37cX25QPLvcuoWwf6_46DL_OGz4OHAUqLV6ECtnvZN6hRzxxOpEQ8RKwIaE-q0h0wejnmxyAyoA7bxTSloo_eS_kn_NsHKhT3E5BXRU5_Ih7q8XTLInFwAcDR7HqjRjP5AeIS1x2tRX3Ec7-c6OpeAg1cnEMvN1J4Y-NGEkKVKLkxAgvfv0ProCr8bG4nhhqZH1F_RNSeZb1H10ACNcXQ469SJupD1EsNCsHU252_0L6Y9x8bJJakMKs5HZQn_bnPFiIETw9Jbdbexbci9XYIuToo1BWN639IJAdF_FheIxvpDQTuXtbTz7sGQQFP8Lthu6mfDY6ImOOii1eymXwgatZe1x7KUDFphiJNFSV4T-t67uCeTO_xxTuEOW-FLCYhPHiHaXwgjV0hedQb0wqXqsgMlKbVK-z5PZlIObLJgN4UUACX99JvnLfGPef2dTY1a2FhRnXg0t0ouJZUc0Wg343FEF3o2hWJ8JE8t9s8KGcAaurgo1OLxGFHoX95LCXeSZguwg1_ra6ARo2o-EaDWfA';

class AlbumApiClient {
  final httpClient = Dio();

  getAll(album_type, type_id) async {
    try {
      print('loading...');
      var response = await httpClient.get(baseUrl,
          queryParameters: {"album_type": album_type, "type_id": type_id},
          options: Options(
              headers: {'Accept': 'application/json', 'Authorization': token}));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            json.decode(json.encode(response.data)) as Map<String, dynamic>;
        List<AlbumModel> listAlbumModel = jsonResponse['data']
            .map<AlbumModel>((map) => AlbumModel.fromJson(map))
            .toList();

        return listAlbumModel;
      } else
        print('erro -getAll');
    } catch (_) {
      print(_.toString());
    }
  }

  getId(type, id) async {
    try {
      print('loading...');
      var response = await httpClient.get('${baseUrl}/${id}',
          queryParameters: {"album_id": id, "album_type": type},
          options: Options(
              headers: {'Accept': 'application/json', 'Authorization': token}));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            json.decode(json.encode(response.data)) as Map<String, dynamic>;
        AlbumModel albumModel = AlbumModel.fromJson(jsonResponse['data']);

        return albumModel;
      } else
        print('erro -getAll');
    } catch (_) {
      print(_.toString());
    }
  }

  add(obj) async {
    try {
      var formData = FormData();
      formData.fields.add(
          MapEntry<String, String>('album_name', obj['album_name'].toString()));
      formData.fields.add(
          MapEntry<String, String>('album_type', obj['album_type'].toString()));
      formData.fields
          .add(MapEntry<String, String>('type_id', obj['type_id'].toString()));

      // ignore: unnecessary_brace_in_string_interps
      var response = await httpClient.post(baseUrl,
          data: formData, options: Options(headers: {'Authorization': token}));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(json.encode(response.data));
        return jsonResponse['data'];
      } else
        print('erro -add');
    } catch (_) {
      print(_);
    }
  }

  edit(obj) async {
    try {
      var formData = FormData();

      print('----');
      formData.fields.add(
          MapEntry<String, String>('album_id', obj['album_id'].toString()));
      formData.fields.add(
          MapEntry<String, String>('album_name', obj['album_name'].toString()));
      formData.fields.add(
          MapEntry<String, String>('album_type', obj['album_type'].toString()));

      if (obj['newPhoto'] != null) {
        if (obj['newPhoto'] is List<XFile>)
          formData.files.addAll(obj['newPhoto']
              .map<MapEntry<String, MultipartFile>>(
                  (file) => _createMapEntryFromFile(File(file.path))));
        else
          formData.files
              .add(_createMapEntryFromFile(File(obj['newPhoto'].path)));
      }

      // ignore: unnecessary_brace_in_string_interps
      var response = await httpClient.post(baseUrl,
          data: formData, options: Options(headers: {'Authorization': token}));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(json.encode(response.data));
        return jsonResponse['data'];
      } else
        print('erro -add');
    } catch (_) {
      print(_);
    }
  }

  delete(obj) async {
    try {
      // ignore: unnecessary_brace_in_string_interps
      var response = await httpClient.delete('${baseUrl}/0',
          data: {
            "album_type": obj["album_type"],
            "type": obj["type"],
            "ids": obj["ids"].toList()
          },
          options: Options(headers: {'Authorization': token}));
    } catch (_) {
      print(_);
    }
  }

  MapEntry<String, MultipartFile> _createMapEntryFromFile(File image) {
    return MapEntry<String, MultipartFile>('file[]',
        MultipartFile.fromFileSync(image.path, filename: basename(image.path)));
  }
}
