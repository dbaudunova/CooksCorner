part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class MakeAuth extends SignInEvent {
  final String email;
  final String password;

  MakeAuth({
    required this.email,
    required this.password,
  });
}
