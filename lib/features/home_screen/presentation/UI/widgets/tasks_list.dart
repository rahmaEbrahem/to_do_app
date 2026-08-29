import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/core/utils/app_constant_box.dart';
import 'package:to_do_app/features/add_task.dart/data/model/task_model.dart';
import 'package:to_do_app/features/home_screen/data/model/home_model.dart';
import 'package:to_do_app/features/home_screen/presentation/UI/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  final List<Data> alltasks;

  const TasksList({super.key, required this.alltasks});

  @override
  Widget build(BuildContext context) {
    if (alltasks.isEmpty) {
      return Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text("NO tasks today!", style: AppTextStyles.titles),
          ],
        ),
      );
    }

    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          final task = alltasks[index];

          return TaskItem(task: task);
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 12);
        },
        itemCount: alltasks.length,
      ),
    );
  }
}
