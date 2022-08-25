import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities_r/log_in_entity.dart';

abstract class LogInRepository {
  //Unit must be model"entity" to save access token..ect..
  Future<Either<Failure, Unit>> logInUser(LogIn logIn);
}
