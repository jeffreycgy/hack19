// To parse this JSON data, do
//
//     final Feed = FeedFromJson(jsonString);

import 'dart:convert';

Feed feedFromJson(String str) => Feed.fromJson(json.decode(str));

String feedToJson(Feed data) => json.encode(data.toJson());

class Feed {
  List<Item> items;
  bool hasMore;
  int quotaMax;
  int quotaRemaining;

  Feed({
    this.items,
    this.hasMore,
    this.quotaMax,
    this.quotaRemaining,
  });

  factory Feed.fromJson(Map<String, dynamic> json) => new Feed(
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
  List<String> tags;
  Owner owner;
  bool isAnswered;
  int viewCount;
  int answerCount;
  int score;
  int lastActivityDate;
  int creationDate;
  int questionId;
  String link;
  String title;
  String body;
  int lastEditDate;
  int closedDate;
  String closedReason;
  int acceptedAnswerId;

  Item({
    this.tags,
    this.owner,
    this.isAnswered,
    this.viewCount,
    this.answerCount,
    this.score,
    this.lastActivityDate,
    this.creationDate,
    this.questionId,
    this.link,
    this.title,
    this.body,
    this.lastEditDate,
    this.closedDate,
    this.closedReason,
    this.acceptedAnswerId,
  });

  factory Item.fromJson(Map<String, dynamic> json) => new Item(
        tags: new List<String>.from(json["tags"].map((x) => x)),
        owner: Owner.fromJson(json["owner"]),
        isAnswered: json["is_answered"],
        viewCount: json["view_count"],
        answerCount: json["answer_count"],
        score: json["score"],
        lastActivityDate: json["last_activity_date"],
        creationDate: json["creation_date"],
        questionId: json["question_id"],
        link: json["link"],
        title: json["title"],
        body: json["body"],
        lastEditDate:
            json["last_edit_date"] == null ? null : json["last_edit_date"],
        closedDate: json["closed_date"] == null ? null : json["closed_date"],
        closedReason:
            json["closed_reason"] == null ? null : json["closed_reason"],
        acceptedAnswerId: json["accepted_answer_id"] == null
            ? null
            : json["accepted_answer_id"],
      );

  Map<String, dynamic> toJson() => {
        "tags": new List<dynamic>.from(tags.map((x) => x)),
        "owner": owner.toJson(),
        "is_answered": isAnswered,
        "view_count": viewCount,
        "answer_count": answerCount,
        "score": score,
        "last_activity_date": lastActivityDate,
        "creation_date": creationDate,
        "question_id": questionId,
        "link": link,
        "title": title,
        "body": body,
        "last_edit_date": lastEditDate == null ? null : lastEditDate,
        "closed_date": closedDate == null ? null : closedDate,
        "closed_reason": closedReason == null ? null : closedReason,
        "accepted_answer_id":
            acceptedAnswerId == null ? null : acceptedAnswerId,
      };
}

class Owner {
  int reputation;
  int userId;
  UserType userType;
  String profileImage;
  String displayName;
  String link;
  int acceptRate;

  Owner({
    this.reputation,
    this.userId,
    this.userType,
    this.profileImage,
    this.displayName,
    this.link,
    this.acceptRate,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => new Owner(
        reputation: json["reputation"],
        userId: json["user_id"],
        userType: userTypeValues.map[json["user_type"]],
        profileImage: json["profile_image"],
        displayName: json["display_name"],
        link: json["link"],
        acceptRate: json["accept_rate"] == null ? null : json["accept_rate"],
      );

  Map<String, dynamic> toJson() => {
        "reputation": reputation,
        "user_id": userId,
        "user_type": userTypeValues.reverse[userType],
        "profile_image": profileImage,
        "display_name": displayName,
        "link": link,
        "accept_rate": acceptRate == null ? null : acceptRate,
      };
}

enum UserType { REGISTERED }

final userTypeValues = new EnumValues({"registered": UserType.REGISTERED});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
