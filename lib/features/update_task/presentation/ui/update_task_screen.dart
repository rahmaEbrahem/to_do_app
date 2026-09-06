import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/helper/extentions.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/features/home_screen/data/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/core/widgets/custom_container.dart';
import 'package:to_do_app/core/widgets/custom_text_field.dart';
import 'package:to_do_app/features/update_task/data/model/update_task_request_body.dart';
import 'package:to_do_app/features/update_task/presentation/cubit/updatetask_cubit.dart';

class UpdateTaskScreen extends StatefulWidget {
  final Data task;

  const UpdateTaskScreen({super.key, required this.task});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  final formkey = GlobalKey<FormState>();

  late TextEditingController titlecontroller;
  late TextEditingController descriptioncontroller;
  late TextEditingController datecontroller;

  String? selectedStatus;
  String? selectedPriority;

  @override
  void initState() {
    super.initState();

    titlecontroller = TextEditingController(text: widget.task.title ?? "");

    descriptioncontroller = TextEditingController(
      text: widget.task.description ?? "",
    );

    datecontroller = TextEditingController(
      text: widget.task.deliveryDate ?? "",
    );

    selectedStatus = widget.task.status;
    selectedPriority = widget.task.priority;
  }

  @override
  void dispose() {
    titlecontroller.dispose();
    descriptioncontroller.dispose();
    datecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text("Edit Task"),
      ),

      body: BlocConsumer<UpdateTaskCubit, UpdateTaskState>(
        listener: (context, state) {
          if (state is UpdateTaskSuccess) {
            Navigator.pop(context);
          }

          if (state is UpdateTaskError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Failed to update task")),
            );
          }
        },
        builder: (context, State) {
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
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

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
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

                    CustomTextField(
                      subtitle: "Date",
                      descripe: "Enter the Date",
                      controller: datecontroller,
                      keyboardtype: TextInputType.name,
                      readonly: true,
                      validator: (v) {
                        if (v == null || v.isEmpty) {
                          return "Date is required";
                        }
                        return null;
                      },
                      onTap: () {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                        ).then((value) {
                          if (value != null) {
                            datecontroller.text =
                                "${value.year}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}";
                          }
                        });
                      },
                    ),

                    const SizedBox(height: 15),

                    Text("Status", style: AppTextStyles.fieldsubtitles),

                    const SizedBox(height: 8),

                    DropdownButtonFormField<String>(
                      initialValue: selectedStatus,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: "pending",
                          child: Text("Pending"),
                        ),
                        DropdownMenuItem(
                          value: "completed",
                          child: Text("Completed"),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedStatus = value;
                        });
                      },
                    ),

                    const SizedBox(height: 15),

                    Text("Priority", style: AppTextStyles.fieldsubtitles),

                    const SizedBox(height: 8),

                    DropdownButtonFormField<String>(
                      value: selectedPriority,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: const [
                        DropdownMenuItem(value: "low", child: Text("Low")),
                        DropdownMenuItem(
                          value: "medium",
                          child: Text("Medium"),
                        ),
                        DropdownMenuItem(value: "high", child: Text("High")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedPriority = value;
                        });
                      },
                    ),

                    const SizedBox(height: 25),
                    CustomContainer(
                      title: "Update",
                      onTap: () {
                        if (formkey.currentState?.validate() ?? false) {
                          if (selectedStatus == null ||
                              selectedPriority == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please select status and priority",
                                ),
                              ),
                            );
                            return;
                          }

                          context.read<UpdateTaskCubit>().updateTask(
                            widget.task.taskId!,
                            UpdateTaskRequestBody(
                              title: titlecontroller.text,
                              description: descriptioncontroller.text,
                              status: selectedStatus!,
                              priority: selectedPriority!,
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
