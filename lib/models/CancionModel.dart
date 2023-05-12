// To parse this JSON data, do
//
//     final cancionModel = cancionModelFromJson(jsonString);

import 'dart:convert';

CancionModel cancionModelFromJson(String str) =>
    CancionModel.fromJson(json.decode(str));

String cancionModelToJson(CancionModel data) => json.encode(data.toJson());

class CancionModel {
  CancionModel({
    required this.status,
    required this.message,
    required this.data,
  });

  String status;
  dynamic message;
  Data data;

  factory CancionModel.fromJson(Map<String, dynamic> json) => CancionModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.canciones,
  });

  List<Cancione> canciones;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        canciones: List<Cancione>.from(
            json["canciones"].map((x) => Cancione.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "canciones": List<dynamic>.from(canciones.map((x) => x.toJson())),
      };
}

class Cancione {
  Cancione({
    required this.flCancion,
    required this.nbCancion,
    required this.nbArtista,
    required this.nbGenero,
    required this.nbCategoria,
    required this.fgTocoDj,
    required this.feTocoDj,
    required this.likesCount,
    required this.yaDioLike,
  });

  int flCancion;
  int likesCount;
  int yaDioLike;
  String nbCancion;
  String nbArtista;
  String nbGenero;
  String nbCategoria;
  String fgTocoDj;
  dynamic feTocoDj;

  factory Cancione.fromJson(Map<String, dynamic> json) => Cancione(
        flCancion: json["fl_cancion"],
        nbCancion: json["nb_cancion"],
        nbArtista: json["nb_artista"],
        nbGenero: json["nb_genero"],
        nbCategoria: json["nb_categoria"],
        fgTocoDj: json["fg_toco_dj"],
        feTocoDj: json["fe_toco_dj"],
        likesCount: json["likes_count"],
        yaDioLike: json["ya_dio_like"],
      );

  Map<String, dynamic> toJson() => {
        "fl_cancion": flCancion,
        "nb_cancion": nbCancion,
        "nb_artista": nbArtista,
        "nb_genero": nbGenero,
        "nb_categoria": nbCategoria,
        "fg_toco_dj": fgTocoDj,
        "fe_toco_dj": feTocoDj,
        "likes_count": likesCount,
        "ya_dio_like": yaDioLike,
      };
}
