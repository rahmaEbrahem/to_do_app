import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/features/add_task.dart/ui/add_task_screen.dart';
import 'package:to_do_app/features/home_screen/UI/widgets/home_app_header.dart';
import 'package:to_do_app/features/home_screen/UI/widgets/home_card.dart';
import 'package:to_do_app/features/home_screen/UI/widgets/task_item.dart';
import 'package:to_do_app/features/home_screen/UI/widgets/tasks_list.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeAppHeader(),
              SizedBox(height: 10),
              HomeCard(),
              SizedBox(height: 10),
              Text("Today's Tasks", style: AppTextStyles.titles),
              SizedBox(height: 10),
              TasksList(),
            ],
          ),
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
