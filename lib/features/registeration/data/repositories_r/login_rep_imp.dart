import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/network_info.dart';
import '../datasource_r/login_remorte_data_source.dart';
import '../models_r/login_model.dart';
import '../../domain/entities_r/log_in_entity.dart';
import '../../domain/repositories_r/login_repository.dart';
import '../../../../core/error/exception.dart';

class LogInRepoImpl extends LogInRepository {
  final NetworkInfo networkInfo;
  final LogInRemoteDataSource logInRemoteDataSource;

  LogInRepoImpl(
      {required this.networkInfo, required this.logInRemoteDataSource});

  @override
  Future<Either<Failure, Unit>> logInUser(LogIn logIn) async {
    final LogInModel logInModel = LogInModel(
        userNameOrEmailAddress: logIn.userNameOrEmailAddress,
        password: logIn.password,
        rememberClient: logIn.rememberClient);

    if (await networkInfo.isConnected) {
      try {
        await logInRemoteDataSource.logInUserUserxx(logInModel);
        return const Right(unit);
      } on ServerException {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
