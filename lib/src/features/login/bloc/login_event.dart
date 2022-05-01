part of 'login_bloc.dart';

//SOLID PRINCIPLE: Dependency Inversion Principle: every event has abstract class  gives the freedom to be independent of the implementations
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUseremailChanged extends LoginEvent {
  const LoginUseremailChanged(this.useremail);

  final String useremail;

  @override
  List<Object> get props => [useremail];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginWithCredentials extends LoginEvent {
  const LoginWithCredentials();
}

class LoginWithGoogle extends LoginEvent {
  const LoginWithGoogle();
}

class LogOut extends LoginEvent {
  const LogOut();
}
