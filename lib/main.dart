import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/utils/app_constant_box.dart';
import 'package:to_do_app/features/add_task.dart/data/model/task_model.dart';
import 'package:to_do_app/features/login_screen/data/models/user_model.dart';
import 'package:to_do_app/to_do_app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<UserModel>(AppConstantBox.userbox);
  await Hive.openBox<TaskModel>(AppConstantBox.taskbox);
  runApp(const ToDoApp());
}
