import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:find_partner_app/features/registeration/data/models_r/login_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';

abstract class LogInRemoteDataSource {
  Future<Unit> logInUserUserxx(LogInModel logInModel);
}

final String login_url =
    "https://mobiletest.tuqaatech.com/api/TokenAuth/Authenticate";

class LogInRemoteDataSourceimpl implements LogInRemoteDataSource {
  final http.Client client;

  LogInRemoteDataSourceimpl({required this.client});

  @override
  Future<Unit> logInUserUserxx(LogInModel logInModel) async {
    print("logInUserUserxx");

    final body_login = {
      "userNameOrEmailAddress": logInModel.userNameOrEmailAddress,
      "password": logInModel.password,
      "rememberClient": logInModel.rememberClient,
    };
    print(body_login);
    var response = await http.post(
      Uri.parse(
        login_url,
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body_login),
    );
    print("logIn response status code is ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.statusCode);
      final rb = response.body;
      print('login response is : $rb ..response end');
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}


/* 
     
      
    if (response.statusCode == 200) {
      print(response.statusCode);
      final rb = response.body;
      print('register response is : $rb ..response end');
      return Future.value(unit);
    } else {
      throw ServerException();
    } */