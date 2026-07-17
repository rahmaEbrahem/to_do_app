import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/features/login_screen/data/models/user_model.dart';
import 'package:to_do_app/to_do_app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>("user");
  runApp(const ToDoApp());
}
