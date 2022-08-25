import 'dart:convert';

import 'package:find_partner_app/core/error/exception.dart';
import 'package:find_partner_app/features/cities/data/models/cities_model.dart';
import 'package:http/http.dart' as http;

abstract class CityRemoteDataSource {
  Future<List<CityModel>> getAllCities();
}

// ignore: constant_identifier_names
const BASE_URL =
    'https://mobiletest.tuqaatech.com/api/services/app/City/GetAllCities';

class CityRemoteDataSourceImpl implements CityRemoteDataSource {
  final http.Client client;

  CityRemoteDataSourceImpl({required this.client});
  @override
  Future<List<CityModel>> getAllCities() async {
    final response = await client.get(Uri.parse(BASE_URL),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final Map decodedJson = json.decode(response.body) as Map;
      final List decodedresult = decodedJson['result'] as List;
      final List<CityModel> cityModel = decodedresult
          .map<CityModel>((jsonCityModel) => CityModel.fromJson(jsonCityModel))
          .toList();

      return cityModel;
    } else {
      throw ServerException();
    }
  }
}
