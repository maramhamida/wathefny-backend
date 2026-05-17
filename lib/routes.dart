import 'package:flutter/material.dart';
import 'package:wathefny/jobseeker_screen.dart';
import 'package:wathefny/signup_screen.dart';
import 'splash_screen.dart';
import 'login_screen.dart';

class Routes {
  // تعريف أسماء المسارات
  static const String splash = '/';
  static const String login = '/login';

  static const String signup = '/signup';
  static const String createjobseeker = '/jobseeker';
  // خريطة المسارات مع الصفحات
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => SplashScreenWidget(),
      login: (context) => LoginScreen(),
      signup: (context) => SignUpScreen(),
      createjobseeker: (context) => jobseeker(),
    };
  }
}
