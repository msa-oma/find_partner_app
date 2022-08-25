part of 'cities_bloc.dart';

abstract class CitiesState extends Equatable {
  const CitiesState();

  @override
  List<Object> get props => [];
}

class CitiesInitial extends CitiesState {}

class LoadingCitiesState extends CitiesState {}

class LoadedCitiesState extends CitiesState {
  final List<City> cities;

  const LoadedCitiesState({required this.cities});
  @override
  List<Object> get props => [cities];
}

class ErrorCitiesState extends CitiesState {
  final String message;
  const ErrorCitiesState({required this.message});
  @override
  List<Object> get props => [message];
}

class SelectedCityIDState extends CitiesState {
  final int selectedCityID;

  const SelectedCityIDState({required this.selectedCityID});
  @override
  List<Object> get props => [selectedCityID];
}
