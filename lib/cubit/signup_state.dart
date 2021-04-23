part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignIningUp extends SignupState {}

class SignUpError extends SignupState {
  final String error;

  SignUpError(this.error);
}

class SignUpSuccess extends SignupState {
  final String successMessage;

  SignUpSuccess(this.successMessage);
}
