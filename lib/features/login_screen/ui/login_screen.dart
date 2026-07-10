import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/core/widgets/custom_container.dart';
import 'package:to_do_app/core/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 300),
              CircleAvatar(
                backgroundColor: Colors.blueGrey.shade100,
                radius: 45,
                child: Icon(Icons.person, size: 40),
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
              CustomContainer(title: "Continue"),
            ],
          ),
        ),
      ),
    );
  }
}
