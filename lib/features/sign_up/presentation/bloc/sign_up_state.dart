part of 'sign_up_bloc.dart';

abstract class SignUpState {
  final DioException? error;

  SignUpState({this.error});
}

class SignUpLoading extends SignUpState {}

class SignUpDone extends SignUpState {}

class SignUpError extends SignUpState {
  SignUpError(DioException error) : super(error: error);
}
