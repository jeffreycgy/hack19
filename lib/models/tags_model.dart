// To parse this JSON data, do
//
//     final tags = tagsFromJson(jsonString);

import 'dart:convert';

Tags tagsFromJson(String str) => Tags.fromJson(json.decode(str));

String tagsToJson(Tags data) => json.encode(data.toJson());

class Tags {
  List<Item> items;
  bool hasMore;
  int quotaMax;
  int quotaRemaining;

  Tags({
    this.items,
    this.hasMore,
    this.quotaMax,
    this.quotaRemaining,
  });

  factory Tags.fromJson(Map<String, dynamic> json) => new Tags(
        items: new List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        hasMore: json["has_more"],
        quotaMax: json["quota_max"],
        quotaRemaining: json["quota_remaining"],
      );

  Map<String, dynamic> toJson() => {
        "items": new List<dynamic>.from(items.map((x) => x.toJson())),
        "has_more": hasMore,
        "quota_max": quotaMax,
        "quota_remaining": quotaRemaining,
      };
}

class Item {
  bool hasSynonyms;
  bool isModeratorOnly;
  bool isRequired;
  int count;
  String name;

  Item({
    this.hasSynonyms,
    this.isModeratorOnly,
    this.isRequired,
    this.count,
    this.name,
  });

  factory Item.fromJson(Map<String, dynamic> json) => new Item(
        hasSynonyms: json["has_synonyms"],
        isModeratorOnly: json["is_moderator_only"],
        isRequired: json["is_required"],
        count: json["count"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "has_synonyms": hasSynonyms,
        "is_moderator_only": isModeratorOnly,
        "is_required": isRequired,
        "count": count,
        "name": name,
      };
}
