import 'package:equatable/equatable.dart';

class Register extends Equatable {
  final String name;
  final int gender;
  final int age;
  final int cityId;
  final int countryId;
  final String phoneNumber;
  final String emailAddress;
  final String password;
  final String avatar;

  const Register(
      {required this.name,
      required this.gender,
      required this.age,
      required this.cityId,
      required this.countryId,
      required this.phoneNumber,
      required this.emailAddress,
      required this.password,
      required this.avatar});

  @override
  List<Object?> get props => [
        name,
        gender,
        age,
        cityId,
        countryId,
        phoneNumber,
        emailAddress,
        password,
        avatar
      ];
}
