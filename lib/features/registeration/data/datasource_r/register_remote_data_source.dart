import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:find_partner_app/features/registeration/data/models_r/register_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';

abstract class RegisterRemoteDataSource {
  Future<Unit> registerForNUserxx(RegisterModel registerModel);
}

final String rUrl =
    'https://mobiletest.tuqaatech.com/api/services/app/Account/Register';

class RegisterRemoteDataSourceimpl implements RegisterRemoteDataSource {
  final http.Client client;

  RegisterRemoteDataSourceimpl({required this.client});

  @override
  Future<Unit> registerForNUserxx(RegisterModel registerModel) async {
    print("registerForNUserxx");
    final bodyq = {
      "name": registerModel.name,
      "gender": registerModel.gender,
      "age": registerModel.age,
      "cityId": registerModel.cityId,
      "countryId": registerModel.countryId,
      "phoneNumber": registerModel.phoneNumber,
      "emailAddress": registerModel.emailAddress,
      "password": registerModel.password,
      "avatar": registerModel.avatar
    };
    print(bodyq);
    var response = await http.post(
        Uri.parse(
            'https://mobiletest.tuqaatech.com/api/services/app/Account/Register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(bodyq));
    print("register response status code is ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.statusCode);
      final rb = response.body;
      print('register response is : $rb ..response end');
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
