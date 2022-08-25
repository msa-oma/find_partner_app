import 'package:find_partner_app/features/registeration/domain/entities_r/country_entity.dart';

class CountryModel extends Country {
  const CountryModel(
      {required int id, required String name, required List<City2> cities})
      : super(id: id, name: name, cities: cities);

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      id: json["id"],
      name: json["name"],
      cities:
          List<City2>.from(json["cities"].map((x) => CityModel.fromJson(x))),
    );
  }

  //    Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "name": name,
  //     "cities": List<CityModel>.from(cities.map(( x) =>  x.toJsons()))  ,
  // };

}

class CityModel extends City2 {
  const CityModel(
      {required int id,
      required int countryId,
      required String countryName,
      required String name})
      : super(
          id: id,
          countryId: countryId,
          countryName: countryName,
          name: name,
        );

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
        id: json['id'],
        countryId: json['countryId'],
        countryName: json['countryName'],
        name: json['name']);
  }

  Map<String, dynamic> toJsons() {
    return {
      'id': id,
      'countryId': countryId,
      'countryName': countryName,
      'name': name
    };
  }
}
