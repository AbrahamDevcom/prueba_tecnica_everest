// To parse this JSON data, do
//
//     final series = seriesFromJson(jsonString);

import 'dart:convert';

import 'package:prueba_tecnica_everest/app/domain/responses/generic_response.dart';

class SeriesResponse extends GenericResponse {
  Data data;

  SeriesResponse({required this.data, map}) : super(map: map);

  SeriesResponse.createEmptySuper({required this.data, required map}) : super.createEmpty();

  factory SeriesResponse.createEmpty() {
    return SeriesResponse.createEmptySuper(data: Data(offset: 0, limit: 0, total: 0, count: 0, results: []), map: "");
  }

  factory SeriesResponse.fromJson(String str) => SeriesResponse.fromMap(json.decode(str));

  @override
  String toJson() => json.encode(toMap());

  factory SeriesResponse.fromMap(Map<String, dynamic> json) => SeriesResponse(data: Data.fromJson(json["data"]), map: json);

  @override
  Map<String, dynamic> toMap() => {
        "data": data.toJson(),
      };
}

class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Series> results;

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
        results: List<Series>.from(json["results"].map((x) => Series.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "limit": limit,
        "total": total,
        "count": count,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Series {
  int id;
  String title;
  String? description;
  String resourceUri;
  List<Url> urls;
  int startYear;
  int endYear;
  String rating;
  String modified;
  Thumbnail thumbnail;
  Comics comics;
  Stories stories;
  Comics events;
  Characters characters;
  Characters creators;
  Next? next;
  Next? previous;

  Series({
    required this.id,
    required this.title,
    this.description,
    required this.resourceUri,
    required this.urls,
    required this.startYear,
    required this.endYear,
    required this.rating,
    required this.modified,
    required this.thumbnail,
    required this.comics,
    required this.stories,
    required this.events,
    required this.characters,
    required this.creators,
    required this.next,
    required this.previous,
  });

  factory Series.fromRawJson(String str) => Series.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        resourceUri: json["resourceURI"],
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
        startYear: json["startYear"],
        endYear: json["endYear"],
        rating: json["rating"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        comics: Comics.fromJson(json["comics"]),
        stories: Stories.fromJson(json["stories"]),
        events: Comics.fromJson(json["events"]),
        characters: Characters.fromJson(json["characters"]),
        creators: Characters.fromJson(json["creators"]),
        next: json["next"] != null ? Next.fromJson(json["next"]) : null,
        previous: json["previous"] != null ? Next.fromJson(json["previous"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "resourceURI": resourceUri,
        "urls": List<dynamic>.from(urls.map((x) => x.toJson())),
        "startYear": startYear,
        "endYear": endYear,
        "rating": rating,
        "modified": modified,
        "thumbnail": thumbnail.toJson(),
        "comics": comics.toJson(),
        "stories": stories.toJson(),
        "events": events.toJson(),
        "characters": characters.toJson(),
        "creators": creators.toJson(),
        "next": next?.toJson(),
        "previous": previous?.toJson(),
      };
}

class Characters {
  int available;
  int returned;
  String collectionUri;
  List<CharactersItem> items;

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
        items: List<CharactersItem>.from(json["items"].map((x) => CharactersItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class CharactersItem {
  String resourceUri;
  String name;
  String? role;

  CharactersItem({
    required this.resourceUri,
    required this.name,
    this.role,
  });

  factory CharactersItem.fromRawJson(String str) => CharactersItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CharactersItem.fromJson(Map<String, dynamic> json) => CharactersItem(
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
  List<Next> items;

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
        items: List<Next>.from(json["items"].map((x) => Next.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Next {
  String resourceUri;
  String name;

  Next({
    required this.resourceUri,
    required this.name,
  });

  factory Next.fromRawJson(String str) => Next.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Next.fromJson(Map<String, dynamic> json) => Next(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Stories {
  int available;
  int returned;
  String collectionUri;
  List<StoriesItem> items;

  Stories({
    required this.available,
    required this.returned,
    required this.collectionUri,
    required this.items,
  });

  factory Stories.fromRawJson(String str) => Stories.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        returned: json["returned"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(json["items"].map((x) => StoriesItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "returned": returned,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class StoriesItem {
  String resourceUri;
  String name;
  String type;

  StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  factory StoriesItem.fromRawJson(String str) => StoriesItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": type,
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

class Url {
  String type;
  String url;

  Url({
    required this.type,
    required this.url,
  });

  factory Url.fromRawJson(String str) => Url.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}
