part of 'signup_bloc.dart';

//SOLID PRINCIPLE: Dependency Inversion Principle: every event has abstract class  gives the freedom to be independent of the implementations
abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpUseremailChanged extends SignUpEvent {
  const SignUpUseremailChanged(this.useremail);

  final String useremail;

  @override
  List<Object> get props => [useremail];
}

class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignUpWithCredentials extends SignUpEvent {
  const SignUpWithCredentials();
}
