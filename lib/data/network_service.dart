import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

import 'models/sign_up_model.dart';

class NetworkService {
  Future<bool> userSignUp(
    SignUpModel signUpModel,
  ) async {
    try {
      bool isSignUp = false;
      var bd = signUpModel.dob.toString();
      var birthDayDate = bd.split(" ")[0];
      Map<String, String> userAttributes = {
        "email": signUpModel.email,
        "given_name": signUpModel.firstName,
        "family_name": signUpModel.lastName,
        "phone_number": '+15559101234',
        "birthdate": birthDayDate,
        "gender": signUpModel.gender.toString(),
      };
      SignUpResult res = await Amplify.Auth.signUp(
          username: signUpModel.email,
          password: signUpModel.password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));
      if (res.isSignUpComplete) {
        isSignUp = true;
      }
      return isSignUp;
    } on AuthException catch (e) {
      print(e.message);
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

  Future<bool> login(String username, String passoword) async {
    try {
      print(username);
      print(passoword);
      SignInResult res =
          await Amplify.Auth.signIn(username: username, password: passoword);
      return res.isSignedIn;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
