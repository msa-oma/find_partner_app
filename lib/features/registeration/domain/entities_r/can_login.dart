import 'package:equatable/equatable.dart';

class CanLogin extends Equatable {
  final bool canLogin;

  const CanLogin({required this.canLogin});

  @override
  // TODO: implement props
  List<Object?> get props => [canLogin];
}
