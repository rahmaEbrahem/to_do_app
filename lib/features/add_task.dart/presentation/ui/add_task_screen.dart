import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/core/helper/extentions.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/core/widgets/custom_container.dart';
import 'package:to_do_app/core/widgets/custom_text_field.dart';
import 'package:to_do_app/features/add_task.dart/data/model/addtask_request_body.dart';
import 'package:to_do_app/features/add_task.dart/presentation/cubit/addtask_cubit.dart';

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
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Add Task"),
      ),
      body: BlocConsumer<AddtaskCubit, AddtaskState>(
        listener: (context, state) {
          if (state is Addtasksuccess) {
            Navigator.pop(context);
          }

          if (state is Addtaskerror) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Failed to add task")));
          }
        },
        builder: (context, state) {
          return Padding(
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
                      keyboardtype: TextInputType.name,
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
                      keyboardtype: TextInputType.name,
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
                      keyboardtype: TextInputType.name,
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
                            if (v != null) {
                              datecontroller.text = DateFormat(
                                "yyyy-MM-dd",
                              ).format(v);
                            }
                          }),
                    ),
                    SizedBox(height: 10),
                    CustomContainer(
                      title: "save",
                      onTap: () {
                        if (formkey.currentState?.validate() ?? false) {
                          context.read<AddtaskCubit>().addTask(
                            AddTaskRequestBody(
                              title: titlecontroller.text,
                              description: descriptioncontroller.text,
                              deliveryDate: datecontroller.text,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
