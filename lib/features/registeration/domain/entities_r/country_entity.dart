import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final int id;
  final String name;
  final List<City2> cities;

  const Country({required this.id, required this.name, required this.cities});

  @override
  List<Object?> get props => [id, name, cities];
}

class City2 extends Equatable {
  final int id;
  final int countryId;
  final String countryName;
  final String name;

  const City2(
      {required this.id,
      required this.countryId,
      required this.countryName,
      required this.name});

  @override
  List<Object?> get props => [id, countryId, countryName, name];
}

/**[
  {
    "id": 0,
    "name": "string",
    "cities": [
      {
        "id": 0,
        "countryId": 0,
        "countryName": "string",
        "name": "string"
      }
    ]
  }
] */

/* // To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

List<Country> countryFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
    Country({
        this.id,
        this.name,
        this.cities,
    });

    int id;
    String name;
    List<City> cities;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        name: json["name"],
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
    };
}

class City {
    City({
        this.id,
        this.countryId,
        this.countryName,
        this.name,
    });

    int id;
    int countryId;
    String countryName;
    String name;

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        countryId: json["countryId"],
        countryName: json["countryName"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "countryId": countryId,
        "countryName": countryName,
        "name": name,
    };
}
 */