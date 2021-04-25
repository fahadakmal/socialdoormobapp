class SignUpModel {
  String email;
  String password;
  String repeatPassword;
  String firstName;
  String lastName;
  String phone;
  DateTime dob;
  int gender = 1;

  SignUpModel({
    this.email,
    this.password,
    this.repeatPassword,
    this.firstName,
    this.lastName,
    this.phone,
    this.dob,
    this.gender,
  });
}
