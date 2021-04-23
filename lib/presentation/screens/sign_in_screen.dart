import 'package:flutter/material.dart';
import 'package:socialdoormobile/data/models/type_login.dart';
import 'package:socialdoormobile/presentation/screens/forget_password_acreen.dart';
import 'package:socialdoormobile/presentation/screens/sign_in_with_email_screen.dart';
import 'package:socialdoormobile/presentation/screens/signup_screen.dart';
import 'package:socialdoormobile/presentation/widgets/footer_login.dart';
import 'package:socialdoormobile/presentation/widgets/login_fresh.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  onClickFun() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => LoginWithUserEmailScreen(
            logo: TypeLogo.blueLogo,
            callLogin: () {},
            isResetPassword: true,
            widgetResetPassword: ForgetPasswordScreen(
                funResetPassword: () {}, logo: TypeLogo.blueLogo)),
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
