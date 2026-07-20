import 'package:flutter/material.dart';
import 'package:to_do_app/features/home_screen/UI/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return TaskItem();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 12);
        },
        itemCount: 10,
      ),
    );
  }
}
