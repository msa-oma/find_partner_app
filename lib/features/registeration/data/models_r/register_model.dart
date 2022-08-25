import 'package:find_partner_app/features/registeration/domain/entities_r/register.dart';

class RegisterModel extends Register {
  const RegisterModel(
      {required String name,
      required int gender,
      required int age,
      required int cityId,
      required int countryId,
      required String phoneNumber,
      required String emailAddress,
      required String password,
      required String avatar})
      : super(
            name: name,
            gender: gender,
            age: age,
            cityId: cityId,
            countryId: countryId,
            phoneNumber: phoneNumber,
            emailAddress: emailAddress,
            password: password,
            avatar: avatar);

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        name: json['name'] as String,
        gender: json['gender'] as int,
        age: json['age'] as int,
        cityId: json['cityId'] as int,
        countryId: json['countryId'] as int,
        phoneNumber: json['phoneNumber'] as String,
        emailAddress: json['emailAddress'] as String,
        password: json['password'] as String,
        avatar: json['avatar'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'age': age,
      'cityId': cityId,
      'countryId': countryId,
      'phoneNumber': phoneNumber,
      'emailAddress': emailAddress,
      'password': password,
      'avatar': avatar
    };
  }
}
