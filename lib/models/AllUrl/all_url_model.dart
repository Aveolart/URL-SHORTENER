// To parse this JSON data, do
//
//     final allUrlModel = allUrlModelFromJson(jsonString);

import 'dart:convert';

class AllUrlModel {
  AllUrlModel({
    required this.urls,
  });

  List<Url> urls;

  factory AllUrlModel.fromRawJson(String str) =>
      AllUrlModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllUrlModel.fromJson(Map<String, dynamic> json) => AllUrlModel(
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
      };
}

class Url {
  Url({
    required this.id,
    required this.fullUrl,
    required this.shortUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String fullUrl;
  String shortUrl;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Url.fromRawJson(String str) => Url.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        id: json["_id"],
        fullUrl: json["fullUrl"],
        shortUrl: json["shortUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullUrl": fullUrl,
        "shortUrl": shortUrl,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
