import 'package:meta/meta.dart';

class UserModel {
  String email;
  String firstName;
  String lastName;
  String phone;
  DateTime dob;
  int gender = 1;
  String userId;

  UserModel({
    @required this.email,
    @required this.userId,
    @required this.firstName,
    @required this.lastName,
    @required this.phone,
    @required this.dob,
    @required this.gender,
  });
}
