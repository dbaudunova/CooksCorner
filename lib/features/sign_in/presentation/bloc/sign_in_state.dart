part of 'sign_in_bloc.dart';

abstract class SignInState {
  final DioException? error;

  SignInState({this.error});
}

class SignInLoading extends SignInState {}

class SignInDone extends SignInState {}

class SignInError extends SignInState {
  SignInError(DioException error) : super(error: error);
}

class ValidationState extends SignInState {
  final String? email;
  final String? password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isFormValid;

  ValidationState({
    this.email,
    this.password,
    this.isEmailValid = true,
    this.isPasswordValid = true,
    this.isFormValid = false,
    super.error,
  });
}

class SignInValidationLoading extends ValidationState {}
