// To parse this JSON data, do
//
//     final selectPubModel = selectPubModelFromJson(jsonString);

import 'dart:convert';

SelectPubModel selectPubModelFromJson(String str) =>
    SelectPubModel.fromJson(json.decode(str));

String selectPubModelToJson(SelectPubModel data) => json.encode(data.toJson());

class SelectPubModel {
  SelectPubModel({
    required this.urlRecursos,
    required this.publicacion,
    required this.recursos,
  });

  String urlRecursos;
  PublicacionSel publicacion;
  List<Recurso> recursos;

  factory SelectPubModel.fromJson(Map<String, dynamic> json) => SelectPubModel(
        urlRecursos: json["url_recursos"],
        publicacion: PublicacionSel.fromJson(json["publicacion"]),
        recursos: List<Recurso>.from(
            json["recursos"].map((x) => Recurso.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "url_recursos": urlRecursos,
        "publicacion": publicacion.toJson(),
        "recursos": List<dynamic>.from(recursos.map((x) => x.toJson())),
      };
}

class PublicacionSel {
  PublicacionSel({
    required this.id,
    required this.lessonTypeId,
    required this.name,
    required this.description,
    required this.image,
    required this.fgDescarga,
    required this.inicio,
    required this.flPilar,
    required this.tipoLeccion,
    required this.active,
    required this.arrayPilares,
  });

  int id;
  int lessonTypeId;
  String name;
  String description;
  String image;
  int fgDescarga;
  String inicio;
  int flPilar;
  String tipoLeccion;
  dynamic active;
  List<String> arrayPilares;

  factory PublicacionSel.fromJson(Map<String, dynamic> json) => PublicacionSel(
        id: json["id"],
        lessonTypeId: json["lesson_type_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"] != null ? json["image"] : "",
        fgDescarga: json["fg_descarga"],
        inicio: json["inicio"],
        flPilar: json["fl_pilar"],
        tipoLeccion: json["tipo_leccion"],
        active: json["active"],
        arrayPilares: List<String>.from(json["array_pilares"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lesson_type_id": lessonTypeId,
        "name": name,
        "description": description,
        "image": image,
        "fg_descarga": fgDescarga,
        "inicio": inicio,
        "fl_pilar": flPilar,
        "tipo_leccion": tipoLeccion,
        "active": active,
        "array_pilares": List<dynamic>.from(arrayPilares.map((x) => x)),
      };
}

class Recurso {
  Recurso({
    required this.id,
    required this.lessonId,
    required this.src,
    required this.type,
    required this.resourceType,
    required this.title,
    required this.description,
    required this.content,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  int id;
  int lessonId;
  String src;
  dynamic type;
  dynamic resourceType;
  String title;
  String description;
  String content;
  int active;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory Recurso.fromJson(Map<String, dynamic> json) => Recurso(
        id: json["id"],
        lessonId: json["lesson_id"],
        src: (json["src"] == null) ? "-" : json["src"],
        type: (json["type"] == null) ? "-" : json["type"],
        resourceType:
            (json["resource_type"] == null) ? "-" : json["resource_type"],
        title: (json["title"] == null) ? "-" : json["title"],
        description: (json["description"] == null)
            ? "-sin descripción-"
            : json["description"],
        content: (json["content"] == null) ? "-" : json["content"],
        active: json["active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: (json["deleted_at"] == null) ? "-" : json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "lesson_id": lessonId,
        "src": src,
        "type": type,
        "resource_type": resourceType,
        "title": title,
        "description": description,
        "content": content,
        "active": active,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
