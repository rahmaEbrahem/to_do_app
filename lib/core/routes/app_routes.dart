import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/routes/routes.dart';
import 'package:to_do_app/features/add_task.dart/presentation/ui/add_task_screen.dart';
import 'package:to_do_app/features/auth/regester_screen/presentation/cubit/register_cubit.dart';
import 'package:to_do_app/features/auth/regester_screen/presentation/ui/register_screen.dart';
import 'package:to_do_app/features/home_screen/presentation/UI/home_screen.dart';
import 'package:to_do_app/features/auth/login_screen/presentation/ui/login_screen.dart';
import 'package:to_do_app/features/splash/presentation/ui/splash_screen.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.splashscreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case Routes.registerscreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: RegisterScreen(),
          ),
        );
      case Routes.loginscreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case Routes.homescreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case Routes.addtaskscreen:
        return MaterialPageRoute(builder: (context) => AddTaskScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("404 not found")],
              ),
            ),
          ),
        );
    }
  }
}
