import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/core/utils/app_constant_box.dart';
import 'package:to_do_app/core/widgets/custom_container.dart';
import 'package:to_do_app/core/widgets/custom_text_field.dart';
import 'package:to_do_app/features/login_screen/data/models/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final picker = ImagePicker();
  XFile? image;
  var formkey = GlobalKey<FormState>();
  void pickfromgallary() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  void pickfromcamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 300),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("choose"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                pickfromgallary();
                              },
                              child: Icon(Icons.browse_gallery),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                pickfromcamera();
                              },
                              child: Icon(Icons.camera),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.blueGrey.shade100,
                    radius: 45,
                    backgroundImage: image != null
                        ? Image.file(File(image?.path ?? "")).image
                        : null,
                    child: image != null ? null : Icon(Icons.person, size: 40),
                  ),
                ),
                SizedBox(height: 15),
                Text("Create Your Profile", style: AppTextStyles.titles),
                SizedBox(height: 10),
                Text(
                  "Add your name and profile picture",
                  style: AppTextStyles.hinttitles,
                ),
                SizedBox(height: 20),
                CustomTextField(subtitle: "full Name"),
                SizedBox(height: 15),
                CustomContainer(
                  title: "Continue",
                  onTap: () {
                    formkey.currentState?.validate();
                    if (image == null) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('error'),
                            content: Text("please inter your photo"),
                          );
                        },
                      );
                    }
                    Hive.box<UserModel>(
                      AppConstantBox.userbox,
                    ).add(UserModel(image: image?.path ?? "", name: ""));
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
