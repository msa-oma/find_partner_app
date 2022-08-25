part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUserEvent implements LoginEvent {
  final LogIn logIn;

  LoginUserEvent({required this.logIn});

  @override
  List<Object> get props => [logIn];

  @override
  bool? get stringify => false;
}
