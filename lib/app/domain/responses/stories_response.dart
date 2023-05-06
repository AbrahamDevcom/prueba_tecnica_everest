// To parse this JSON data, do
//
//     final storiesResponse = storiesResponseFromJson(jsonString);

import 'dart:convert';

import 'package:prueba_tecnica_everest/app/domain/responses/generic_response.dart';

class StoriesResponse extends GenericResponse {
  Data data;

  StoriesResponse({required this.data, map}) : super(map: map);

  StoriesResponse.createEmptySuper({required this.data, required map}) : super.createEmpty();

  factory StoriesResponse.createEmpty() {
    return StoriesResponse.createEmptySuper(data: Data(offset: 0, limit: 0, total: 0, count: 0, results: []), map: "");
  }

  factory StoriesResponse.fromJson(String str) => StoriesResponse.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory StoriesResponse.fromMap(Map<String, dynamic> json) => StoriesResponse(
        data: Data.fromJson(json["data"]),
        map: json,
      );

  @override
  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "data": data.toJson(),
        "etag": etag,
      };
}

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Stories> results;

  Data({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.results,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
        count: json["count"],
        results: List<Stories>.from(json["results"].map((x) => Stories.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Stories {
  int id;
  String title;
  String description;
  String resourceUri;
  String type;
  String modified;
  Thumbnail? thumbnail;
  Comics comics;
  Comics series;
  Comics events;
  Characters characters;
  Characters creators;
  Originalissue? originalissue;

  Stories({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceUri,
    required this.type,
    required this.modified,
    required this.thumbnail,
    required this.comics,
    required this.series,
    required this.events,
    required this.characters,
    required this.creators,
    this.originalissue,
  });

  factory Stories.fromRawJson(String str) => Stories.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        type: json["type"],
        modified: json["modified"],
        thumbnail: json["thumbnail"] != null ? Thumbnail.fromJson(json["thumbnail"]) : null,
        comics: Comics.fromJson(json["comics"]),
        series: Comics.fromJson(json["series"]),
        events: Comics.fromJson(json["events"]),
        characters: Characters.fromJson(json["characters"]),
        creators: Characters.fromJson(json["creators"]),
        originalissue: json["originalissue"] != null ? Originalissue.fromJson(json["originalissue"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "resourceURI": resourceUri,
        "type": type,
        "modified": modified,
        "thumbnail": thumbnail?.toJson(),
        "comics": comics.toJson(),
        "series": series.toJson(),
        "events": events.toJson(),
        "characters": characters.toJson(),
        "creators": creators.toJson(),
        "originalissue": originalissue?.toJson(),
      };
}

class Characters {
  int available;
  int returned;
  String collectionUri;
  List<Item> items;

  Characters({
    required this.available,
    required this.returned,
    required this.collectionUri,
    required this.items,
  });

  factory Characters.fromRawJson(String str) => Characters.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String resourceUri;
  String name;
  String? role;

  Item({
    required this.resourceUri,
    required this.name,
    this.role,
  });

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": role,
      };
}

class Comics {
  int available;
  int returned;
  String collectionUri;
  List<Originalissue> items;

  Comics({
    required this.available,
    required this.returned,
    required this.collectionUri,
    required this.items,
  });

  factory Comics.fromRawJson(String str) => Comics.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<Originalissue>.from(json["items"].map((x) => Originalissue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Originalissue {
  String resourceUri;
  String name;

  Originalissue({
    required this.resourceUri,
    required this.name,
  });

  factory Originalissue.fromRawJson(String str) => Originalissue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Originalissue.fromJson(Map<String, dynamic> json) => Originalissue(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Thumbnail {
  String path;
  String extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  factory Thumbnail.fromRawJson(String str) => Thumbnail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
      };
}
