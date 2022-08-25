import 'package:dartz/dartz.dart';
 
import '../../../../core/error/failures.dart';
import '../entities/city.dart';

abstract class CitiesRepository {
  Future<Either<Failure, List<City>>> getAllCities();
}
