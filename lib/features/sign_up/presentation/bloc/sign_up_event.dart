part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class MakeRegister extends SignUpEvent {
  final String email;
  final String fullName;
  final String password;

  MakeRegister({
    required this.email,
    required this.fullName,
    required this.password,
  });
}
