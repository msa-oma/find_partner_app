import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_partner_app/features/registeration/domain/entities_r/country_entity.dart';
import 'package:find_partner_app/features/registeration/domain/entities_r/register.dart';
import 'package:find_partner_app/features/registeration/domain/usecases_r/get_allcounties_usecase.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../../../core/strings/messages.dart';
import '../../../domain/usecases_r/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterForNuserUsecase registerForNuser;
  final GetAllCountriesUseCase getAllCountriesUseCase;
  int? selectedCountryIDB;

  String? selectediImage;

  RegisterBloc(
      {required this.getAllCountriesUseCase, required this.registerForNuser})
      : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RegisterUserEvent) {
        //there are no Loading State here
        //emit(LoadingRegisterState());
        final failureOrDoneMessage = await registerForNuser(event.register);
        emit(_eitherDoneMessageORErrorState(
            failureOrDoneMessage, REGISTER_SUCCESS_MESSAGE));
      }
    });
    on<GetAllCountriesEvent>((event, emit) async {
      emit(LoadingregisterState());

      final failreOrCountries = await getAllCountriesUseCase.call();
      emit(_mapFailureOrCountriesToState(failreOrCountries));
    });

    on<SelectedCountryIDEvent>(
      (event, emit) {
        selectedCountryIDB = event.selectedCountryIDE;
      },
    );
    on<SelectedImageEvent>(
        (event, emit) => {selectediImage = event.selectedImageE});
  }

  RegisterState _eitherDoneMessageORErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
        (failure) => ErrorRegisterState(message: _mapFailureToMessage(failure)),
        (_) => MessageRegisterState(message: message));
  }

  RegisterState _mapFailureOrCountriesToState(
      Either<Failure, List<Country>> either) {
    return either.fold(
        (failure) => ErrorRegisterState(message: _mapFailureToMessage(failure)),
        (countries) => LoadedCountriesState(countries: countries));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error, please try again later .";
    }
  }
}


/**
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
 */