import 'package:find_partner_app/core/error/exception.dart';
import 'package:find_partner_app/core/network/network_info.dart';
import 'package:find_partner_app/features/cities/domain/entities/city.dart';
import 'package:find_partner_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repositories/cities_repository.dart';
import '../datasources/city_remote_data_source.dart';

class CitiesRepImpl implements CitiesRepository {
  final CityRemoteDataSource remoteDataSource;

  final NetworkInfo networkInfo;

  CitiesRepImpl({required this.networkInfo, required this.remoteDataSource});
  @override
  Future<Either<Failure, List<City>>> getAllCities() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCities = await remoteDataSource.getAllCities();

        return Right(remoteCities);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
