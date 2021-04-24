import 'models/sign_up_model.dart';
import 'network_service.dart';

class Repositery {
  final NetworkService networkService;

  Repositery({this.networkService});

  Future<bool> userSignUp(SignUpModel signUpModel, String password) async {
    return await networkService.userSignUp(signUpModel, password);
  }

  Future<bool> confirmUser(String code, SignUpModel signUpModel) async {
    return await networkService.confirmUser(code, signUpModel);
  }

  Future<bool> login(String username, String passoword) async {
    return await networkService.login(username, passoword);
  }
}
