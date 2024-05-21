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