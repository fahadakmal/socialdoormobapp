import 'package:socialdoormobile/data/network_service.dart';

class Repositery {
  final NetworkService networkService;

  Repositery({this.networkService});

  Future<bool> userSignUp(String email, String password) async {
    return await networkService.userSignUp(email, password);
  }
}
