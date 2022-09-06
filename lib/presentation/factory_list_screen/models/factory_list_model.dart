// To parse this JSON data, do
//
//     final factoryListModel = factoryListModelFromJson(jsonString);

import 'dart:convert';

FactoryListModel factoryListModelFromJson(String str) => FactoryListModel.fromJson(json.decode(str));

String factoryListModelToJson(FactoryListModel data) => json.encode(data.toJson());

class FactoryListModel {
  FactoryListModel({
    required this.id,
    required this.oid,
    required this.name,
    required this.address,
    required this.person,
    required this.phone,
    required this.date,
    required this.time,
    required this.other
  });

  int id;
  String oid;
  String name;
  String address;
  String person;
  String phone;
  String date;
  String time;
  String other;

  factory FactoryListModel.fromJson(Map<String, dynamic> json) => FactoryListModel(
    id: json["id"],
    oid: json["oid"] ?? "",
    name: json["name"] ?? "",
    address: json["address"] ?? "",
    person: json["person"] ?? "",
    phone: json["phone"] ?? "",
    date: json["date"] ?? "",
    time: json["time"] ?? "",
    other: json["other"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "oid": oid,
    "name": name,
    "address": address,
    "person": person,
    "phone": phone,
    "date": date,
    "time": time,
    "other": other,
  };
}
