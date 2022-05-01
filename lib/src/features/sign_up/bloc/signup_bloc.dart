import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dukkan_project/src/features/sign_up/model/model.dart';
import 'package:formz/formz.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const SignUpState()) {
    on<SignUpUseremailChanged>(_mapUsernameChangedToState);
    on<SignUpPasswordChanged>(_mapPasswordChangedToState);
    on<SignUpWithCredentials>(_mapSignUpWithCredentials);
  }

  final AuthenticationRepository _authenticationRepository;

  _mapUsernameChangedToState(
    SignUpUseremailChanged event,
    Emitter<SignUpState> emit,
  ) {
    final username = Useremail.dirty(event.useremail);
    return emit(state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    ));
  }

  _mapPasswordChangedToState(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final password = Password.dirty(event.password);
    return emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.useremail]),
    ));
  }

  Future<void> _mapSignUpWithCredentials(
    SignUpWithCredentials event,
    Emitter<SignUpState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('userEmail', state.useremail.value);
        await _authenticationRepository.signUpWithCredentials(
          useremail: state.useremail.value,
          password: state.password.value,
        );
        emit(
          state.copyWith(status: FormzStatus.submissionSuccess),
        );
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
}
