part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent implements RegisterEvent {
  final Register register;

  RegisterUserEvent({required this.register});

  @override
  List<Object> get props => [register];

  @override
  // TODO: implement stringify
  bool? get stringify => false;
}

class SelectedImageEvent extends RegisterEvent {
  final String selectedImageE;

  const SelectedImageEvent({required this.selectedImageE});
  @override
  List<Object> get props => [selectedImageE];
}

class GetAllCountriesEvent extends RegisterEvent {}

class SelectedCountryIDEvent extends RegisterEvent {
  final int selectedCountryIDE;

  const SelectedCountryIDEvent({required this.selectedCountryIDE});
  @override
  List<Object> get props => [selectedCountryIDE];
}
