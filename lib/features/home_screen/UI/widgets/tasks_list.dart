import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/utils/app_constant_box.dart';
import 'package:to_do_app/features/add_task.dart/data/model/task_model.dart';
import 'package:to_do_app/features/home_screen/UI/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    List<TaskModel> alltasks = Hive.box<TaskModel>(
      AppConstantBox.taskbox,
    ).values.toList();
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return TaskItem(tasks: alltasks[index]);
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 12);
        },
        itemCount: alltasks.length,
      ),
    );
  }
}
