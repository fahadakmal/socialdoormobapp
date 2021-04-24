import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

import 'models/sign_up_model.dart';

class NetworkService {
  Future<bool> userSignUp(SignUpModel signUpModel, String password) async {
    try {
      bool isSignUp = false;
      var res = await Amplify.Auth.signUp(
          username: signUpModel.email,
          password: password,
          options: CognitoSignUpOptions(userAttributes: {
            "email": signUpModel.email,
          })).catchError((e) {
        print('$e');
      });
      if (res.isSignUpComplete) {
        isSignUp = true;
      }
      return isSignUp;
    } catch (e) {
      return false;
    }
  }

  Future<bool> confirmUser(String code, SignUpModel signUpModel) async {
    bool confirmedSignUP = true;
    try {
      print(signUpModel.email);
      var res = await Amplify.Auth.confirmSignUp(
              username: signUpModel.email, confirmationCode: code)
          .catchError((e) {
        print(e.message);
        if (e.message == 'Confirmation code entered is not correct.') {
          confirmedSignUP = false;
        }
      });
      print(res);
      print(code);
      return confirmedSignUP;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
