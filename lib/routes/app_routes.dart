import 'package:auth_mobile_app/core/app_export.dart';
import 'package:auth_mobile_app/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:auth_mobile_app/presentation/log_in_screen/log_in_screen.dart';
import 'package:auth_mobile_app/presentation/profile_screen/profile_screen.dart';
import 'package:auth_mobile_app/presentation/register_screen/register_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String logInScreen = '/log_in_screen';

  static const String registerScreen = '/register_screen';

  static const String profileScreen = '/profile_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        logInScreen: LogInScreen.builder,
        registerScreen: RegisterScreen.builder,
        profileScreen: ProfileScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: PrefUtils().getRememberMe()
            ? ProfileScreen.builder
            : LogInScreen.builder
      };
}
