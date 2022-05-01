part of 'authentication_bloc.dart';

//SOLID PRINCIPLE: Dependency Inversion Principle: every event has abstract class  gives the freedom to be independent of the implementations
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

class AuthenticationGoogleInfo extends AuthenticationEvent {
  const AuthenticationGoogleInfo(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
