import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_starter/authentication/auth_repository.dart';
import 'package:flutter_starter/authentication/form_submission_status.dart';
import 'package:flutter_starter/utils/validators.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginState()){
    on<LoginEmailChanged>((event, emit) async {
      await _checkEmail(emit,event);
    });

    on<LoginPasswordChanged>((event, emit) async {
      await _checkPassword(emit,event);
    });

    on<LoginSubmitted>((event, emit) async {
      await _submitAction(emit,event);
    });
  }

  Future<void> _checkEmail(Emitter<LoginState> emit, LoginEmailChanged event) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _checkPassword(Emitter<LoginState> emit, LoginPasswordChanged event) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _submitAction(Emitter<LoginState> emit, LoginSubmitted event) async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    try {
      await authRepository.login();
      emit(state.copyWith(formStatus: SubmissionSuccess()));
    } catch (e) {
      emit(state.copyWith(formStatus: SubmissionFailed(e)));
    }
  }
}