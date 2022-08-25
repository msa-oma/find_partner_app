import 'package:find_partner_app/features/registeration/data/models_r/register_model.dart';
import 'package:find_partner_app/features/registeration/domain/entities_r/register.dart';
import 'package:find_partner_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:find_partner_app/features/registeration/domain/repositories_r/register_repsitory.dart';
import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../datasource_r/register_remote_data_source.dart';

class RegisterRepoImpl extends RegisterRepository {
  final NetworkInfo networkInfo;
  final RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepoImpl(
      {required this.networkInfo, required this.registerRemoteDataSource});

  @override
  Future<Either<Failure, Unit>> registerForNUser(Register register) async {
    final RegisterModel registerModel = RegisterModel(
        name: register.name,
        gender: register.gender,
        age: register.age,
        cityId: register.cityId,
        countryId: register.countryId,
        phoneNumber: register.phoneNumber,
        emailAddress: register.emailAddress,
        password: register.password,
        avatar: register.avatar);

    if (await networkInfo.isConnected) {
      try {
        await registerRemoteDataSource.registerForNUserxx(registerModel);
        return const Right(unit);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
