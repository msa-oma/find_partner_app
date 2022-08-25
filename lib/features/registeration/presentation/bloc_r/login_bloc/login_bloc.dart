import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_partner_app/features/registeration/domain/entities_r/log_in_entity.dart';
import 'package:find_partner_app/features/registeration/domain/usecases_r/login_usecase.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../../../core/strings/messages.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc({required this.loginUsecase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is LoginUserEvent) {
        final failureOrDoneMessage = await loginUsecase(event.logIn);
        emit(_eitherDoneMessageORErrorState(
            failureOrDoneMessage, LOG_IN_SUCCESS_MESSAGE));
      }
    });
  }
}

LoginState _eitherDoneMessageORErrorState(
    Either<Failure, Unit> either, String message) {
  return either.fold(
      // ignore: prefer_const_constructors
      (failure) => ErrorLoginState(message: _mapFailureToMessage(failure)),
      (_) => DoneLoginState(message: message));
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

/**class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterForNuserUsecase registerForNuser;
  RegisterBloc({required this.registerForNuser}) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is RegisterUserEvent) {
        //there are no Loading State here
        //emit(LoadingRegisterState());
        final failureOrDoneMessage = await registerForNuser(event.register);
        emit(_eitherDoneMessageORErrorState(
            failureOrDoneMessage, REGISTER_SUCCESS_MESSAGE));
      }
    });
  }

  RegisterState _eitherDoneMessageORErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
        (failure) => ErrorRegisterState(message: _mapFailureToMessage(failure)),
        (_) => MessageRegisterState(message: message));
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
 */