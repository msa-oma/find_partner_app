part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoadinLoginState extends LoginState {}

class DoneLoginState extends LoginState {
  final String message;

  const DoneLoginState({required this.message});
  @override
  List<Object> get props => [message];
}

class ErrorLoginState extends LoginState {
  final String message;

  const ErrorLoginState({required this.message});

  @override
  List<Object> get props => [message];
}
