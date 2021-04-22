import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      // case '/second':
      //   return MaterialPageRoute(
      //       builder: (_) => LoginScreen(
      //             title: 'SecondScreen',
      //             color: Colors.green,
      //           ));
      //   break;
      // case '/third':
      //   return MaterialPageRoute(
      //       builder: (_) => SignUpScreen(
      //             title: 'ThirdScreen',
      //             color: Colors.yellow,
      //           ));
      //   break;
      default:
        return null;
    }
  }
}
