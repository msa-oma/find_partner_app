import 'package:dartz/dartz.dart';
import 'package:find_partner_app/features/cities/domain/repositories/cities_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/city.dart';

class GetAllCitiesUsecase {
  final CitiesRepository repository;

  GetAllCitiesUsecase({required this.repository});

  Future<Either<Failure, List<City>>> call() async {
    return await repository.getAllCities();
  }
}
