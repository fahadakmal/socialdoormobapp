import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:socialdoormobile/data/models/sign_up_model.dart';
import 'package:socialdoormobile/data/repositery.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final Repositery repositery;

  SignupCubit({this.repositery}) : super(SignupInitial());

  void signUpUser(SignUpModel signUpModel) {
    emit(SignIningUp());

    repositery
        .userSignUp(signUpModel.email, signUpModel.password)
        .then((isSignUpCompleted) {
      if (isSignUpCompleted == true) {
        emit(SignUpSuccess('Successfully registered'));
      } else {
        emit(SignUpError('User already exist'));
      }
    });
  }
}
