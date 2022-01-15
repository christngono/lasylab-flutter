// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
  Usermodel({
    this.id,
    this.nom,
    this.prenom,
    this.telephone,
    this.ecole,
    this.password,
    this.dateNaiss,
  });
  String? id;
  String? nom;
  String? prenom;
  String? telephone;
  String? ecole;
  String? password;
  DateTime? dateNaiss;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        id: json["id"] == null ? null : json["id"],
        nom: json["nom"] == null ? null : json["nom"],
        prenom: json["prenom"] == null ? null : json["prenom"],
        telephone: json["telephone"] == null ? null : json["telephone"],
        ecole: json["ecole"] == null ? null : json["ecole"],
        password: json["password"] == null ? null : json["password"],
        dateNaiss: json["date_naiss"] == null
            ? null
            : DateTime.parse(json["date_naiss"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nom": nom == null ? null : nom,
        "prenom": prenom == null ? null : prenom,
        "telephone": telephone == null ? null : telephone,
        "ecole": ecole == null ? null : ecole,
        "password": password == null ? null : password,
        "date_naiss": dateNaiss == null
            ? null
            : "${dateNaiss!.year.toString().padLeft(4, '0')}-${dateNaiss!.month.toString().padLeft(2, '0')}-${dateNaiss!.day.toString().padLeft(2, '0')}",
      };
}
