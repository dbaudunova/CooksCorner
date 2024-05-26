import 'package:cooks_corner/features/sign_in/domain/use_case/sign_in_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase _signInUseCase;

  SignInBloc(this._signInUseCase) : super(SignInLoading()) {
    on<MakeAuth>(onAuth);
  }

  Future<void> onAuth(MakeAuth event, Emitter<SignInState> emit) async {
    emit(SignInLoading());
    try {
      await _signInUseCase.call(event.email, event.password);
      emit(SignInDone());
    } on DioException catch (e) {
      emit(SignInError(e));
    }
  }
}
