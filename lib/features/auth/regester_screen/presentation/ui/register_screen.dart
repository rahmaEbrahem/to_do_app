import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import 'package:to_do_app/core/theme/app_text_styles.dart';
import 'package:to_do_app/core/widgets/custom_container.dart';
import 'package:to_do_app/core/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey.shade100,
                radius: 45,
                child: Icon(Icons.list_alt_outlined, size: 40.h),
              ),
              20.verticalSpace,
              Text("Welcome to TO DO", style: AppTextStyles.titles),
              10.verticalSpace,
              Text(
                "create an account and join us now!",
                style: AppTextStyles.fieldsubtitles,
              ),
              10.verticalSpace,
              CustomTextField(subtitle: "NAME", descripe: "Enter Your name"),
              10.verticalSpace,
              CustomTextField(subtitle: "Email", descripe: "Enter Your Email"),
              10.verticalSpace,
              CustomTextField(
                subtitle: "Password",
                descripe: "Enter your Password",
              ),
              10.verticalSpace,
              CustomTextField(
                subtitle: "Password confirmation",
                descripe: "Please confirm the Password",
              ),
              20.verticalSpace,
              CustomContainer(title: "Sing Up"),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: AppTextStyles.containtitles,
                  ),
                  Text(
                    "Sing in",
                    style: AppTextStyles.containtitles.copyWith(
                      color: AppColors.maincolor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
