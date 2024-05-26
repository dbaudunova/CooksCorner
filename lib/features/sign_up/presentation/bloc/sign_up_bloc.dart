import 'package:cooks_corner/features/sign_up/domain/use_case/sign_up_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpBloc(this._signUpUseCase) : super(SignUpLoading()) {
      on<MakeRegister>(onRegister);
  }

  Future<void> onRegister(MakeRegister event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    try {
      await _signUpUseCase.call(event.email, event.fullName, event.password);
      emit(SignUpDone());
    } on DioException catch (e) {
      emit(SignUpError(e));
    }
  }
}
