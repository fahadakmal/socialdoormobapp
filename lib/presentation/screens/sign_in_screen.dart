import 'package:flutter/material.dart';

import '../../data/models/type_login.dart';
import '../widgets/footer_login.dart';
import '../widgets/login_fresh.dart';
import 'forget_password_acreen.dart';
import 'sign_in_with_email_screen.dart';
import 'signup_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  onClickFun() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => LoginWithUserEmailScreen(),
      ),
    );
  }

  facebookLogin() {}
  @override
  Widget build(BuildContext context) {
    return LoginFresh(
      pathLogo: TypeLogo.blueLogo,
      textColor: Colors.black,
      backgroundColor: Colors.black,
      typeLoginModel: [
        LoginFreshTypeLoginModel(callFunction: () {}, logo: TypeLogo.facebook),
        LoginFreshTypeLoginModel(callFunction: () {}, logo: TypeLogo.google),
        LoginFreshTypeLoginModel(
            callFunction: onClickFun, logo: TypeLogo.userPassword)
      ],
      cardColor: Colors.white,
      widgetFooter: LoginFreshFooter(
        funFooterLogin: () {},
        logo: TypeLogo.apple,
        text: 'Powered By',
        textColor: Colors.black,
      ),
      isSignUp: true,
      widgetSignUp: SignUpScreen(),
      // isFooter: true
    );
  }
}
