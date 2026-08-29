import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/core/utils/app_constant_box.dart';
import 'package:to_do_app/features/add_task.dart/data/model/task_model.dart';
import 'package:to_do_app/features/add_task.dart/presentation/ui/add_task_screen.dart';
import 'package:to_do_app/features/home_screen/presentation/UI/widgets/home_app_header.dart';
import 'package:to_do_app/features/home_screen/presentation/UI/widgets/home_card.dart';
import 'package:to_do_app/features/home_screen/presentation/UI/widgets/task_item.dart';
import 'package:to_do_app/features/home_screen/presentation/UI/widgets/tasks_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: Hive.box<TaskModel>(
            AppConstantBox.taskbox,
          ).listenable(),
          builder: (context, Box box, child) {
            final myTasks = box.values.cast<TaskModel>().toList();
            int total = myTasks.length;
            int done = myTasks.where((t) => t.status == "done").length;
            int pending = myTasks
                .where((element) => element.status == "pending")
                .length;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeAppHeader(),
                  SizedBox(height: 10),
                  HomeCard(total: total, done: done, pending: pending),
                  SizedBox(height: 10),
                  Text("Today's Tasks", style: AppTextStyles.titles),
                  SizedBox(height: 10),
                  TasksList(alltasks: myTasks),
                ],
              ),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddTaskScreen();
              },
            ),
          );
          setState(() {});
        },
        label: Row(children: [Icon(Icons.add), Text("Task")]),
      ),
    );
  }
}
