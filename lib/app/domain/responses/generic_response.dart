// To parse this JSON data, do
//
//     final characters = charactersFromJson(jsonString);

import 'dart:convert';

class GenericResponse {
  static const String errorGenerico = "Estamos presentando problemas de conexión, por favor intente en unos minutos";
  static const int success = 0;
  final int undefined = -1;

  GenericResponse({required Map<String, dynamic> map}) {
    fromMapError(map);
  }

  GenericResponse.init({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.etag,
  });

  GenericResponse.createEmpty() {
    code = undefined;
    status = "";
    copyright = "";
    attributionText = "";
    attributionHtml = "";
    etag = "";
  }

  GenericResponse.ok() {
    code = success;
    status = "";
    copyright = "";
    attributionText = "";
    attributionHtml = "";
    etag = "";
  }

  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  String? etag;

  String toJson() => json.encode(toMap());

  factory GenericResponse.fromJson(String str) => GenericResponse.fromMap(json.decode(str));

  factory GenericResponse.fromMap(Map<String, dynamic> json) => GenericResponse.init(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        etag: json["etag"],
      );

  void fromMapError(Map<String, dynamic> map) {
    code = map["code"] ?? 0;
    status = map["status"] ?? "";
    copyright = map["copyright"] ?? "";
    attributionText = map["attributionText"] ?? "";
    attributionHtml = map["attributionHTML"] ?? "";
    etag = map["etag"] ?? "";
  }

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "etag": etag,
      };

  bool isSuccess() {
    return code == success;
  }

  bool isUndefined() {
    return code == undefined;
  }

  @override
  String toString() {
    var response = toMap();
    return json.encode(response);
  }
}
