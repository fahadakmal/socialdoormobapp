import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/models/sign_up_model.dart';
import '../data/repositery.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final Repositery repositery;

  UserCubit({this.repositery}) : super(UserInitial());

//function for signup user
  void signUpUser(SignUpModel signUpModel) {
    emit(SignIningUp());

    repositery
        .userSignUp(signUpModel, signUpModel.password)
        .then((isSignUpCompleted) {
      if (isSignUpCompleted == true) {
        emit(SignUpSuccess('Successfully registered'));
      } else {
        emit(SignUpError('User already exist'));
      }
    });
  }

//function for
  void confirmUser(String code, SignUpModel signUpModel) {
    emit(UserConfirmationInProcess());

    if (code.isEmpty) {
      emit(UserConfmationError('code is empty'));
    }

    repositery.confirmUser(code, signUpModel).then((value) => {
          if (value == true)
            {emit(UserConfirmed('you are successfully confirmed'))}
          else
            {emit(UserConfmationError('Code doesnot matched plz try again'))}
        });
  }
}
