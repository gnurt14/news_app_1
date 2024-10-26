import 'dart:convert';

class Article {
  final int createdTime;
  final int sortOrder;
  final int creatorId;
  final int site;
  final String type;
  final String tag;
  final String author;
  final int isDisplay;
  final String crawlerLink;
  final String title;
  final String source;
  final String brief;
  final String content;
  final String image;
  final int status;
  final String crawlerSource;
  final int publishTime;
  final String rewriteUrl;
  final int totalViews;
  final int lastUpdateUserId;
  final String id;
  final String categoryTitle;
  final String publishDate;
  final int totalWords;
  bool isBookMark;

  Article({
    required this.createdTime,
    required this.sortOrder,
    required this.creatorId,
    required this.site,
    required this.type,
    required this.tag,
    required this.author,
    required this.isDisplay,
    required this.crawlerLink,
    required this.title,
    required this.source,
    required this.brief,
    required this.content,
    required this.image,
    required this.status,
    required this.crawlerSource,
    required this.publishTime,
    required this.rewriteUrl,
    required this.totalViews,
    required this.lastUpdateUserId,
    required this.id,
    required this.categoryTitle,
    required this.publishDate,
    required this.totalWords,
    this.isBookMark = false,
  });

  factory Article.fromJson(String str) => Article.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Article.fromMap(Map<String, dynamic> json) => Article(
    createdTime: json["createdTime"],
    sortOrder: json["sortOrder"],
    creatorId: json["creatorId"],
    site: json["site"],
    type: json["type"],
    tag: json["tag"],
    author: json["author"],
    isDisplay: json["isDisplay"],
    crawlerLink: json["crawlerLink"],
    title: json["title"],
    source: json["source"],
    brief: json["brief"],
    content: json["content"],
    image: json["image"],
    status: json["status"],
    crawlerSource: json["crawlerSource"],
    publishTime: json["publishTime"],
    rewriteUrl: json["rewriteURL"],
    totalViews: json["totalViews"],
    lastUpdateUserId: json["lastUpdateUserId"],
    id: json["id"],
    categoryTitle: json["categoryTitle"],
    publishDate: json["publishDate"],
    totalWords: json["totalWords"],
  );

  Map<String, dynamic> toMap() => {
    "createdTime": createdTime,
    "sortOrder": sortOrder,
    "creatorId": creatorId,
    "site": site,
    "type": type,
    "tag": tag,
    "author": author,
    "isDisplay": isDisplay,
    "crawlerLink": crawlerLink,
    "title": title,
    "source": source,
    "brief": brief,
    "content": content,
    "image": image,
    "status": status,
    "crawlerSource": crawlerSource,
    "publishTime": publishTime,
    "rewriteURL": rewriteUrl,
    "totalViews": totalViews,
    "lastUpdateUserId": lastUpdateUserId,
    "id": id,
    "categoryTitle": categoryTitle,
    "publishDate": publishDate,
    "totalWords": totalWords,
  };
}
