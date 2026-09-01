import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/core/helper/extentions.dart';
import 'package:to_do_app/core/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      context.pushReplacement(Routes.registerscreen);
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
