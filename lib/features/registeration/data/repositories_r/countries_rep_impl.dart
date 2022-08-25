import 'package:find_partner_app/features/registeration/domain/entities_r/country_entity.dart';

import 'package:find_partner_app/core/error/failures.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories_r/countries_repository.dart';
import '../datasource_r/country_remote_data_source.dart';

class CountriesRepImpl implements CountriesRepository {
  final CountryRemoteDataSource countryremoteDataSource;
  final NetworkInfo networkInfo;

  CountriesRepImpl(
      {required this.countryremoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Country>>> getAllCountries() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCountries = await countryremoteDataSource.getAllCoutries();

        return Right(remoteCountries);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
