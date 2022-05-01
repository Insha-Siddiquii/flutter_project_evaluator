import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );

    _googleInfoSubscription = _authenticationRepository.googleUserInfo
        .listen((value) => add(AuthenticationGoogleInfo(value)));

    on<AuthenticationStatusChanged>(_mapAuthenticationStatusChangedToState);
    on<AuthenticationGoogleInfo>(_fetchUserGoogleInfo);
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;
  late StreamSubscription<String> _googleInfoSubscription;

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _googleInfoSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  _mapAuthenticationStatusChangedToState(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        return emit(const AuthenticationState.authenticated());

      default:
        return emit(const AuthenticationState.unknown());
    }
  }

  _fetchUserGoogleInfo(
    AuthenticationGoogleInfo event,
    Emitter<AuthenticationState> emit,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userEmail', event.email);
  }
}
