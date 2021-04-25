part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserConfirmed extends UserState {
  final String successMessage;

  UserConfirmed(this.successMessage);
}

class UserConfmationError extends UserState {
  final String error;

  UserConfmationError(this.error);
}

class UserConfirmationInProcess extends UserState {}

class SignIningUp extends UserState {}

class SignUpError extends UserState {
  final String error;

  SignUpError(this.error);
}

class SignUpSuccess extends UserState {
  final String successMessage;

  SignUpSuccess(this.successMessage);
}

class LoginInProcess extends UserState {}

class LoginFailed extends UserState {
  final String error;

  LoginFailed(this.error);
}

class LoginSuccess extends UserState {
  final UserModel user;

  LoginSuccess(this.user);
}
