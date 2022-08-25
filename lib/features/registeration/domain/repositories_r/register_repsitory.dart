import 'package:dartz/dartz.dart';
import 'package:find_partner_app/core/error/failures.dart';
import 'package:find_partner_app/features/registeration/domain/entities_r/register.dart';

abstract class RegisterRepository {
  //bool refers to canLogIn >>
  //or creat model CanLogIn !!
  Future<Either<Failure, Unit>> registerForNUser(Register register);
}
