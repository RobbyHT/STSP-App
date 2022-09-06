import 'dart:convert';

AlbumModel albumModelModelFromJson(String str) => AlbumModel.fromJson(json.decode(str));
String albumModelModelToJson(AlbumModel data) => json.encode(data.toJson());

class AlbumModel {
  AlbumModel({
    this.id, 
    this.name, 
    this.photos
  });

  int? id;
  String? name;
  List<PhotoModel>? photos;

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
    id: json["id"],
    name: json["name"],
    photos: List<PhotoModel>.from(json["photos"].map((x) => PhotoModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "photos": photos,
  };
}

class PhotoModel {
  PhotoModel({
    this.id, 
    this.path
  });

  int? id;
  String? path;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    id: json["id"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "path": path,
  };
}