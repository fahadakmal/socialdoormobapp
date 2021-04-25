import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

import 'models/sign_up_model.dart';

class NetworkService {
  Future<bool> userSignUp(
    SignUpModel signUpModel,
  ) async {
    print('i am in signup network');
    try {
      bool isSignUp = false;
      var bd = signUpModel.dob.toString();
      var birthDayDate = bd.split(" ")[0];
      Map<String, String> userAttributes = {
        "email": signUpModel.email.trim(),
        "given_name": signUpModel.firstName.trim(),
        "family_name": signUpModel.lastName.trim(),
        "phone_number": '+15559101234',
        "birthdate": birthDayDate.trim(),
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

  Future<List<dynamic>> login(String username, String passoword) async {
    try {
      print(username);
      print(passoword);
      SignInResult res = await Amplify.Auth.signIn(
          username: username.trim(), password: passoword.trim());
      return res.isSignedIn ? (await _getUserIdFromAttributes()) : null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<dynamic>> attempAutoLogin() async {
    try {
      final session = await Amplify.Auth.fetchAuthSession();
      print(session);

      return session.isSignedIn ? (await _getUserIdFromAttributes()) : null;
    } on AuthException catch (e) {
      return null;
    }
  }

  Future<List<dynamic>> _getUserIdFromAttributes() async {
    try {
      final attributes = await Amplify.Auth.fetchUserAttributes();
      print(attributes);
      return attributes;
      // return userId;
    } on AuthException catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await Amplify.Auth.signOut();
  }
}
