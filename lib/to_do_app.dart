import 'package:flutter/material.dart';
import 'package:to_do_app/features/splash/ui/splash_screen.dart';

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey.shade50,
        fontFamily: "GoogleSans",
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
