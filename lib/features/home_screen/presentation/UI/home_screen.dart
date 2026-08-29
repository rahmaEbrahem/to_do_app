import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/features/add_task.dart/presentation/ui/add_task_screen.dart';
import 'package:to_do_app/features/home_screen/presentation/UI/widgets/home_app_header.dart';
import 'package:to_do_app/features/home_screen/presentation/UI/widgets/home_card.dart';
import 'package:to_do_app/features/home_screen/presentation/UI/widgets/tasks_list.dart';
import 'package:to_do_app/features/home_screen/presentation/cubit/home_cubit.dart';

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
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeSuccess) {
              final myTasks = state.homeModel.data ?? [];
              final total = myTasks.length;
              final done = myTasks
                  .where((task) => task.status == "done")
                  .length;
              final pending = myTasks
                  .where((task) => task.status == "pending")
                  .length;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeAppHeader(),
                    10.verticalSpace,
                    HomeCard(total: total, done: done, pending: pending),
                    10.verticalSpace,
                    Text("Today's Tasks", style: AppTextStyles.titles),
                    10.verticalSpace,
                    TasksList(alltasks: myTasks),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("Something went wrong"));
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );

          if (context.mounted) {
            context.read<HomeCubit>().getTasks();
          }
        },
        label: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [Icon(Icons.add), SizedBox(width: 5), Text("Task")],
        ),
      ),
    );
  }
}
