import 'package:socialdoormobile/data/models/user_model.dart';

import 'models/sign_up_model.dart';
import 'network_service.dart';

class Repositery {
  final NetworkService networkService;

  Repositery({this.networkService});

  Future<bool> userSignUp(
    SignUpModel signUpModel,
  ) async {
    return await networkService.userSignUp(signUpModel);
  }

  Future<bool> confirmUser(String code, SignUpModel signUpModel) async {
    return await networkService.confirmUser(code, signUpModel);
  }

  Future<UserModel> login(String username, String passoword) async {
    List<dynamic> rawData = await networkService.login(username, passoword);
    return _loggedInUser(rawData);
  }

  UserModel _loggedInUser(List<dynamic> rawData) {
    if (rawData == null) {
      return null;
    }
    final userId = rawData
        .firstWhere((element) => element.userAttributeKey == 'sub')
        .value;
    final birthdate = rawData
        .firstWhere((element) => element.userAttributeKey == 'birthdate')
        .value;
    final phone_number = rawData
        .firstWhere((element) => element.userAttributeKey == 'phone_number')
        .value;
    final family_name = rawData
        .firstWhere((element) => element.userAttributeKey == 'family_name')
        .value;
    final given_name = rawData
        .firstWhere((element) => element.userAttributeKey == 'given_name')
        .value;
    final email = rawData
        .firstWhere((element) => element.userAttributeKey == 'email')
        .value;
    final gender = rawData
        .firstWhere((element) => element.userAttributeKey == 'gender')
        .value;
    UserModel newUser = UserModel(
        email: email,
        userId: userId,
        firstName: family_name,
        lastName: given_name,
        phone: phone_number,
        dob: DateTime(birthdate),
        gender: gender);

    return newUser;
  }

  Future<UserModel> autoLogin() async {
    List<dynamic> rawData = await networkService.attempAutoLogin();
    return _loggedInUser(rawData);
  }
}
