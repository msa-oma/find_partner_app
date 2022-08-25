import 'package:dartz/dartz.dart';
import 'package:find_partner_app/features/registeration/domain/entities_r/log_in_entity.dart';
import 'package:find_partner_app/features/registeration/domain/repositories_r/login_repository.dart';

import '../../../../core/error/failures.dart';

class LoginUsecase {
  final LogInRepository logInRepository;

  LoginUsecase({required this.logInRepository});

  Future<Either<Failure, Unit>> call(LogIn logIn) async {
    print('LogIn_Usecase');
    return await logInRepository.logInUser(logIn);
  }
}
