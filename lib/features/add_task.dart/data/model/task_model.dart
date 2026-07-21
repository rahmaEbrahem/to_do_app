import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'task_model.g.dart';

@HiveType(typeId: 1)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String date;
  @HiveField(3)
  int color;
  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });
}
