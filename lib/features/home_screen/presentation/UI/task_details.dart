import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/features/home_screen/data/model/home_model.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Data task;

  const TaskDetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task Details")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title", style: AppTextStyles.hinttitles),
            const SizedBox(height: 5),

            Text(task.title ?? "", style: AppTextStyles.titles),

            const SizedBox(height: 20),

            Text("Description", style: AppTextStyles.hinttitles),
            const SizedBox(height: 5),

            Text(task.description ?? "", style: AppTextStyles.fieldsubtitles),

            const SizedBox(height: 20),

            Text("Status", style: AppTextStyles.hinttitles),
            const SizedBox(height: 5),

            Text(
              task.status ?? "Not available",
              style: AppTextStyles.fieldsubtitles,
            ),

            const SizedBox(height: 20),

            Text("Priority", style: AppTextStyles.hinttitles),
            const SizedBox(height: 5),

            Text(
              task.priority ?? "Not available",
              style: AppTextStyles.fieldsubtitles,
            ),

            const SizedBox(height: 20),

            Text("Delivery Date", style: AppTextStyles.hinttitles),
            const SizedBox(height: 5),

            Text(
              task.deliveryDate ?? "Not available",
              style: AppTextStyles.fieldsubtitles,
            ),

            const SizedBox(height: 20),

            Text("Created At", style: AppTextStyles.hinttitles),
            const SizedBox(height: 5),

            Text(
              task.createdAt ?? "Not available",
              style: AppTextStyles.fieldsubtitles,
            ),
          ],
        ),
      ),
    );
  }
}
