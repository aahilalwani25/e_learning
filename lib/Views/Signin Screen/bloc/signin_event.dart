part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SigninTextChangedEvent extends SigninEvent{}

class SigninOnSubmitEvent extends SigninEvent{}
