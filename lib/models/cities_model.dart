// To parse this JSON data, do
//
//     final citiesModel = citiesModelFromJson(jsonString);

import 'dart:convert';

CitiesModel citiesModelFromJson(String str) =>
    CitiesModel.fromJson(json.decode(str));

String citiesModelToJson(CitiesModel data) => json.encode(data.toJson());

class CitiesModel {
  CitiesModel({
    this.msg,
    this.list,
  });

  String? msg;
  List<ListElement>? list;

  factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
        msg: json["msg"],
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.id,
    this.name,
    this.state,
    this.country,
  });

  String? id;
  String? name;
  String? state;
  Country? country;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        name: json["name"],
        state: json["state"],
        country: json["country"] == null
            ? null
            : countryValues.map![json["country"]],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "state": state,
        "country": country == null ? null : countryValues.reverse[country],
      };
}

enum Country { usa }

final countryValues = EnumValues({"USA": Country.usa});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
