import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/core/utils/app_constant_box.dart';
import 'package:to_do_app/features/auth/regester_screen/presentation/ui/register_screen.dart';
import 'package:to_do_app/features/home_screen/presentation/UI/home_screen.dart';
import 'package:to_do_app/features/auth/login_screen/data/models/user_model.dart';
import 'package:to_do_app/features/auth/login_screen/presentation/ui/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()),
      );
    });
    super.initState();
  }

  // Widget nextRoute() {
  //   if (Hive.box<UserModel>(AppConstantBox.userbox).isEmpty) {
  //     return LoginScreen();
  //   } else {
  //     return HomeScreen();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lottie/2sec checklist (1).json"),
      ),
    );
  }
}
