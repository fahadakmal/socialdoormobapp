import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';

class NetworkService {
  Future<bool> userSignUp(String email, String password) async {
    try {
      bool isSignUp = false;
      var res = await Amplify.Auth.signUp(
              username: email,
              password: password,
              options: CognitoSignUpOptions(userAttributes: {"email": email}))
          .catchError((e) {
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
}
