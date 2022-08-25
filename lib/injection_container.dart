import 'package:find_partner_app/core/network/network_info.dart';
import 'package:find_partner_app/features/cities/data/datasources/city_remote_data_source.dart';
import 'package:find_partner_app/features/cities/data/repositories/cities_rep_imp.dart';
import 'package:find_partner_app/features/cities/domain/repositories/cities_repository.dart';
import 'package:find_partner_app/features/cities/domain/usecases/get_all_cities.dart';
import 'package:find_partner_app/features/cities/presentation/bloc/cities/cities_bloc.dart';
import 'package:find_partner_app/features/registeration/data/datasource_r/country_remote_data_source.dart';
import 'package:find_partner_app/features/registeration/data/datasource_r/register_remote_data_source.dart';
import 'package:find_partner_app/features/registeration/data/repositories_r/countries_rep_impl.dart';
import 'package:find_partner_app/features/registeration/data/repositories_r/register_rep_impl.dart';
import 'package:find_partner_app/features/registeration/domain/repositories_r/countries_repository.dart';
import 'package:find_partner_app/features/registeration/domain/repositories_r/register_repsitory.dart';
import 'package:find_partner_app/features/registeration/domain/usecases_r/register_usecase.dart';
import 'package:find_partner_app/features/registeration/presentation/bloc_r/login_bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/registeration/data/datasource_r/login_remorte_data_source.dart';
import 'features/registeration/data/repositories_r/login_rep_imp.dart';
import 'features/registeration/domain/repositories_r/login_repository.dart';
import 'features/registeration/domain/usecases_r/get_allcounties_usecase.dart';
import 'features/registeration/domain/usecases_r/login_usecase.dart';
import 'features/registeration/presentation/bloc_r/register_bloc/register_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// features Cities

  //Bloc
  sl.registerFactory(() => CitiesBloc(
        getAllCities: sl(),
      ));
  sl.registerFactory(
      () => RegisterBloc(registerForNuser: sl(), getAllCountriesUseCase: sl()));
  sl.registerFactory(() => LoginBloc(loginUsecase: sl()));

  //Usecases
  sl.registerLazySingleton(
      () => GetAllCountriesUseCase(countriesRepository: sl()));
  sl.registerLazySingleton(
      () => RegisterForNuserUsecase(registerRepository: sl()));
  sl.registerLazySingleton(() => LoginUsecase(logInRepository: sl()));

  sl.registerLazySingleton(() => GetAllCitiesUsecase(repository: sl()));

  //Repository
  sl.registerLazySingleton<CountriesRepository>(
      () => CountriesRepImpl(countryremoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CitiesRepository>(
      () => CitiesRepImpl(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<RegisterRepository>(() =>
      RegisterRepoImpl(networkInfo: sl(), registerRemoteDataSource: sl()));

  sl.registerLazySingleton<LogInRepository>(
      () => LogInRepoImpl(logInRemoteDataSource: sl(), networkInfo: sl()));
  //Datasources
  sl.registerLazySingleton<CityRemoteDataSource>(
      () => CityRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceimpl(client: sl()));
  sl.registerLazySingleton<LogInRemoteDataSource>(
      () => LogInRemoteDataSourceimpl(client: sl()));
  sl.registerLazySingleton<CountryRemoteDataSource>(
      () => CountryRemoteDataSourceImpl(client: sl()));

  ///Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImp(sl()));

  ///External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
