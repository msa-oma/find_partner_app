// Future<Either<Failure, List<Country>>>

import 'package:dartz/dartz.dart';
import 'package:find_partner_app/features/registeration/domain/repositories_r/countries_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities_r/country_entity.dart';

class GetAllCountriesUseCase {
  final CountriesRepository countriesRepository;

  GetAllCountriesUseCase({required this.countriesRepository});

  Future<Either<Failure, List<Country>>> call() async {
    return await countriesRepository.getAllCountries();
  }
}
