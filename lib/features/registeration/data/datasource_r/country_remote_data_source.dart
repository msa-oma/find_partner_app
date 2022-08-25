import 'dart:convert';

import 'package:find_partner_app/features/registeration/data/models_r/countries_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';

abstract class CountryRemoteDataSource {
  Future<List<CountryModel>> getAllCoutries();
}

const countries_url =
    'https://mobiletest.tuqaatech.com/api/services/app/Country/GetAllCountries';

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  final http.Client client;

  CountryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CountryModel>> getAllCoutries() async {
    final response = await client.get(Uri.parse(countries_url),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final Map decodedJson = json.decode(response.body) as Map;
      final List decodedresult = decodedJson['result'] as List;
      final List<CountryModel> countryModel = decodedresult
          .map<CountryModel>(
              (jsonCountryModel) => CountryModel.fromJson(jsonCountryModel))
          .toList();

      return countryModel;
    } else {
      throw ServerException();
    }
  }
}
