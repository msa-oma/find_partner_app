part of 'cities_bloc.dart';

abstract class CitiesEvent extends Equatable {
  const CitiesEvent();

  @override
  List<Object> get props => [];
}

class GetAllcitiesEvent extends CitiesEvent {}

class RefreshCitiesEvent extends CitiesEvent {}

class SelectedCityIDEvent extends CitiesEvent {
  final int selectedCityIDE;

  const SelectedCityIDEvent({required this.selectedCityIDE});
  @override
  List<Object> get props => [selectedCityIDE];
}
