import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInValidationLoading()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignInState> emit) {
    final isEmailValid = _isValidEmail(event.email);
    final currentState = state as ValidationState;
    final isFormValid =
        isEmailValid && _isValidPassword(currentState.password ?? '');

    emit(ValidationState(
      email: event.email,
      password: currentState.password,
      isEmailValid: isEmailValid,
      isPasswordValid: currentState.isPasswordValid,
      isFormValid: isFormValid,
      error: currentState.error,
    ));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignInState> emit) {
    final isPasswordValid = _isValidPassword(event.password);
    final currentState = state as ValidationState;
    final isFormValid =
        _isValidEmail(currentState.email ?? '') && isPasswordValid;

    emit(ValidationState(
      email: currentState.email,
      password: event.password,
      isEmailValid: currentState.isEmailValid,
      isPasswordValid: isPasswordValid,
      isFormValid: isFormValid,
      error: currentState.error,
    ));
  }

  void _onSignInSubmitted(
      SignInSubmitted event, Emitter<SignInState> emit) async {
    final currentState = state as ValidationState;
    if (currentState.isFormValid) {
      emit(SignInLoading());
      if (currentState.email == "dbaudunova@gmail.com" &&
          currentState.password == "11111222") {
        emit(SignInDone());
      } else {
        emit(
          SignInError(
            DioException(
              requestOptions: RequestOptions(path: ''),
            ),
          ),
        );
      }
    }
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  bool _isValidPassword(String password) {
    return password.length >= 8;
  }
}
