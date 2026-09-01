import 'package:flutter/material.dart';
import 'package:to_do_app/core/helper/app_preferences.dart';
import 'package:to_do_app/core/network/dio_factory.dart';
import 'package:to_do_app/to_do_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();
  DioFactory.init();

  runApp(const ToDoApp());
}
