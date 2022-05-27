// To parse this JSON data, do
//
//     final countriesAnswer = countriesAnswerFromJson(jsonString);

import 'dart:convert';

List<CountriesAnswer> countriesAnswerFromJson(String str) =>
    List<CountriesAnswer>.from(
        json.decode(str).map((x) => CountriesAnswer.fromJson(x)));

String countriesAnswerToJson(List<CountriesAnswer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountriesAnswer {
  CountriesAnswer({
    required this.code,
    required this.nameEn,
    required this.nameRu,
    required this.nameLocal,
    required this.flagUrl,
  });

  String code;
  String nameEn;
  String nameRu;
  String nameLocal;
  String flagUrl;

  factory CountriesAnswer.fromJson(Map<String, dynamic> json) =>
      CountriesAnswer(
        code: json["code"],
        nameEn: json["name_en"],
        nameRu: json["name_ru"],
        nameLocal: json["name_local"],
        flagUrl: json["flag_url"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name_en": nameEn,
        "name_ru": nameRu,
        "name_local": nameLocal,
        "flag_url": flagUrl,
      };
}
