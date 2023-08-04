part of 'signin_bloc.dart';

abstract class SigninState {
  String? username, password;

  //SigninState({required this.username, required this.password});
}

class SigninInitial extends SigninState {

  //SigninInitial({required this.username, required this.password}):super(username: username, password: password);
}
