// To parse this JSON data, do
//
//     final deleteModel = deleteModelFromJson(jsonString);

import 'dart:convert';

class DeleteModel {
  DeleteModel({
    required this.deleteUrl,
  });

  DeleteUrl deleteUrl;

  factory DeleteModel.fromRawJson(String str) =>
      DeleteModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteModel.fromJson(Map<String, dynamic> json) => DeleteModel(
        deleteUrl: DeleteUrl.fromJson(json["deleteUrl"]),
      );

  Map<String, dynamic> toJson() => {
        "deleteUrl": deleteUrl.toJson(),
      };
}

class DeleteUrl {
  DeleteUrl({
    required this.id,
    required this.fullUrl,
    required this.createdBy,
    required this.shortUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String fullUrl;
  String createdBy;
  String shortUrl;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory DeleteUrl.fromRawJson(String str) =>
      DeleteUrl.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeleteUrl.fromJson(Map<String, dynamic> json) => DeleteUrl(
        id: json["_id"],
        fullUrl: json["fullUrl"],
        createdBy: json["createdBy"],
        shortUrl: json["shortUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullUrl": fullUrl,
        "createdBy": createdBy,
        "shortUrl": shortUrl,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
