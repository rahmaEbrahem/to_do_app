import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/features/home_screen/data/model/home_model.dart';
import 'package:to_do_app/features/home_screen/presentation/UI/task_details.dart';
import 'package:to_do_app/features/home_screen/presentation/cubit/home_cubit.dart';
import 'package:to_do_app/features/update_task/presentation/cubit/updatetask_cubit.dart';
import 'package:to_do_app/features/update_task/presentation/ui/update_task_screen.dart';

class TaskItem extends StatelessWidget {
  final Data task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 5,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetailsScreen(task: task),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(task.title ?? "", style: AppTextStyles.titles),

                    Text(
                      task.description ?? "",
                      style: AppTextStyles.hinttitles,
                    ),

                    Text(
                      task.status ?? "pending",
                      style: AppTextStyles.fieldsubtitles,
                    ),

                    Text(
                      task.deliveryDate ?? "",
                      style: AppTextStyles.hinttitles,
                    ),
                  ],
                ),
              ),

              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) => UpdateTaskCubit(),
                        child: UpdateTaskScreen(task: task),
                      ),
                    ),
                  );

                  if (context.mounted) {
                    context.read<HomeCubit>().getTasks();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
