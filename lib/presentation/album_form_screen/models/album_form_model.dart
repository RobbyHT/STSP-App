// To parse this JSON data, do
//
//     final albumFormModel = albumFormModelFromJson(jsonString);

import 'dart:convert';

AlbumFormModel albumFormModelFromJson(String str) => AlbumFormModel.fromJson(json.decode(str));

String albumFormModelToJson(AlbumFormModel data) => json.encode(data.toJson());

class AlbumFormModel {
    AlbumFormModel({
        required this.data,
        required this.links,
        required this.meta,
    });

    List<Datum> data;
    Links links;
    Meta meta;

    factory AlbumFormModel.fromJson(Map<String, dynamic> json) => AlbumFormModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
    };
}

class Datum {
    Datum({
        this.groupId,
        this.groupName,
        this.constructionSiteId,
        this.constructionSiteAddress,
        this.constructionSiteNumber,
        this.constructionSiteOrgUnit,
        this.constructionSiteDeletedAt,
        required this.constructionSiteCreatedAt,
        required this.constructionSiteUpdatedAt,
    });

    int? groupId;
    String? groupName;
    int? constructionSiteId;
    String? constructionSiteAddress;
    String? constructionSiteNumber;
    String? constructionSiteOrgUnit;
    dynamic constructionSiteDeletedAt;
    DateTime constructionSiteCreatedAt;
    DateTime constructionSiteUpdatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        groupId: json["group_id"],
        groupName: json["group_name"],
        constructionSiteId: json["construction_site_id"],
        constructionSiteAddress: json["construction_site_address"],
        constructionSiteNumber: json["construction_site_number"] == null ? null : json["construction_site_number"],
        constructionSiteOrgUnit: json["construction_site_org_unit"],
        constructionSiteDeletedAt: json["construction_site_deleted_at"],
        constructionSiteCreatedAt: DateTime.parse(json["construction_site_created_at"]),
        constructionSiteUpdatedAt: DateTime.parse(json["construction_site_updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "group_id": groupId,
        "group_name": groupName,
        "construction_site_id": constructionSiteId,
        "construction_site_address": constructionSiteAddress,
        "construction_site_number": constructionSiteNumber == null ? null : constructionSiteNumber,
        "construction_site_org_unit": constructionSiteOrgUnit,
        "construction_site_deleted_at": constructionSiteDeletedAt,
        "construction_site_created_at": constructionSiteCreatedAt.toIso8601String(),
        "construction_site_updated_at": constructionSiteUpdatedAt.toIso8601String(),
    };
}

class Links {
    Links({
        this.first,
        this.last,
        this.prev,
        this.next,
    });

    String? first;
    String? last;
    dynamic prev;
    String? next;

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}

class Meta {
    Meta({
        this.currentPage,
        this.from,
        this.lastPage,
        this.path,
        this.perPage,
        this.to,
        this.total,
    });

    int? currentPage;
    int? from;
    int? lastPage;
    String? path;
    int? perPage;
    int? to;
    int? total;

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
    };
}
