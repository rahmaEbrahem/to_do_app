import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/features/add_task.dart/data/model/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel tasks;
  const TaskItem({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 20,
              decoration: BoxDecoration(
                color: Color(tasks.color),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(tasks.title, style: AppTextStyles.titles),
                  Text(tasks.description, style: AppTextStyles.hinttitles),
                  Container(
                    height: 30,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(tasks.color).withValues(alpha: 4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "padding",
                        style: AppTextStyles.containtitles.copyWith(
                          color: Color(tasks.color),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
