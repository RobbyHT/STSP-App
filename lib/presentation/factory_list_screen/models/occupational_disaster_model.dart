// To parse this JSON data, do
//
//     final occupationalDisasterModel = occupationalDisasterModelModelFromJson(jsonString);

import 'dart:convert';

OccupationalDisasterModel factoryListModelFromJson(String str) => OccupationalDisasterModel.fromJson(json.decode(str));

String occupationalDisasterModelToJson(OccupationalDisasterModel data) => json.encode(data.toJson());

class OccupationalDisasterModel {
  OccupationalDisasterModel({
    this.id,
    this.oid,
    this.name,
    this.address,
    this.person,
    this.phone,
    this.date,
    this.time,
    this.other
  });

  int? id;
  String? oid;
  String? name;
  String? address;
  String? person;
  String? phone;
  String? date;
  String? time;
  String? other;

  factory OccupationalDisasterModel.fromJson(Map<String, dynamic> json) => OccupationalDisasterModel(
    id: json["id"],
    oid: json["oid"],
    name: json["name"],
    address: json["address"],
    person: json["person"],
    phone: json["phone"],
    date: json["date"],
    time: json["time"],
    other: json["other"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "address": address,
  };
}
