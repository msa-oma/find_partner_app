import 'package:dartz/dartz.dart';
import 'package:find_partner_app/features/registeration/domain/entities_r/register.dart';

import '../../../../core/error/failures.dart';
import '../repositories_r/register_repsitory.dart';

class RegisterForNuserUsecase {
  final RegisterRepository registerRepository;

  RegisterForNuserUsecase({required this.registerRepository});
//bool refers to canLogIn >> or try Unit as a return type
  Future<Either<Failure, Unit>> call(Register register) async {
    print('RegisterForNuserUsecase');
    return await registerRepository.registerForNUser(register);
  }
}
