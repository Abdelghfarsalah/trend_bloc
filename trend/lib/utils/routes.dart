import 'package:flutter/material.dart';
import 'package:trend/features/authentication/presentation/pages/login.dart';
import 'package:trend/features/authentication/presentation/pages/reset_password.dart';
import 'package:trend/features/authentication/presentation/pages/signup.dart';
import 'package:trend/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:trend/features/home/presentation/home_page.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String resetPassword = '/reset-password';
}

Map<String, WidgetBuilder> routes = {
  AppRoutes.login: (context) => LoginPage(),
  AppRoutes.signup: (context) => SignupPage(),
  AppRoutes.resetPassword: (context) => ResetPasswordPage(),
  AppRoutes.home: (context) => MainScreen(),
};

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.resetPassword:
      return MaterialPageRoute(builder: (_) => ResetPasswordPage());
    case AppRoutes.login:
      return MaterialPageRoute(builder: (_) => LoginPage());
    case AppRoutes.signup:
      return MaterialPageRoute(builder: (_) => SignupPage());
    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => HomePage());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('404: Page not found'),
          ),
        ),
      );
  }
}
