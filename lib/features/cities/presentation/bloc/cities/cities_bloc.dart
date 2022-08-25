import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_partner_app/core/error/failures.dart';
import 'package:find_partner_app/features/cities/domain/entities/city.dart';
import 'package:find_partner_app/features/cities/domain/usecases/get_all_cities.dart';

import '../../../../../core/strings/failures.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  final GetAllCitiesUsecase getAllCities;
  int? selectedCityIDB;

  CitiesBloc({required this.getAllCities}) : super(CitiesInitial()) {
    on<CitiesEvent>((event, emit) async {
      if (event is GetAllcitiesEvent) {
        emit(LoadingCitiesState());
        final failreOrCities = await getAllCities.call();

        emit(_mapFailureOrCitiesToState(failreOrCities));
      } else if (event is RefreshCitiesEvent) {
        emit(LoadingCitiesState());

        final failreOrCities = await getAllCities.call();

        emit(_mapFailureOrCitiesToState(failreOrCities));
      }
    });

    on<SelectedCityIDEvent>((event, emit) async {
      selectedCityIDB = event.selectedCityIDE;

      // emit(SelectedCityIDState(selectedCityID: selectedCityIDB!));
      // final failreOrCities = await getAllCities.call();
      // emit(_mapFailureOrCitiesToState(failreOrCities));
    });
  }
  CitiesState _mapFailureOrCitiesToState(Either<Failure, List<City>> either) {
    return either.fold(
        (failure) => ErrorCitiesState(message: _mapFailureToMessage(failure)),
        (cities) => LoadedCitiesState(cities: cities));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error ,please try again later";
    }
  }

  // FutureOr<Void?> dealwithSelectedCityID(
  //     SelectedCityIDEvent event, Emitter<CitiesState> emit) {
  //   selectedCityIDB = event.selectedCityIDE;
  //   emit(SelectedCityIDState(selectedCityID: selectedCityIDB));
  //   return null;
  // }

}
