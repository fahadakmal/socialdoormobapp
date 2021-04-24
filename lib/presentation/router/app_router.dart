import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/route_constants.dart';
import '../../data/models/sign_up_model.dart';
import '../screens/confirm_user_screen.dart';
import '../screens/signup_screen.dart';

import '../screens/splash_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => SplashScreen(
                // title: 'HomeScreen',
                ));
        break;
      case SIGNUP_USER_ROUTE:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
        break;
      case CONFIRM_USER_ROUTE:
        final signupModel = routeSettings.arguments as SignUpModel;
        return MaterialPageRoute(
            builder: (_) => ConfirmUserScreen(signUpModel: signupModel));
        break;
      default:
        return null;
    }
  }
}
