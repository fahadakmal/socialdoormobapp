class ConstantWords {
  String loginWith;
  String login;
  String exploreApp;
  String notAccount;
  String signUp;
  String textLoading;
  String hintLoginUser;
  String hintLoginPassword;
  String hintSignUpRepeatPassword;
  String hintName;
  String hintSurname;

  String recoverPassword;

  String messageRecoverPassword;
  String confirm_user;
  String hintFirstName;
  String hintLastName;
  String hintdateOfBirth;
  String hintGender;
  String hintPhoneNumber;

  ConstantWords(
      {this.hintPhoneNumber = "Phone",
      this.loginWith = 'Login With',
      this.hintFirstName = 'First Name',
      this.hintLastName = 'Last Name',
      this.hintSurname = 'Surname',
      this.hintSignUpRepeatPassword = 'Repeat Password',
      this.hintLoginPassword = 'Password',
      this.recoverPassword = 'Recover Password',
      this.confirm_user = 'Verify your Identity',
      this.hintGender = 'Gender',
      this.hintdateOfBirth = 'Date of Birth',
      this.messageRecoverPassword =
          'To recover the password, enter the email and press send email, you will receive an email so you can update your password. Only available for accounts created by username and password',
      this.hintLoginUser = 'Username or email',
      this.login = 'Login',
      this.exploreApp = 'Explore App',
      this.notAccount = 'You dot not have an account?',
      this.signUp = 'Sign Up',
      this.textLoading = 'please wait ...'});
}
