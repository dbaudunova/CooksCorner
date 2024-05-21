import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInLoading()) {}
}
