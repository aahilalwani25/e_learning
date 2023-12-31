part of 'signin_bloc.dart';

abstract class SigninEvent {}

class EmailChangedEvent extends SigninEvent {
  String email;

  EmailChangedEvent(this.email);
}

class PasswordChangedEvent extends SigninEvent {
  String password;

  PasswordChangedEvent(this.password);
}

class PasswordVisibilityChangedEvent extends SigninEvent {
  bool visibility;

  PasswordVisibilityChangedEvent(this.visibility);
}
