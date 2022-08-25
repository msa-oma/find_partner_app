import 'package:find_partner_app/features/cities/domain/entities/city.dart';

class CityModel extends City {
  const CityModel({
    required int countryId,
    required String countryName,
    required String name,
    required int id,
  }) : super(
            id: id, countryId: countryId, countryName: countryName, name: name);

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
        id: json['id'],
        countryId: json['countryId'],
        countryName: json['countryName'],
        name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'countryId': countryId,
      'countryName': countryName,
      'name': name
    };
  }
}
