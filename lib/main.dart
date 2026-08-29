import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/helper/app_preferences.dart';
import 'package:to_do_app/core/network/dio_factory.dart';
import 'package:to_do_app/core/utils/app_constant_box.dart';
import 'package:to_do_app/features/add_task.dart/data/model/task_model.dart';
import 'package:to_do_app/to_do_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();
  DioFactory.init();
  // await Hive.initFlutter();
  // Hive.registerAdapter(UserModelAdapter());
  // Hive.registerAdapter(TaskModelAdapter());
  // await Hive.openBox<UserModel>(AppConstantBox.userbox);
  // await Hive.openBox<TaskModel>(AppConstantBox.taskbox);
  runApp(const ToDoApp());
}
