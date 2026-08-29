import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/routes/routes.dart';
import 'package:to_do_app/features/add_task.dart/presentation/ui/add_task_screen.dart';
import 'package:to_do_app/features/home_screen/presentation/UI/home_screen.dart';
import 'package:to_do_app/features/auth/login_screen/presentation/ui/login_screen.dart';
import 'package:to_do_app/features/splash/presentation/ui/splash_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.splashscreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case Routes.loginscreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case Routes.homescreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case Routes.addtaskscreen:
        return MaterialPageRoute(builder: (context) => AddTaskScreen());
    }
  }
}
