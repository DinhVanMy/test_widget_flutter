// To parse this JSON data, do
//
//     final memeData = memeDataFromJson(jsonString);

import 'dart:convert';

MemeData memeDataFromJson(String str) => MemeData.fromJson(json.decode(str));

String memeDataToJson(MemeData data) => json.encode(data.toJson());

class MemeData {
  String postLink;
  String subreddit;
  String title;
  String url;
  bool nsfw;
  bool spoiler;
  String author;
  int ups;
  List<String> preview;

  MemeData({
    required this.postLink,
    required this.subreddit,
    required this.title,
    required this.url,
    required this.nsfw,
    required this.spoiler,
    required this.author,
    required this.ups,
    required this.preview,
  });

  factory MemeData.fromJson(Map<String, dynamic> json) => MemeData(
    postLink: json["postLink"],
    subreddit: json["subreddit"],
    title: json["title"],
    url: json["url"],
    nsfw: json["nsfw"],
    spoiler: json["spoiler"],
    author: json["author"],
    ups: json["ups"],
    preview: List<String>.from(json["preview"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "postLink": postLink,
    "subreddit": subreddit,
    "title": title,
    "url": url,
    "nsfw": nsfw,
    "spoiler": spoiler,
    "author": author,
    "ups": ups,
    "preview": List<dynamic>.from(preview.map((x) => x)),
  };
}