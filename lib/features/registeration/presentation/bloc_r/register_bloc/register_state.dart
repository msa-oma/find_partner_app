part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

//same as MessageRegisterstate "needless"
class DoneRegisterState extends RegisterState {}

class ErrorRegisterState extends RegisterState {
  final String message;

  const ErrorRegisterState({required this.message});
  @override
  List<Object> get props => [message];
}

class MessageRegisterState extends RegisterState {
  final String message;
  const MessageRegisterState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingregisterState extends RegisterState {}

class LoadedCountriesState extends RegisterState {
  final List<Country> countries;
  const LoadedCountriesState({required this.countries});
  @override
  List<Object> get props => [countries];
}

class SelectedCountryIDState extends RegisterState {
  final int selectedCountryID;

  const SelectedCountryIDState({required this.selectedCountryID});
  @override
  List<Object> get props => [selectedCountryID];
}
