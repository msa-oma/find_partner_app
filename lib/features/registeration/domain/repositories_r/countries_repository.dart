import 'package:dartz/dartz.dart';
import 'package:find_partner_app/features/registeration/domain/entities_r/country_entity.dart';

import '../../../../core/error/failures.dart';

abstract class CountriesRepository {
  Future<Either<Failure, List<Country>>> getAllCountries();
}
