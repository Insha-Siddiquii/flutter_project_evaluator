import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dukkan_project/src/features/login/model/model.dart';
import 'package:formz/formz.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginUseremailChanged>(_mapUsernameChangedToState);
    on<LoginPasswordChanged>(_mapPasswordChangedToState);
    on<LoginWithCredentials>(_mapLoginWithCredentials);
    on<LoginWithGoogle>(_mapLoginWithGoogle);
    on<LogOut>(_mapLogout);
  }

  final AuthenticationRepository _authenticationRepository;

  _mapUsernameChangedToState(
    LoginUseremailChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Useremail.dirty(event.useremail);
    return emit(state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    ));
  }

  _mapPasswordChangedToState(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    return emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.useremail]),
    ));
  }

  Future<void> _mapLoginWithCredentials(
    LoginWithCredentials event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setString('userEmail', state.useremail.value);
        await _authenticationRepository.logInWithCredentials(
          useremail: state.useremail.value,
          password: state.password.value,
        );
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } on Exception catch (_) {
        emit(
          state.copyWith(
            status: FormzStatus.submissionFailure,
          ),
        );
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }

  Future<void> _mapLoginWithGoogle(
    LoginWithGoogle event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(googleLoader: true));
    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(googleLoader: false));
    } on Exception catch (_) {
      emit(
        state.copyWith(
          googleLoader: false,
        ),
      );
    } catch (_) {
      emit(state.copyWith(
        googleLoader: false,
      ));
    }
  }

  _mapLogout(LogOut event, Emitter<LoginState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userEmail');
    _authenticationRepository.logOut();
  }
}
