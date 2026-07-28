import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/core/utils/app_constant_box.dart';
import 'package:to_do_app/core/widgets/custom_container.dart';
import 'package:to_do_app/core/widgets/custom_text_field.dart';
import 'package:to_do_app/features/add_task.dart/data/model/task_model.dart';
import 'package:to_do_app/features/add_task.dart/ui/widgets/task_colors_list.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var formkey = GlobalKey<FormState>();
  var titlecontroller = TextEditingController();
  var descriptioncontroller = TextEditingController();
  var datecontroller = TextEditingController();
  int? color;
  void saveToHive() {
    final title = titlecontroller.text;
    final description = descriptioncontroller.text;
    final date = datecontroller.text;
  }

  @override
  void dispose() {
    titlecontroller.dispose();
    descriptioncontroller.dispose();
    datecontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_outlined),
        title: Text("Add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  subtitle: "Task Title",
                  descripe: "Enter the title",
                  controller: titlecontroller,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "task name is required";
                    }
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  subtitle: "Description",
                  lines: 5,
                  descripe: "Enter task Description...",
                  controller: descriptioncontroller,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "task description is required";
                    }
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  subtitle: "Date",
                  descripe: "Enter the Date",
                  controller: datecontroller,
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "Date is required";
                    }
                  },
                  readonly: true,
                  onTap: () =>
                      showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      ).then((v) {
                        datecontroller.text = DateFormat.MEd().format(
                          v ?? DateTime.now(),
                        );
                      }),
                ),
                SizedBox(height: 10),
                Text("Choose Color", style: AppTextStyles.fieldsubtitles),
                TaskColorsList(
                  value: (c) {
                    color = c?.toARGB32();
                  },
                ),
                CustomContainer(
                  title: "save",
                  onTap: () {
                    if (color == null) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text("please choose the color"),
                          );
                        },
                      );
                    }
                    if (formkey.currentState?.validate() ?? false) {
                      Hive.box<TaskModel>(AppConstantBox.taskbox)
                          .add(
                            TaskModel(
                              title: titlecontroller.text,
                              description: descriptioncontroller.text,
                              date: datecontroller.text,
                              color: color!,
                            ),
                          )
                          .then((v) {
                            Navigator.pop(context);
                          });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
