part of 'signin_bloc.dart';

class SigninState {
  String email, password;
  bool visibility;

  SigninState({this.email = "", this.password = "", this.visibility=true});

  SigninState copyWith({String? email, String? password}) {

    //?? means "if null then return state defined in this class"
    return SigninState(email: email?? this.email, password: password??this.password);
  }
}