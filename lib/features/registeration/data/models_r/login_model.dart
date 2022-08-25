import 'package:find_partner_app/features/registeration/domain/entities_r/log_in_entity.dart';

class LogInModel extends LogIn {
  const LogInModel(
      {required String userNameOrEmailAddress,
      required String password,
      required String rememberClient})
      : super(
            userNameOrEmailAddress: userNameOrEmailAddress,
            password: password,
            rememberClient: rememberClient);

  factory LogInModel.fromJson(Map<String, dynamic> json) {
    return LogInModel(
        userNameOrEmailAddress: json["userNameOrEmailAddress"],
        password: json["password"],
        rememberClient: json["rememberClient"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'userNameOrEmailAddress': userNameOrEmailAddress,
      'password': password,
      'rememberClient': rememberClient,
    };
  }
}
