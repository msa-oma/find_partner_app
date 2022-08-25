/*[
  {
    "id": 0,
    "countryId": 0,
    "countryName": "string",
    "name": "string"
  }
] */

import 'package:equatable/equatable.dart';

class City extends Equatable {
  final int id;
  final int countryId;
  final String countryName;
  final String name;

  const City(
      {required this.id,
      required this.countryId,
      required this.countryName,
      required this.name});

  @override
  List<Object?> get props => [id, countryId, countryName, name];
}
