// To parse this JSON data, do
//
//     final shortenedModel = shortenedModelFromJson(jsonString);

import 'dart:convert';

class ShortenedModel {
  ShortenedModel({
    required this.url,
  });

  Url url;

  factory ShortenedModel.fromRawJson(String str) =>
      ShortenedModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ShortenedModel.fromJson(Map<String, dynamic> json) => ShortenedModel(
        url: Url.fromJson(json["url"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url.toJson(),
      };
}

class Url {
  Url({
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

  factory Url.fromRawJson(String str) => Url.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Url.fromJson(Map<String, dynamic> json) => Url(
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
        "createdAt": createdAt.toLocal(),
        "updatedAt": updatedAt.toLocal(),
        "__v": v,
      };
}
